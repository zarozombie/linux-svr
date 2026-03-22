#docker-debian13
FROM alpine:latest

# Install tools (Note: python3 and pip names vary slightly)
RUN apk add --no-cache bash vim tmux htop git python3 py3-pip

# Alpine uses 'ash' by default. We need to force Bash if you want your aliases.
SHELL ["/bin/bash", "-c"]

# Set the working directory
WORKDIR /app/python
COPY ./assets/code/python/ .
COPY ./assets/configs/ /tmp/configs/

# 2. Use standard Linux commands to move and rename
RUN mv /tmp/configs/master.vimrc /root/.vimrc && \
    mv /tmp/configs/common.inputrc /root/.inputrc && \
    rm -rf /tmp/configs

CMD ["/bin/bash"]
