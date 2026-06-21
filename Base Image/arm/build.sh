#!/bin/bash

NAME=ros2
TAG=jazzy

docker buildx build --load -t ${NAME}:${TAG} .