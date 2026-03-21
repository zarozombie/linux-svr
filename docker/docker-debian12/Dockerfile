FROM debian:12

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
WORKDIR /data/dev_code

# Copy your application files
COPY ./dev_code /app

COPY ./config /root

## interactive .bash_aliases
RUN echo "if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi" >> ~/.bashrc


## non interactive .bash_aliases
SHELL ["/bin/bash", "-c"]

# Define the command to run your application
#SHELL ["/bin/bash", "-c"]
#CMD source /root/.bash_aliases
#CMD ["/bin/bash", "-c", "source" "/root/bash_aliases"]

####TEST with shell script
##CMD ["/bin/bash", "-c", "source /script.sh && command_to_run"]
#CMD ["/bin/bash", "-c", "source /root/.bash_aliases"]

