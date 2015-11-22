ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/vimfiles ~/.vim
ln -s ~/dotfiles/_zshrc ~/.zshrc
ln -s ~/dotfiles/_screenrc ~/.screenrc
ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/_gitconfig ~/.gitconfig
# bundle $B$r%$%s%9%H!<%k(B
git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/vimfiles/bundle/neobundle.vim

# molokai 入れたい場合
git clone https://github.com/tomasr/molokai
mv molokai/ vimfiles/
mkdir vimfiles/colors
mv vimfiles/molokai/colors/molokai.vim vimfiles/colors/

# percol
# curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python
# sudo pip install percol

# change shell
# chsh -s /usr/bin/zsh
