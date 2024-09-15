#!/bin/bash

FTP_CONF_FILE="/etc/vsftpd.conf"
SCRIPT_FILE="/usr/local/bin/init-ftp.sh"

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

#you can entre the config file and cutsomize as wanted
sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  $FTP_CONF_FILE && \
sed -i "s|#local_enable=YES|local_enable=YES|g"  $FTP_CONF_FILE && \
sed -i "s|#write_enable=YES|write_enable=YES|g"  $FTP_CONF_FILE && \
sed -i "s|#local_umask=022|local_umask=007|g"  $FTP_CONF_FILE

echo "allow_writeable_chroot=YES" >> $FTP_CONF_FILE && \
echo 'seccomp_sandbox=NO' >> $FTP_CONF_FILE && \
echo 'pasv_enable=YES' >> $FTP_CONF_FILE

service vsftpd stop
/usr/sbin/vsftpd
