#!/bin/bash

NAME=ros2
TAG=jazzy

docker run \
    -it \
    --rm \
    --hostname container \
    --name my_container \
    --user $(id -u):$(id -g) \
    -e TERM=xterm-256color \
    --volume "$(pwd)/Documents":/home/ubuntu/Documents \
    --net=host \
    --volume /dev/input:/dev/input \
    --device-cgroup-rule='c 13:* rmw' \
    --device-cgroup-rule='c 166:* rmw' \
    --device-cgroup-rule='c 188:* rmw' \
    --device-cgroup-rule='c 81:* rmw' \
    --device-cgroup-rule='a 189:* rmw' \
    -v /dev:/dev \
    ${NAME}:${TAG}