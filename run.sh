#!/bin/sh
#--net host \
#--net my_app_net \
#--volume /etc/localtime:/etc/localtime:ro \
#--user usr1cv8 \
#-p 2540-2541:2540-2541 \
#-p 2560-2591:2560-2591 \
#-p 1545:1545 \

docker run --name onec-centos7 \
  -it \
  --detach \
  --net host \
  --privileged \
  --user root \
  --volume c:/docker/data/1c-server-home:/home/usr1cv8 \
  --volume c:/docker/data/1c-server-logs:/var/log/1C \
  grahovsky/onec-centos7
