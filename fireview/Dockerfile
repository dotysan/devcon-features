#
FROM mcr.microsoft.com/devcontainers/universal:3

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install \
    curl \
    git-lfs \
    htop \
    jq \
    make \
    mc \
    ncdu \
    net-tools \
    openssh-client \
    pinentry-tty \
    pixz \
    postgresql-client \
    psmisc \
    python3-dev \
    python3-venv \
    sudo \
    util-linux-extra \
    zstd \
    --yes --no-install-recommends \
    && apt-get upgrade --yes \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# note .devcontainer/devcontainer.json:features{} run after this Dockerfile is done...
