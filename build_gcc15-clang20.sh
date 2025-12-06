#!/bin/bash

set -e

# Build the image
docker build -f Dockerfile.gcc15-clang20 -t cpp:gcc15-clang20 .

# Sanity checks
docker run -it cpp:gcc15-clang20 g++-15 --version
docker run -it cpp:gcc15-clang20 clang++-20 --version

# Release the image
docker tag cpp:gcc15-clang20 wichtounet/cpp:gcc15-clang20
docker push wichtounet/cpp:gcc15-clang20
