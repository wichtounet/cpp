FROM ubuntu:noble

# Install some basics for Ubuntu
RUN apt update && apt -y upgrade && apt install -y curl software-properties-common locales gdb

# Install some common dependencies
RUN apt -y install make openssl libssl-dev uuid-dev libcurl4-openssl-dev

# Install gcc-14
RUN apt -y install gcc-14 g++-14
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 60 --slave /usr/bin/g++ g++ /usr/bin/g++-14

# Trust LLVM key
RUN curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/llvm.gpg

# Install clang-18 (fallback)
RUN echo "deb http://apt.llvm.org/noble/ llvm-toolchain-noble-18 main" >> /etc/apt/sources.list.d/llvm.list
RUN apt update && apt -y install llvm-18 clang-18

# Install clang-20
RUN echo "deb http://apt.llvm.org/noble/ llvm-toolchain-noble-20 main" >> /etc/apt/sources.list.d/llvm.list
RUN apt update && apt -y install llvm-20 clang-20

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
ENV LC_COLLATE=C
