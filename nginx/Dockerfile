# base image
FROM    debian:12-slim

# install nginx and openssl keys and certificates
RUN     apt update && apt -y install nginx && apt install -y openssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt -subj="/CN=otaraki/O=otaraki.1337.ma/C=MA/L=KHOURIBGA"

# copy the default configuration into the container
COPY    ./conf/default /etc/nginx/sites-available/default

EXPOSE 443:443

# running the nginx in daemon mode
CMD     ["nginx", "-g", "daemon off;"]