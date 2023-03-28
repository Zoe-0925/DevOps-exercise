#!/bin/sh
echo Building the multi-stage docker image

docker build -t my-nginx-image .

docker run -p 80:80 my-nginx-image