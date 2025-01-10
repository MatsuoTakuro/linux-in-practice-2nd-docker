# Specify the base image the book uses.
FROM ubuntu:20.04

# Disable interactive input when installing packages with apt-get install.
ENV DEBIAN_FRONTEND=noninteractive

# Set Asia/Tokyo as the time zone that some packages to be installed later require.
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install packages required as described in the book.
RUN apt-get update && apt-get install -y \
    binutils \
    build-essential \
    golang \
    sysstat \
    python3-matplotlib \
    python3-pil \
    fonts-takao \
    fio \
    qemu-kvm \
    virt-manager \
    libvirt-clients \
    virtinst \
    jq \
    docker.io \
    containerd \
    libvirt-daemon-system \
    curl \
    # For debugging (although not described in the book)
    strace \
    psmisc \
    # Clean up the APT cache to reduce the image size
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add a current user to a group that can manage virtual machines.
RUN adduser `id -un` libvirt
RUN adduser `id -un` libvirt-qemu
RUN adduser `id -un` kvm

# Install Starship without prompt
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Add Starship initialization to /etc/bash.bashrc for all users
RUN echo 'eval "$(starship init bash)"' >> /etc/bash.bashrc

WORKDIR /app

# Reset the DEBIAN_FRONTEND environment variable
ENV DEBIAN_FRONTEND=
