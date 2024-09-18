#!/bin/bash
sleep 15

adduser $ftp_user --disabled-password

echo "$ftp_user:$ftp_pwd" | chpasswd

# chown -R "$ftp_user:$ftp_user" /var/www/html

vsftpd /etc/vsftpd.conf
