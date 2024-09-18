FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nginx -y

COPY ./conf/default /etc/nginx/sites-available/
COPY /tools/index.html /var/www/html/
COPY /tools/index.css /var/www/html/css
COPY /tools/index.png /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
