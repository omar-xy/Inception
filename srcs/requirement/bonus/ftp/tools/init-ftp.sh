#!/bin/bash
sleep 15
service vsftpd start

cat<<EOF > cr





y
EOF

#set up FTP-USER
adduser --home /var/www/html $ftp_user --disabled-password < cr
rm cr
echo "${ftp_user}:${ftp_pwd}" | /usr/sbin/chpasswd
chown -R $ftp_user:$ftp_user /var/www/html
echo $ftp_user | tee -a /etc/vsftpd.userlist &> /dev/null
adduser ${ftp_user} root > /tmp/tst

/usr/sbin/vsftpd
