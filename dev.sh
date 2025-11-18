#!/usr/bin/env bash

sudo apt update
sudo apt install -y curl git fzf tmux xclip unzip tar gzip build-essential

mkdir $HOME/configDir

mkdir $HOME/.config

git clone https://github.com/francisnicholasramos/dotfiles.git $HOME/configDir

mv ~/configDir/nvim ~/.config/

mv ~/configDir/.tmux.conf ~/configDir/.vimrc ~/

echo 'export PATH=/usr/local/node/bin:$PATH' >> ~/.bashrc

echo ""
echo "========================="
echo " Installing NodeJs..."
echo "========================="
echo ""

cd ~

curl -O https://nodejs.org/dist/v24.11.1/node-v24.11.1-linux-x64.tar.xz

tar -xf node-v24.11.1-linux-x64.tar.xz

sudo mv node-v24.11.1-linux-x64 /usr/local/node

source ~/.bashrc


