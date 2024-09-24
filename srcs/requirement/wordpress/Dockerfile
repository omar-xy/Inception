# base image
FROM debian:bullseye

RUN apt-get update && apt-get install -y php php-curl php-mysql\
     php7.4-fpm\
     curl \
     sendmail

COPY ./tools/cmds.sh /tmp/

COPY ./conf/default /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod +x /tmp/cmds.sh

EXPOSE 9000

CMD ["/tmp/cmds.sh"]
