#!/usr/bin/bash


# This script aims to deploy DevOps tools commonly used by engineers.
# The default environment is Linux distributions like Fedora or Ubuntu.
# Tools are deployed using Homebrew package manager.

# Deployed tools:

# - Homebrew
# - Docker
# - Oracle VirtualBox
# - HashiCorp Vagrant
# - HashiCorp Packer
# - HashiCorp Terraform
# - Kubectl
# - GitHub CLI


# Install developer tools on Fedora:
sudo dnf groupinstall -y 'Development Tools'
sudo dnf install -y procps-ng curl file git
sudo dnf install -y libxcrypt-compat # needed by Fedora 30 and up

# Install developer tools on Ubuntu:
sudo apt-get install -y build-essential procps curl file git

# Download Homebrew installation script:
curl -fsSL -o brew-install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

# Execute Homebrew installation script in unattended mode:
NONINTERACTIVE=1 sh brew-install.sh

# Add Brew to your PATH:
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
source ~/.bash_profile

# Download Docker installation script:
curl -fsSL https://get.docker.com -o get-docker.sh

# Execute Docker installation script. For uninstalling, do
# https://docs.docker.com/engine/install/fedora/#uninstall-docker-engine:
sudo sh get-docker.sh

# Enable Docker system daemon:
sudo systemctl enable --now docker

# Add current user to Docker group. Don't forget to restart user session:
sudo usermod -aG docker $USER

# Download Oracle VirtualBox installation script:
curl -fsSL -o virtualbox-install.run https://download.virtualbox.org/virtualbox/6.1.34/VirtualBox-6.1.34-150636-Linux_amd64.run

# Execute Oracle VirtualBox installation script:
sudo sh virtualbox-install.run

# Install Hashicorp Homewbrew Tap:
brew tap hashicorp/tap

# Download HashiCorp Vagrant binary:
curl -fsSL -o vagrant-bin.zip https://releases.hashicorp.com/vagrant/2.2.19/vagrant_2.2.19_linux_amd64.zip

# Extract and install HashiCorp Vagrant binary:
unzip -d ~/.local/bin vagrant-bin.zip

# Install HashiCorp Packer:
brew install hashicorp/tap/packer

# Install HashiCorp Terraform:
brew install hashicorp/tap/terraform

# Install Kubectl:
brew install kubectl

# INstall GitHub CLI:
brew install gh