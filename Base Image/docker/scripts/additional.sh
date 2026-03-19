#!/bin/bash

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

echo -e "Installing ${Green}Extra Bits${Color_Off}..."

source ~/.bashrc

sudo apt install -y ros-jazzy-ros2-control ros-jazzy-ros2-controllers

pip3 install catkin_pkg

echo -e "Finished Installing ${Green}Rxtra Bits${Color_Off}!"
