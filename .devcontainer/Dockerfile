FROM opencode:latest

RUN apt-get update && apt-get install wget -y

# Download the latest version of Hugo Extended for Linux AMD64 (e.g. hugo_extended_with_deploy_0.154.5_linux-amd64.deb)
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.154.5/hugo_extended_withdeploy_0.154.5_linux-amd64.deb
# Now install the downloaded package
RUN HUGO_PKG=$(ls hugo_extended_withdeploy_*_linux-amd64.deb) && dpkg -i "$HUGO_PKG"
