# Make aliases
ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_zshrc ~/.zshrc
ln -s ~/dotfiles/_screenrc ~/.screenrc
ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/_gitconfig ~/.gitconfig
git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/vimfiles/bundle/neobundle.vim
ln -s ~/dotfiles/config.fish  ~/.config/fish/config.fish

# Configure
mkdir vimfiles
git clone https://github.com/tomasr/molokai
mv molokai/ vimfiles/
mkdir vimfiles/colors
mv vimfiles/molokai/colors/molokai.vim vimfiles/colors/
ln -s ~/dotfiles/vimfiles ~/.vim

# brew install cocoapods
# brew install peco

# brew install node

# brew install cask
# brew install iterm2 --cask
# brew install visual-studio-code --cask
# brew install bettertouchtool --cask 

# brew install fish

# echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
# chsh -s /opt/homebrew/bin/fish

# Intel mac
# echo /usr/local/bin/fish | sudo tee -a /etc/shells
# chsh -s /usr/local/bin/fish
