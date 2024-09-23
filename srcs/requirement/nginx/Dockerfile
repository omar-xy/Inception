# base image
FROM    debian:stable

# install nginx and openssl keys and certificates

RUN     apt update && apt -y install nginx \
        openssl \
        && openssl req -x509 -nodes \
        -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/server.key \
        -out /etc/ssl/certs/server.crt \
        -subj="/O=42/C=MA/L=KHOURIBGA/CN=login.42.fr/UID=login"

# copy the default configuration into the container
COPY   ./conf/default /etc/nginx/sites-available/default


EXPOSE 443

# running the nginx in daemon mode
ENTRYPOINT [ "nginx" ]

# setting flags to the entrypoint
CMD     ["-g", "daemon off;"]
