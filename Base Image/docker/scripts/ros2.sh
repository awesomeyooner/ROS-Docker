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

echo -e "Setting up ${Blue}Locales${Color_Off}..."

locale

sudo apt update && sudo apt install -y locales

sudo locale-gen en_US en_US.UTF-8

sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

export LANG=en_US.UTF-8

locale

echo -e "Installing ${Blue}Dependencies${Color_Off}..."

sudo apt install -y software-properties-common

sudo add-apt-repository universe -y

sudo apt update && sudo apt install curl -y

export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F'"' '{print $4}')

sudo curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb"

sudo dpkg -i /tmp/ros2-apt-source.deb

sudo apt update && sudo apt upgrade -y

echo -e "Installing ${Green}ROS 2 Jazzy${Color_Off}..."
sudo apt install -y ros-jazzy-desktop

# Empty Line
echo "" >> ~/.bashrc

# Put a comment for what the following does
echo "# Run Setup Script for ROS 2" >> ~/.bashrc
echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc

echo -e "Finished Installing ${Green}ROS 2 Jazzy${Color_Off}!"
