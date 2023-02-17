FROM docker.io/ubuntu:22.04

# Basic image
# Update system and install minimal requirements
RUN apt update && apt install -yqq \
    gcc \
    clang \
    libpq-dev \
    libbsd-dev \
    libncurses-dev \
    valgrind \
    git \
    openssh-client \
    ssh \
    python3 \
    python3-dev \
    python3-pip \
    python3-venv \
    python3-wheel

# Install francinette from official repo
RUN git clone --recursive https://github.com/xicodomingues/francinette.git /paco
COPY install.sh /install.sh
RUN /install.sh

COPY paco-entrypoint.sh /paco-entrypoint.sh

# Set the entrypoint of the application
ENTRYPOINT ["/paco-entrypoint.sh"]
