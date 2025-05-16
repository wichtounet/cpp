FROM ubuntu:plucky

# Install some basics for Ubuntu (curl, gdb, git, apt, nasm)
RUN apt update && apt -y upgrade && apt install -y curl software-properties-common locales gdb git nasm

# Install some common dependencies (openssl, uuid, libcurl, boost)
RUN apt -y install make openssl libssl-dev uuid-dev libcurl4-openssl-dev libboost-all-dev

# Install gcc-14 (fallback)
RUN apt -y install gcc-14 g++-14
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 60 --slave /usr/bin/g++ g++ /usr/bin/g++-14

# Install gcc-15 (latest)
RUN add-apt-repository ppa:ubuntu-toolchain-r/test 
RUN apt update && apt -y install gcc-15 g++-15

# Trust LLVM key
RUN curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/llvm.gpg

# Install clang-19 (fallback)
RUN echo "deb http://apt.llvm.org/plucky/ llvm-toolchain-plucky-19 main" >> /etc/apt/sources.list.d/llvm.list
RUN apt update && apt -y install llvm-19 clang-19

# Install clang-20 (latest)
RUN echo "deb http://apt.llvm.org/plucky/ llvm-toolchain-plucky-20 main" >> /etc/apt/sources.list.d/llvm.list
RUN apt update && apt -y install llvm-20 clang-20

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
ENV LC_COLLATE=C
