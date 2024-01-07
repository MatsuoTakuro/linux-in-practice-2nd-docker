# Specify the base image the book uses.
FROM ubuntu:20.04

# Disable interactive input when installing packages with apt-get install.
ENV DEBIAN_FRONTEND=noninteractive

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

# Clone the sample code repository into the container.
RUN git clone https://github.com/satoru-takeuchi/linux-in-practice-2nd.git

# Move to the directory where the sample code is located.
WORKDIR /linux-in-practice-2nd

# Reset the DEBIAN_FRONTEND environment variable
ENV DEBIAN_FRONTEND=
