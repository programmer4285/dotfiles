#!/bin/bash

echo "Setting up your Mac…"

defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

if [ ! -f ~/.ssh/id_ed25519 ]; then
	read -p "Enter your email for SSH keygen: " email
	echo "Generating SSH key for $email"
	ssh-keygen -t ed25519 -C “$email”
	eval "$(ssh-agent -s)"
	ssh-add —apple-use-keychain ~/.ssh/id_ed25519
	pbcopy <~/.ssh/id_ed25519.pub
	echo "Your SSH key has been copied to your clipboard."
	echo "Add it to Github: https://github.com/settings/ssh/new"
	read -p "Press enter to continue…"
else
	echo "SSH key already exists, skipping generation"
fi

if ! command -v brew &>/dev/null; then
	echo "Installing Homebrew…"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/john/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	echo "Homebrew is already installed."
fi

if [ ! -d ~/dotfiles ]; then
	echo "Cloning dotfiles…"
	git clone git@github.com:tneuqole/dotfiles.git ~/dotfiles
else
	echo "dotfiles folder already exists, skipping clone."
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "Installing Oh My Zsh..."
	RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "Oh My Zsh is already installed."
fi

echo "Installing packages from Brewfile..."
cd ~/dotfiles
brew bundle

brew services start sketchybar

find ~/dotfiles -name .DS_Store -delete
stow lazyvim
stow zsh
stow kitty
stow aerospace

source ~/.zshrc

mise install python
mise install go
mise install node
mise use -g python go node

# for rendering diagrams in neovim
echo "Installing mermaid-cli..."
npm install -g @mermaid-js/mermaid-cli
