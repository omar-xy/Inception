#!/bin/bash
sleep 20

adduser --disabled-password --gecos "" $ftp_user
echo "$ftp_user:$ftp_pwd" | chpasswd

usermod -aG www-data $ftp_user

mkdir -p /empty
chown root:root /empty
chmod 755 /empty

vsftpd /etc/vsftpd.conf
