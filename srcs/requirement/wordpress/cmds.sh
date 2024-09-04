#!/bin/bash

cd /var/www/html

rm -rf *

curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /bin/wp
 
wp core download --allow-root
touch wp-config.php && chmod +x wp-config.php
cp wp-config-sample.php wp-config.php


wp config set DB_HOST mariadb --type=constant --allow-root
wp config set DB_NAME $MYSQL_DATABASE --path=/var/www/html --allow-root
wp config set DB_USER $MYSQL_USER --path=/var/www/html --allow-root
wp config set DB_PASSWORD $MYSQL_PASSWORD --path=/var/www/html --allow-root
wp config set WP_REDIS_HOST $REDIS_HOST --allow-root
wp config set WP_REDIS_PORT $REDIS_PORT --allow-root


chmod 600 wp-config.php


chmod 776 -R /var/www/html

chown -R www-data:www-data /var/www/html

wp core install --url=localhost --title=wordpress --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root

wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

mkdir -p /run/php
# php-fpm7.4 -F
exec php-fpm7.4 -F

