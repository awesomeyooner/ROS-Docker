# ROS-Docker
A collection of my dockerfiles for running ROS

## Usage

Run either `/Base-Image/x86/build.sh` or `/Base-Image/arm/build.sh` for `x86` and `arm` systems respectively.
Right now, the only differences are that `x86` installs `Gazebo` and `Anaconda`, while `arm` does not.

The `run.sh` scripts only act as a template. If you would like an interactive shell, simply use

```bash
#!/bin/bash

NAME=ros2
TAG=jazzy

docker run \
    -it \
    --rm \
    --hostname container \
    --name my_container \
    --user $(id -u):$(id -g) \
    --volume "$(pwd)/Documents":/home/ubuntu/Documents \
    --net=host \
    ${NAME}:${TAG}
```

And execute it with

```bash
$ ./run.sh
```

If you would like to just run a command within the container, use

```bash
#!/bin/bash

NAME=ros2
TAG=jazzy

docker run \
    -it \
    --rm \
    --hostname container \
    --name my_container \
    --user $(id -u):$(id -g) \
    --volume "$(pwd)/Documents":/home/ubuntu/Documents \
    --net=host \
    ${NAME}:${TAG} \
    $*
```

`$*` just parses all commands into one varaible

Now you can just add commands like normal, like

```bash
# Hello World!
$ ./run.sh echo "Hello World!"

# Runs RViz2
$ ./run.sh ros2 run rviz2 rviz2

# Lists all topics
$ ./run.sh ros2 topic list
```