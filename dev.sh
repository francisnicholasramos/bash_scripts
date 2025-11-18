#!/usr/bin/env bash

sudo apt update
sudo apt install -y git fzf tmux xclip curl unzip tar gzip cmake gettext lua5.1 liblua5.1-0-dev build-essential

export NVM_DIR="$HOME/.nvm"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts

git clone -b v0.11.5 https://github.com/neovim/neovim.git $HOME/personal/neovim

cd $HOME/personal/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

cd

mkdir -p ~/configDir

git clone https://github.com/francisnicholasramos/dotfiles.git ~/configDir

mv ~/configDir/nvim/ ~/.config/

mv ~/configDir/.tmux.conf ~/configDir/.vimrc ~/
rm -rf ~/configDir

sudo apt install cmake gettext lua5.1 liblua5.1-0-dev

