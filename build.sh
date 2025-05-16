#!/bin/bash

set -e

# Build the image
docker build -f Dockerfile -t cpp:latest .

# Sanity checks
docker run -it cpp:latest g++-14 --version
docker run -it cpp:latest g++-15 --version
docker run -it cpp:latest clang++-19 --version
docker run -it cpp:latest clang++-20 --version
docker run -it cpp:latest nasm --version
docker run -it cpp:latest git --version

# Release the image
docker tag cpp:latest wichtounet/cpp:latest
docker push wichtounet/cpp:latest
