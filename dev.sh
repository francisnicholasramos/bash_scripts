#!/usr/bin/env bash

sudo apt update
sudo apt install -y curl git fzf tmux xclip unzip tar gzip build-essential

echo "Installing NodeJs..."
cd ~
curl -LO https://nodejs.org/dist/v24.11.1/node-v24.11.1.tar.gz

sudo mv node-v24.11.1 /usr/local/node

echo 'export PATH=/usr/local/node/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

mkdir $HOME/configDir

mkdir $HOME/.config

git clone https://github.com/francisnicholasramos/dotfiles.git $HOME/configDir

mv ~/configDir/nvim ~/.config/

mv ~/configDir/.tmux.conf ~/configDir/.vimrc ~/

rm -rf $HOME/configDir
