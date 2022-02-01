#!/bin/bash

echo "--->BUILDING karlkurzer/proseco:cuda-ros"
docker build -f cuda-ros.Dockerfile -t karlkurzer/proseco:cuda-ros .
echo "--->BUILDING karlkurzer/proseco:build"
docker build -f proseco-build.Dockerfile -t karlkurzer/proseco:build .
echo "--->BUILDING karlkurzer/proseco:ci"
docker build -f proseco-ci.Dockerfile -t karlkurzer/proseco:ci .
echo "--->BUILDING karlkurzer/proseco:devel"
docker build -f proseco-devel.Dockerfile -t karlkurzer/proseco:devel .

echo "--->PUSHING TAGS"
docker push karlkurzer/proseco:cuda-ros \
&& docker push karlkurzer/proseco:build \
&& docker push karlkurzer/proseco:ci \
&& docker push karlkurzer/proseco:devel
