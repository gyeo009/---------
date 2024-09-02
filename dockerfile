# Base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sudo \
    ca-certificates \
    curl \
    wget \
    vim \
    nano \
    git \
    build-essential \
    binutils \
    golang \
    sysstat \
    python3-matplotlib \
    python3-pil \
    'fonts-nanum*' \
    fio \
    qemu-kvm \
    virt-manager \
    libvirt-clients virtinst \
    jq \
    docker.io \
    containerd \
    libvirt-daemon-system \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && sudo adduser 'id -un' libvirt \
    && sudo adduser 'id -un' libvirt-qemu \
    && sudo adduser 'id -un' kvm

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Default command to run when container starts
CMD ["bash"]
