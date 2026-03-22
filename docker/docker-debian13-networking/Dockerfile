#docker-debian13
FROM debian:13

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    tmux \
    vim \
    htop \
    python3 \
    pip \
    python3-venv \
    git \
    && rm -rf /var/lib/apt/lists/*
#    package3

# Set the working directory
WORKDIR /app/python

# Copy your application files
COPY ./assets/code/python/ .

COPY ./assets/configs/ /tmp/configs/

# 2. Use standard Linux commands to move and rename
RUN mkdir -p /etc/systemd && \
    mv /tmp/configs/master.vimrc /root/.vimrc && \
    mv /tmp/configs/common.journald.conf /etc/systemd/journald.conf && \
    mv /tmp/configs/common.inputrc /root/.inputrc && \
    rm -rf /tmp/configs

## non interactive .bash_aliases
SHELL ["/bin/bash", "-c"]

# Start an interactive bash session
CMD ["/bin/bash"]
