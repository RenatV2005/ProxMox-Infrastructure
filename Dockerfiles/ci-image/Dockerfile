FROM node:22-bookworm

RUN apt-get update && apt-get install -y \
    git \
    docker.io \
    ansible \
    python3 \
    python3-pip \
    curl \
    wget \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
