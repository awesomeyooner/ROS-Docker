#!/bin/bash

NAME=ros2
TAG=humble

docker buildx build \
    --build-arg UID="$(id -u)" \
    --build-arg GID="$(id -g)" \
    --load -t ${NAME}:${TAG} .