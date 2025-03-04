#!/bin/bash

##node
#docker rm -f node_18.16.0
#docker run -d -it --restart=always --add-host host.docker.internal:host-gateway -p 8888:8888 -v /data/docker/php/:/var/www/coinfloww --name node_18.16.0 node:18 cd /var/www/coinfloww/binance_chat && node app.js
#
##php-cmd
#docker rm -f php_7.4.33_cmd
#docker run -d -it  --restart=always -v /Users/wifi/Code/php/:/var/www/coinfloww --name php_7.4.33_cmd php-7.4.33_cmd sh /var/www/coinfloww/lucy/docker_run_phpcmd.sh
#
##php-fpm
#docker rm -f php_7.4.33_fpm
#docker run -d -it --restart=always -p 9000:9000 -v /Users/wifi/Code/php:/var/www/coinfloww --name php_7.4.33_fpm php-7.4.33_fpm

#nginx
docker rm -f nginx
docker run -d -it --restart=always -p 80:80 -p 443:443 \
-v ./nginx/conf.d:/etc/nginx/conf.d \
-v ./nginx/ssl:/data/ssl \
-v ./nginx/project:/data/project \
--name nginx nginx

#mysql
docker rm -f mysql
docker run -d -it --restart=always -p 3306:3306 -v ./data/mysql:/var/lib/mysql  --env MYSQL_ROOT_PASSWORD=123456 --name mysql mysql

#redis
docker rm -f redis
docker run -d -it --restart=always -p 6379:6379 -v ./redis/redis.conf:/usr/local/etc/redis/redis.conf -v ./data/redis:/data --name redis redis

docker rm -f redis-stack
docker run -d -it --restart=always -p 6379:6379 -v ./redis/redis.conf:/usr/local/etc/redis/redis.conf -v ./data/redis:/data --name redis-stack redis/redis-stack-server

#filebrowser
docker rm -f filebrowser
docker run -d -it --restart=always -p 8022:80 -v ~/Filebrowser/:/srv --name filebrowser filebrowser/filebrowser

#mongo
docker rm -f mongo
docker run -it -d --restart=always -p 27017:27017 -v ./data/mongo:/data/db -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=123456 --name mongo mongo

#kafka-ui
# --add-host host.docker.internal:host-gateway
docker run -it -d --restart=always -p 8080:8080 -e DYNAMIC_CONFIG_ENABLED=true --name kafka-ui provectuslabs/kafka-ui

#noco
docker rm -f nocodb-mysql
docker run -it -d --restart=always -p 8081:8080 -v ~/Code/docker_run/data/nocodb:/usr/app/data/ --name nocodb-mysql nocodb/nocodb:latest


# linux
/home/ubuntu/data/docker/nginx
docker run -d -it --restart=always -p 3306:3306 -v /data/docker/mysql:/var/lib/mysql  --env MYSQL_ROOT_PASSWORD=wangfeng --name mysql mysql
docker run -d -it --restart=always -p 6379:6379 -v /data/docker/redis:/data  --name redis redis --requirepass "wangfeng"

docker run -d -it --restart=always -p 80:80 -p 443:443 \
--add-host host.docker.internal:host-gateway \
-v /data/docker/nginx/conf.d:/etc/nginx/conf.d \
-v /data/docker/nginx:/data \
--name nginx nginx

docker run -d -it --restart=always -p 8022:80 -v ~/Filebrowser/:/srv --name filebrowser filebrowser/filebrowser

# add systemctl
#[Unit]
 #Description=Harbridgecrypto Admin Server
 #
 #[Service]
 #WorkingDirectory=/data/server/admin-server
 #ExecStart=/data/server/admin-server/admin-server
 #User=ubuntu
 #Type=simple
 #Restart=always
 #RestartSec=5s
 #StandardOutput=null
 #Environment=ENV_NAME=prod
 #
 #[Install]
 #WantedBy=multi-user.target