FROM debian:bullseye

RUN apt-get update && apt-get install -y wget \
    php \
    php-mysql
    # libapache2

WORKDIR /var/www/html

RUN wget --no-check-certificate  -O adminer.php https://www.adminer.org/latest.php 
# chown -R root:root /var/www/html && \ 
# chmod 775 root:root /var/www/html

CMD  ["php", "-S",  "0.0.0.0:8000", "-t", "/var/www/html", "/var/www/html/adminer.php"]