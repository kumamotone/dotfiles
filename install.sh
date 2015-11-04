ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/vimfiles ~/.vim
ln -s ~/dotfiles/_zshrc ~/.zshrc
ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/_gitconfig ~/.gitconfig
# bundle をインストール
git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/vimfiles/bundle/neobundle.vim

# percol
# curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python
# sudo pip install percol

# change shell
# chsh -s /usr/bin/zsh
