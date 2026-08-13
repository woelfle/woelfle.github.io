FROM python:3.14-trixie

# Install opencode into the image
RUN apt-get update && apt-get install -y curl unzip zsh just ripgrep
RUN curl -fsSL https://opencode.ai/install | bash
ENV PATH="/root/.opencode/bin:${PATH}"

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# 'host.docker.internal' has to be added to no_proxy to allow access to services running on
# the host machine. Otherwise ZScaler may block the traffic.
ENV no_proxy=host.docker.internal,localhost,127.0.0.1,.sickcn.net
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

RUN /root/.local/bin/uv tool install chunkhound
# RUN /root/.bun/bin/bun install -g https://github.com/philschmid/mcp-cli
RUN curl -fsSL https://raw.githubusercontent.com/philschmid/mcp-cli/main/install.sh | bash

RUN apt-get update && apt-get install wget golang-go -y

# Download the latest version of Hugo Extended for Linux AMD64 (e.g. hugo_extended_withdeploy_0.165.0_linux-amd64.deb)
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.165.0/hugo_extended_withdeploy_0.165.0_linux-amd64.deb
# Now install the downloaded package
RUN HUGO_PKG=$(ls hugo_extended_withdeploy_*_linux-amd64.deb) && dpkg -i "$HUGO_PKG"

# Keep container running for devcontainer
CMD ["/bin/sh", "-c", "sleep infinity"]


