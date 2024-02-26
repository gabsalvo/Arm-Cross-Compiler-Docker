# Download base image ubuntu latest
FROM ubuntu:latest

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    openjdk-8-jdk \
    openssh-server \
    sudo \
    curl \
    qemu \
    qemu-user \
    gcc-arm-linux-gnueabihf \
    gdb-multiarch \
    && rm -rf /var/lib/apt/lists/*

# Add user and set password
RUN useradd -rm -d /home/remote_user -s /bin/bash remote_user && \
    echo 'remote_user:dunamis' | chpasswd

# Give remote_user passwordless sudo privileges
RUN echo 'remote_user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# SSH setup
RUN mkdir /home/remote_user/.ssh && chmod 700 /home/remote_user/.ssh
COPY id_rsa.pub /home/remote_user/.ssh/authorized_keys
RUN chown remote_user:remote_user -R /home/remote_user/.ssh && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

# Install micro editor
RUN curl https://getmic.ro | bash && \
    mv micro /usr/local/bin

# SSHD setup
RUN mkdir -p /var/run/sshd

# Start SSH Daemon
CMD ["/usr/sbin/sshd", "-D"]
