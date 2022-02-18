#!/bin/bash
docker -v
if [ $? -ne 0 ]; then
   sudo yum install -y yum-utils
   sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
   sudo yum install -y docker-ce docker-ce-cli containerd.io
fi
#check for updated docker packages
sudo yum update -y docker-ce
docker build -t skilltest-mariadb .
rootpass=$(gpg --batch --yes --passphrase notsafe -d secret)
docker run -d -e MARIADB_ROOT_PASSWORD=$rootpass --mount type=bind,source=/var/run/mysql,target=/var/run/mysql --name ALFRED skilltest-mariadb
if [ $(docker ps --filter "name=ALFRED" |wc -l) -eq 2 ]; then
  docker stop ALFRED
  docker rm ALFRED
  docker run -d -e MARIADB_ROOT_PASSWORD=$rootpass --mount type=bind,source=/var/run/mysql,target=/var/run/mysql --name ALFRED skilltest-mariadb 
fi
echo Sleeping for DB to come up
sleep 10
docker exec -i ALFRED sh -c "mysql -p$rootpass" < db.sql
