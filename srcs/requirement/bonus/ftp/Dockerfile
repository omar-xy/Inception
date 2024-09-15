FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y vsftpd


COPY  ./tools/init-ftp.sh /usr/local/bin




ENTRYPOINT [ "/usr/local/bin/init-ftp.sh" ]

# CMD ["/usr/sbin/vsftpd"]
