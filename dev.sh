#!/usr/bin/env bash

sudo apt update
sudo apt install -y git fzf tmux xclip curl unzip tar gzip build-essential

export NVM_DIR="$HOME/.nvm"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo mv /opt/nvim-linux64 /opt/nvim

grep -qxF 'export PATH="$PATH:/opt/nvim/bin"' ~/.bashrc || \
echo 'export PATH="$PATH:/opt/nvim/bin"' >> ~/.bashrc
export PATH="$PATH:/opt/nvim/bin"

mkdir -p ~/configDir

git clone https://github.com/francisnicholasramos/dotfiles.git ~/configDir

mv ~/configDir/nvim/ ~/.config/

mv ~/configDir/.tmux.conf ~/configDir/.vimrc ~/

rm -rf ~/configDir
