#!/bin/bash
docker service create --name gateway  --network my-net --constraint node.labels.server==gateway  --publish published=8080,target=8080 --mount type=bind,source=/root/logs,destination=/app/logs -d xmu-oomall/gateway:0.0.1-SNAPSHOT
docker service create --name product  --network my-net --constraint node.labels.server==product --mount type=bind,source=/root/logs,destination=/app/logs -d xmu-oomall/product:0.0.1-SNAPSHOT
docker service create --name payment  --network my-net --constraint node.labels.server==payment --mount type=bind,source=/root/logs,destination=/app/logs -d xmu-oomall/payment:0.0.1-SNAPSHOT
docker service create --name shop  --network my-net --constraint node.labels.server==shop --mount type=bind,source=/root/logs,destination=/app/logs -d xmu-oomall/shop:0.0.1-SNAPSHOT
docker service create --name region  --network my-net --constraint node.labels.server==region --mount type=bind,source=/root/logs,destination=/app/logs -d xmu-oomall/region:0.0.1-SNAPSHOT
docker service create --name alipay  --network my-net --constraint node.labels.server==alipay --mount type=bind,source=/root/logs,destination=/app/logs -d xmu-oomall/alipay:0.0.1-SNAPSHOT
docker service create --name wechatpay  --network my-net --constraint node.labels.server==wechatpay --mount type=bind,source=/root/logs,destination=/app/logs -d xmu-oomall/wechatpay:0.0.1-SNAPSHOT
docker service create --name auto-test --network my-net --constraint node.labels.server==test --replicas 4 --mount type=bind,source=/root/logs,destination=/app/logs --mount type=bind,source=/root/oomall-public-test-2022,destination=/public-test -d xmu-oomall/public-test:3.0.3-hotfix
docker service create --name nginx --network my-net --constraint node.labels.server==nginx --mount type=bind,source=/root/AutoTest/nginx/conf.d,destination=/etc/nginx/conf.d --mount type=bind,source=/root/AutoTest/nginx/pass,destination=/etc/nginx/pass --mount type=bind,source=/root/public-test,destination=/public-test  --mount type=bind,source=/root/AutoTest/nginx/www/html,destination=/var/www/html --mount type=bind,source=/root/logs,destination=/var/log/nginx  -p 80:80 -d nginx:latest

docker service create --name gateway  --network my-net --constraint node.labels.server==gateway  --publish published=8080,target=8080 --mount type=bind,source=/root/logs,destination=/app/logs -d swr.cn-north-4.myhuaweicloud.com/oomall-javaee/gateway:v1.0
docker service create --name product  --network my-net --mount type=bind,source=/root/logs,destination=/app/logs -d swr.cn-north-4.myhuaweicloud.com/oomall-javaee/product:v1.0
docker service create --name payment  --network my-net --mount type=bind,source=/root/logs,destination=/app/logs -d swr.cn-north-4.myhuaweicloud.com/oomall-javaee/payment:v1.0
docker service create --name shop  --network my-net --mount type=bind,source=/root/logs,destination=/app/logs -d swr.cn-north-4.myhuaweicloud.com/oomall-javaee/shop:v1.0
docker service create --name region  --network my-net --mount type=bind,source=/root/logs,destination=/app/logs -d swr.cn-north-4.myhuaweicloud.com/oomall-javaee/region:v1.0
docker service create --name alipay  --network my-net --mount type=bind,source=/root/logs,destination=/app/logs -d swr.cn-north-4.myhuaweicloud.com/oomall-javaee/alipay:v1.0
docker service create --name wechatpay  --network my-net --constraint --mount type=bind,source=/root/logs,destination=/app/logs -d swr.cn-north-4.myhuaweicloud.com/oomall-javaee/wechatpay:v1.0
docker service create --name freight  --network my-net --constraint --mount type=bind,source=/root/logs,destination=/app/logs -d swr.cn-north-4.myhuaweicloud.com/oomall-javaee/freight:v1.0

docker service create --name test --constraint node.labels.server==test  --mount type=bind,source=/root/OOMALL,destination=/OOMALL --mount type=bind,source=/root/public-test,destination=/public-test --network my-net -d test:v1.0  /usr/sbin/sshd -D