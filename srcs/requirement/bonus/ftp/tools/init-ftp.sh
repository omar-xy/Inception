#!/bin/bash
sleep 15

adduser $ftp_user --disabled-password

echo "$ftp_user:$ftp_pwd" | chpasswd

vsftpd /etc/vsftpd.conf
