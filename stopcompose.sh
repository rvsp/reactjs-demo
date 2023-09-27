#!/bin/bash
docker-compose stop
docker-compose rm -f
img_id=$(docker images -q "react:dev")
docker rmi -f $img_id
img_idnode=$(docker images -q "node")
docker rmi -f $img_idnode

