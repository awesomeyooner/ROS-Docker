#!/bin/bash

# Exit on any errors
set -e

# Source ros2
source "/opt/ros/humble/setup.bash"

# Passthrough commands
exec "$@"