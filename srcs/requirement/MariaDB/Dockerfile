FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y apt-transport-https ca-certificates curl gnupg && apt-get install mariadb-server -y

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /usr/local/bin/cmds.sh

RUN chmod +x /usr/local/bin/cmds.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/cmds.sh"]
