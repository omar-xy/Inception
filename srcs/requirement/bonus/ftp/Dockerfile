FROM debian:stable

RUN apt-get update && apt-get install -y \
    vsftpd \
    wget

RUN /etc/init.d/vsftpd stop

# RUN mkdir -p /var/run/vsftpd/empty \
#  && mkdir -p /etc/vsftpd \
#  && mkdir -p /var/ftp \
#  && mv /etc/vsftpd.conf /etc/vsftpd.orig \
#  && mkdir /etc/service/vsftpd

COPY ./init-ftp.sh /exc


RUN chmod -R +x /exc

EXPOSE 20-21
EXPOSE 65500-65515


ENTRYPOINT [ "sh", "/exc/init-ftp.sh" ]