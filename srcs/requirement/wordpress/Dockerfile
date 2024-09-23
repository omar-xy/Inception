# base image
FROM debian:bullseye

# install php and php-curl and php-mysql and php7.3-fpm and curl and sendmail
RUN apt update && apt-get install -y php php-curl php-mysql\
    && apt-get install -y php7.4-fpm\
    && apt-get install -y curl \
    && apt-get install -y sendmail

# create the /run/php/ used for storing session data, temporary files, or other types of data that is generated and used by PHP while it's running

# copy the cmds.sh into the container
COPY ./tools/cmds.sh /tmp/

COPY ./conf/default /etc/php/7.4/fpm/pool.d/www.conf

# change the permission of cmds.sh
RUN chmod +x /tmp/cmds.sh

# run the cmds.sh
EXPOSE 9000

# PHP-FPM to run in the foreground, that is, to not fork into the background as a daemon. This makes it so that the process will run and output any logs to the console where it was started.
CMD ["/tmp/cmds.sh"]
