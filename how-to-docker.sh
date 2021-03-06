#!/bin/bash

# run the container detached, interactive, with its own tty, set hostname, set docker name
docker run -dith target1 --name=target1 ubuntu:rolling

# list all containers
docker ps -a

# start a container
docker start target1

# list running containers
docker ps

# get the IP address of the running container named target1
docker inspect target1 | grep IPAddress

# start a service inside the Docker container
docker exec -it target1 service ssh start
