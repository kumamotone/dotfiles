ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_zshrc ~/.zshrc
ln -s ~/dotfiles/_screenrc ~/.screenrc
ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/_gitconfig ~/.gitconfig
# bundle $B$r%$%s%9%H!<%k(B
git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/vimfiles/bundle/neobundle.vim

# molokai 入れたい場合
mkdir vimfiles
git clone https://github.com/tomasr/molokai
mv molokai/ vimfiles/
mkdir vimfiles/colors
mv vimfiles/molokai/colors/molokai.vim vimfiles/colors/
ln -s ~/dotfiles/vimfiles ~/.vim

brew install fish
sudo cat /usr/local/bin/fish >> /etc/shells
chsh -s /usr/local/bin/fish

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install peco
brew install peco

brew install cocoapods
brew install rbenv

brew install cask
brew install iterm2 --cask
brew install google-japanese-ime --cask
brew install visual-studio-code --cask
