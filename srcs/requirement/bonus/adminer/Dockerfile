FROM debian:bullseye

RUN apt-get update && apt-get install -y wget \
    php \
    php-mysql


WORKDIR /var/www/html

RUN wget --no-check-certificate  -O adminer.php https://www.adminer.org/latest.php


CMD  ["php", "-S",  "0.0.0.0:8080", "-t", "/var/www/html", "/var/www/html/adminer.php"]
