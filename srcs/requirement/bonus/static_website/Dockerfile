FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nginx -y

COPY ./conf/default /etc/nginx/sites-available/default
COPY /tools/index.html /var/www/html/

RUN  mkdir -p /var/www/html/css && chmod 765 /var/www/html/css
COPY /tools/index.css /var/www/html/css/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
