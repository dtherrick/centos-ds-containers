#! /bin/bash

NOTEBOOK_FOLDER=$1
DATA_FOLDER=$2
IMAGE=$3

CONTAINER=`docker run -d --rm -p 8888:8888 \
           --name $IMAGE \
           -v $NOTEBOOK_FOLDER:/home/ds/notebooks \
           -v $DATA_FOLDER:/home/ds/datasets \
           centos-ds/$IMAGE`
echo $CONTAINER
