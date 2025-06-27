FROM debian:12.7

# Atualizar e instalar dependências do Apache2, OpenSSL e PHP
RUN apt-get update && \
    apt-get install -y apache2 openssl && \
    apt-get install -y php8.2 php8.2-bcmath php8.2-curl php8.2-gd php8.2-gmp \
    php8.2-iconv php8.2-ldap php8.2-mbstring php8.2-mcrypt php8.2-mysqli \
    php8.2-xml git vim

# Ativar módulo SSL do Apache2
RUN a2enmod ssl

# Configuração do PHP.ini
RUN echo "max_execution_time = 60" >> /etc/php/8.2/apache2/php.ini

# cria pasta SK
RUN mkdir /var/www/sk && chown www-data:www-data /var/www/sk -R  && chmod 750  /var/www/sk -R

# Configurações para os volumes dos certificados e arquivos www
VOLUME ["/etc/apache2/ssl", "/var/www/html", "/var/www/sk"]


# Copiar o arquivo de configuração SSL para o Apache2
COPY apache-ssl.conf /etc/apache2/sites-available/default-ssl.conf

# ATIVAR SITE SSL DO APACHE2
RUN a2ensite default-ssl


# EXPOR A PORTA 443 PARA HTTPS
EXPOSE 443

# INICIAR O APACHE2 EM FOREGROUND
CMD ["apache2ctl", "-D", "FOREGROUND"]

