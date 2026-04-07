#!/usr/bin/env bash

sudo pacman -Syu --noconfirm

# Install dependencies
sudo pacman -S --noconfirm curl git ripgrep tmux xclip unzip tar gzip base-devel

mkdir -p "$HOME/configDir"
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.vim"

git clone https://github.com/francisnicholasramos/dotfiles.git "$HOME/configDir"

mv "$HOME/configDir/nvim" "$HOME/.config/"
mv "$HOME/configDir/.tmux.conf" "$HOME/"

cat ~/configDir/.bashrc >> ~/.bashrc

cp -r "$HOME/.config/nvim/colors" "$HOME/.vim"

grep -qxF 'export PATH=/opt/nvim/bin:$PATH' ~/.bashrc || echo 'export PATH=/opt/nvim/bin:$PATH' >> ~/.bashrc
grep -qxF 'export PATH=/usr/local/node/bin:$PATH' ~/.bashrc || echo 'export PATH=/usr/local/node/bin:$PATH' >> ~/.bashrc

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
echo " Installing FZF..."
echo "========================="
echo ""

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

echo ""
echo "========================="
echo " Installing NeoVim..."
echo "========================="
echo ""

curl -LO https://github.com/neovim/neovim/releases/download/v0.12.0/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim

echo ""
echo "======================================="
echo " Don't forget to: source ~/.bashrc "
echo "======================================="
echo ""
