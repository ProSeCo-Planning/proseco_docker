#!/bin/bash

echo "--->BUILDING karlkurzer/proseco:cuda-ros"
sudo docker build -f cuda-ros.Dockerfile -t karlkurzer/proseco:cuda-ros .
echo "--->BUILDING karlkurzer/proseco:build"
sudo docker build -f proseco-build.Dockerfile -t karlkurzer/proseco:build .
echo "--->BUILDING karlkurzer/proseco:ci"
sudo docker build -f proseco-ci.Dockerfile -t karlkurzer/proseco:ci .
echo "--->BUILDING karlkurzer/proseco:devel"
sudo docker build -f proseco-devel.Dockerfile -t karlkurzer/proseco:devel .

echo "--->PUSHING TAGS"
sudo docker push karlkurzer/proseco:cuda-ros \
&& sudo docker push karlkurzer/proseco:build \
&& sudo docker push karlkurzer/proseco:ci \
&& sudo docker push karlkurzer/proseco:devel
