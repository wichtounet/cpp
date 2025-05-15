#!/bin/bash

set -e

docker build -f Dockerfile -t cpp:latest .
docker tag cpp:latest wichtounet/cpp:latest
docker push wichtounet/cpp:latest
