#!/bin/bash

set -e

# Build the image
docker build -f Dockerfile.alpine-latest -t cpp:alpine-latest .

# Sanity checks
docker run -it cpp:latest g++-15 --version
docker run -it cpp:latest clang++-20 --version
docker run -it cpp:latest nasm --version
docker run -it cpp:latest git --version

# Release the image
docker tag cpp:alpine-latest wichtounet/cpp:alpine-latest
docker push wichtounet/cpp:alpine-latest
