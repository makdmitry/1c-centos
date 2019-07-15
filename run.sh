#!/bin/sh
#--net host \
#--volume /etc/localtime:/etc/localtime:ro \
#--privileged \

docker run --name 1c-centos7 \
  --detach \
  --net my_app_net \
  --user onec \
  --privileged \
  --volume 1c-server-home:/home/usr1cv8 \
  --volume 1c-server-logs:/var/log/1C \
  -p 1540-1541:1540-1541 \
  -p 1560-1591:1560-1591 \
  grahovsky/1c-centos7
