FROM debian:trixie

RUN apt-get update && apt-get install -y \
    git \
    nodejs \
    npm \
    ansible \
    python3 \
    python3-pip \
    curl \
    wget \
    unzip \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Docker GPG Key hinzufügen
RUN install -m 0755 -d /etc/apt/keyrings

RUN curl -fsSL https://download.docker.com/linux/debian/gpg \
    | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Docker Repository hinzufügen
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian \
  trixie stable" \
  > /etc/apt/sources.list.d/docker.list

# Docker CLI + Plugins installieren
RUN apt-get update && apt-get install -y \
    docker-ce-cli \
    docker-buildx-plugin \
    docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace