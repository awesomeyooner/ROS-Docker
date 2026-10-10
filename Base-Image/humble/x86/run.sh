#!/bin/bash

NAME=ros2
TAG=humble

HOSTNAME=container
CONTAINER_NAME=my_container

docker run \
    -it \
    --init \
    --rm \
    --hostname ${HOSTNAME} \
    --add-host ${HOSTNAME}:127.0.0.1 \
    --name ${CONTAINER_NAME} \
    -e TERM=xterm-256color \
    --user $(id -u):$(id -g) \
    --net=host \
    --env DISPLAY=$DISPLAY \
    --env QT_X11_NO_MITSHM=1 \
    --env LIBGL_ALWAYS_INDIRECT=0 \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    ${NAME}:${TAG}