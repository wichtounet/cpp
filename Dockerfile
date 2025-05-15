FROM ubuntu:latest

# Install some basics for Ubuntu
RUN apt update && apt -y upgrade && apt install -y software-properties-common

# Install gcc-14
RUN apt -y install make gcc-14 g++-14 libssl-dev uuid-dev libcurl4-openssl-dev gdb openssl locales
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 60 --slave /usr/bin/g++ g++ /usr/bin/g++-14

# Install clang-18
RUN add-apt-repository http://apt.llvm.org/noble/ llvm-toolchain-noble-18 main
RUN apt -y install llvm-18 clang-18

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LC_COLLATE C
