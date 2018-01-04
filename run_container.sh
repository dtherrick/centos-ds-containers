#! /bin/bash

FOLDER=$1

CONTAINER=`docker run -d -p 8888:8888 -v $FOLDER:/home/ds/notebooks centos-ds/jupyter`
echo $CONTAINER
