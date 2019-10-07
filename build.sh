#!/bin/bash
APP_NAME="sameboy"
IMAGE_TAG="$APP_NAME-build"

docker build -t $IMAGE_TAG .
ID=$(docker create $IMAGE_TAG)
docker cp $ID:/build/SameBoy.tar.gz .
docker rm -v $ID

KEEP_IMAGE=false
for arg in "$@"
do
    if [ "$arg" == "--keep-image" ]
    then
        KEEP_IMAGE=true
    fi
done

if [ "$KEEP_IMAGE" = false ]
then
    docker rmi $IMAGE_TAG
fi