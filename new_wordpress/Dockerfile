FROM debian:12-slim


RUN apt-get update && apt-get install -y \ 
    nginx \
    php-fpm \
    wget \
    tar \
    unzip \
    && rm -rf /var/lib/apt/lists/*


RUN wget  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chown -R www-data:www-data /var/www/html/wordpress

COPY wordpress-fpm.conf /etc/nginx/conf.d/default.conf

RUN a2ensite wordpress.conf && a2dissite 000-default.conf

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
