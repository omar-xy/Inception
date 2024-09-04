FROM debian:bullseye

RUN apt update -y && apt install wget && apt install php php-mysqli -y

WORKDIR /var/www

RUN wget --no-check-certificate  -O adminer.php https://www.adminer.org/latest.php && \
    mv adminer.php index.php && chown -R root:root /var/www/


ENTRYPOINT  ["PHP", "-S",  "0.0.0.0:8000"]