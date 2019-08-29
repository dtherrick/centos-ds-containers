#! /bin/bash

FOLDER=$1
IMAGE=$2

CONTAINER=`docker run -d --rm -p 8888:8888 \
           --name $IMAGE \
           -v $FOLDER/notebooks/:/home/ds/notebooks \
           -v $FOLDER/data/:/home/ds/datasets \
           centos-ds/$IMAGE`
echo $CONTAINER
