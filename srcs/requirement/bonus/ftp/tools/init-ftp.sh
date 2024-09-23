#!/bin/bash
sleep 15

adduser --disabled-password --gecos "" $ftp_user

echo "$ftp_user:$ftp_pwd" | chpasswd

vsftpd /etc/vsftpd.conf
