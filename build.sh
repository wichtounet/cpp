#!/bin/bash

set -e

# Build the image
docker build -f Dockerfile -t cpp:latest .

# Sanity checks
docker run -it cpp:latest g++-14 --version
docker run -it cpp:latest g++-15 --version
docker run -it cpp:latest clang++-18 --version
docker run -it cpp:latest clang++-20 --version

# Release the image
docker tag cpp:latest wichtounet/cpp:latest
docker push wichtounet/cpp:latest
