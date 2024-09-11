# 베이스 이미지: 우분투 20.04
FROM ubuntu:20.04

# 패키지 설치하는동안 프롬프트와의 상호작용을 피하기 위해 환경변수를 설정합니다.
ENV DEBIAN_FRONTEND=noninteractive

# 실습에 필요한 필수 패키지들을 설치합니다.
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

# bash를 컨테이너에서 사용할 쉘로 설정합니다.
SHELL ["/bin/bash", "-c"]

# 컨테이서 실행시 명령할 내용, bash 쉘 프로그램을 실행하도록 지정합니다.
CMD ["bash"]
