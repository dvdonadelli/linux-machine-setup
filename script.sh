#!/bin/bash

# Update system
sudo snap refresh -y && sudo apt update -y && sudo apt upgrade -y

# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
xdg-settings set default-web-browser google-chrome.desktop

# Install Discord via snap
sudo snap install discord --classic

# Install IntelliJ Ultimate via snap
sudo snap install intellij-idea-ultimate --classic

# Install VS Code
wget -O vscode.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt install ./vscode.deb -y

# Install Steam
wget -O steam.deb https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb
sudo apt install ./steam.deb -y

# Install Spotify via snap
sudo snap install spotify --classic

# Install OBS Studio via apt
sudo apt install obs-studio -y

# Install SDKMAN!
curl -s "https://get.sdkman.io" | bash

# Install ZSH and make it the default shell
sudo apt install zsh -y
chsh -s $(which zsh)

# Install automatic ubuntu drivers
sudo ubuntu-drivers install

# Generate GitHub SSH Keys
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
echo "SSH key generated. Please add the public key (~/.ssh/id_ed25519.pub) to your GitHub account."

# Create alias for system update
echo "alias update='sudo apt update -y && sudo apt upgrade -y && sudo snap refresh -y'" >> ~/.zshrc

# Reload zshrc to apply changes
source ~/.zshrc

# Install Oh My ZSH!
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "Setup completed! Please logout and login again for changes to take effect."
