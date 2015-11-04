dotfiles
===

## 内容

* zshrc
* vimrc
* screenrc
* tmux.conf
* gitconfig

## 自分用簡易説明

clone する

```
git clone https://github.com/kumamotone/dotfiles.git
```

install.sh に シンボリックリンクの設定等が入っているので実行する．
chmod する必要があるかも

```zsh
cd dotfiles
./install.sh
```

zsh と percol を使うのでインストール＋chshしてする．
(install.sh にもコメントアウトして書いてある)

```
 curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python
 sudo pip install percol
 chsh -s /usr/bin/zsh
```

screen を有効にする場合は zshrc 内の screen の自動起動設定を使用できる．