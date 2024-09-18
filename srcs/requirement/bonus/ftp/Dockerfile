FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y vsftpd ftp

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY  ./tools/init-ftp.sh /

RUN chmod +x /init-ftp.sh

ENTRYPOINT [ "./init-ftp.sh" ]
