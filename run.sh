#!/bin/sh

docker run --name 1c-server \
  --net host \
  --detach \
  --volume 1c-server-home:/home/usr1cv8 \
  --volume 1c-server-logs:/var/log/1C \
  --volume /etc/localtime:/etc/localtime:ro \
  -p 1540-1541:1540-1541
  -p 1560-1591:1560-1591
  grahovsky/1c-server
