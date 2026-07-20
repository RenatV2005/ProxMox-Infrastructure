FROM node:22-bookworm

RUN apt-get update && apt-get install -y \
    git \
    ansible \
    python3 \
    python3-pip \
    curl \
    wget \
    unzip \
    ca-certificates \
    gnupg \
    lsb-release

# Docker GPG Key hinzufügen

RUN install -m 0755 -d /etc/apt/keyrings

RUN curl -fsSL https://download.docker.com/linux/debian/gpg \
    | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Docker Repository hinzufügen

RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian \
  bookworm stable" \
  > /etc/apt/sources.list.d/docker.list

# Docker installieren

RUN apt-get update && apt-get install -y \
    docker-ce-cli \
    docker-buildx-plugin \
    docker-compose-plugin

WORKDIR /workspace