FROM debian:trixie

# ============================================================
# Base packages
# ============================================================

RUN apt-get update && apt-get install -y \
    git \
    ansible-lint \
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


# ============================================================
# HashiCorp Repository
# ============================================================

RUN install -m 0755 -d /etc/apt/keyrings

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg \
    | gpg --dearmor \
    -o /etc/apt/keyrings/hashicorp-archive-keyring.gpg

RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com \
    $(lsb_release -cs) \
    main" \
    > /etc/apt/sources.list.d/hashicorp.list


# ============================================================
# Terraform
# ============================================================

RUN apt-get update && apt-get install -y \
    terraform \
    && rm -rf /var/lib/apt/lists/*


# ============================================================
# Docker CLI + Compose
# ============================================================

RUN install -m 0755 -d /etc/apt/keyrings

RUN curl -fsSL https://download.docker.com/linux/debian/gpg \
    | gpg --dearmor \
    -o /etc/apt/keyrings/docker.gpg

RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/debian \
    trixie stable" \
    > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y \
    docker-ce-cli \
    docker-buildx-plugin \
    docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*


# ============================================================
# Working directory
# ============================================================

WORKDIR /workspace