#!/bin/bash
docker rm $(docker ps -a -q)

cd /root/OOMALL
git pull

for M in 'payment' 'shop' 'product' 'alipay' 'wechatpay' 'region' 'freight' 'sfexpress' 'jtexpress' 'ztoexpress'
do
  docker exec -i $(docker container ls -aq -f name=mysql.*) mysql -udemouser -p123456 -D $M < /root/OOMALL/mysql/sql/$M.sql
done