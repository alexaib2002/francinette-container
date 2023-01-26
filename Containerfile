FROM docker.io/ubuntu:22.04

# Basic image
# Update system and install minimal requirements
RUN apt update && apt -y upgrade && apt install -y gcc clang libpq-dev libbsd-dev libncurses-dev valgrind git
# Install python deps
RUN apt install -y python3 python3-dev python3-pip python3-venv python3-wheel

# Install francinette from official repo
ENV PATH=$PATH:/paco
RUN git clone --recursive https://github.com/xicodomingues/francinette.git paco
COPY install.sh /install.sh
RUN /install.sh
