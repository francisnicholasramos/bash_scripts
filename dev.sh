#!/usr/bin/env bash

sudo apt update
sudo apt install -y curl git fzf tmux xclip unzip tar gzip build-essential

mkdir $HOME/configDir

mkdir $HOME/.config

mkdir $HOME/.vim

git clone https://github.com/francisnicholasramos/dotfiles.git $HOME/configDir

mv ~/configDir/nvim ~/.config/

mv ~/configDir/.tmux.conf ~/

cat ~/configDir/.bashrc >> ~/.bashrc

cp -r ~/.config/nvim/colors ~/.vim

echo 'export PATH=/opt/nvim/bin:$PATH' >> ~/.bashrc
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

echo ""
echo "========================="
echo " Installing NeoVim..."
echo "========================="
echo ""

curl -LO https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz

tar -xzf nvim-linux-x86_64.tar.gz

sudo mv nvim-linux-x86_64 /opt/nvim

echo ""
echo "======================================="
echo " Don't forget to:  source ~/.bashrc "
echo "======================================="
echo ""
