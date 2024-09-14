FROM debian:stable

RUN apt-get update && apt-get install -y \
    vsftpd \
    wget

RUN /etc/init.d/vsftpd stop

RUN mkdir -p /exc

COPY ./init-ftp.sh /exc

RUN chmod 775 -R /exc
RUN chmod 775  /etc/vsftpd.conf

RUN chown -R root:root /exc

EXPOSE 20-21

EXPOSE 65500-65515

WORKDIR /exc

CMD [ "sh", "./init-ftp.sh" ]
