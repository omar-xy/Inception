FROM debian:stable

RUN apt-get update && apt-get install -y \
    vsftpd \
    wget

RUN /etc/init.d/vsftpd stop

COPY ./init-ftp.sh /etc/service/vsftpd

EXPOSE 20-21
EXPOSE 65500-65515

ENTRYPOINT [ "sh", "./etc/service/vsftpd" ]