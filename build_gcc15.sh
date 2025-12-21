#!/bin/bash

set -e

# Build the image
docker build -f Dockerfile.gcc15 -t cpp:gcc15 .

# Sanity checks
docker run -it cpp:gcc15 g++-15 --version

# Release the image
docker tag cpp:gcc15 wichtounet/cpp:gcc15
docker push wichtounet/cpp:gcc15
