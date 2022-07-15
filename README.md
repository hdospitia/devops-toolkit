# get-tools.sh

This script is aimed to help engineers to deploy DevOps tools into their new machines, either cloud instances or laptops/desktops. This script was tested on Fedora and Ubuntu systems. The following is the list of tools that this script helps to install using Homebrew and source binaries:

 - Homebrew
 - Docker
 - Oracle VirtualBox
 - HashiCorp Vagrant
 - HashiCorp Packer
 - HashiCorp Terraform
 - Kubectl
 - GitHub CLI

 Please, in regard of the type of system you use, install the developer tools in the following way before to use the script:

## Fedora:
```console
sudo dnf groupinstall -y 'Development Tools'
sudo dnf install -y procps-ng curl file git
sudo dnf install -y libxcrypt-compat # needed by Fedora 30 and up
```

## Ubuntu:
```console
sudo apt-get install -y build-essential procps curl file git
```

**Any contribution is well received!**