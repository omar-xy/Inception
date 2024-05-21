# base image
FROM    debian:buster

# install php and php-curl and php-mysql and php7.3-fpm and curl and sendmail
RUN apt update && apt install -y php php-curl php-mysql\
    && apt install -y php-fpm \
    && apt install -y curl \
    && apt install -y sendmail

# create the /run/php/ used for storing session data, temporary files, or other types of data that is generated and used by PHP while it's running
RUN mkdir -p /run/php/

# copy the cmds.sh into the container
COPY ./cmds.sh /tmp/

# change the permission of cmds.sh
RUN chmod +x /tmp/cmds.sh

# run the cmds.sh
ENTRYPOINT [ "/tmp/cmds.sh" ]

# PHP-FPM to run in the foreground, that is, to not fork into the background as a daemon. This makes it so that the process will run and output any logs to the console where it was started.
CMD [ "php-fpm8.2", "-F" ]

