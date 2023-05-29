# for M1
set -g -x PATH $PATH /opt/homebrew/bin
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# ignore greeting
set fish_greeting

# peco
function fish_user_key_bindings
    bind \cr peco_select_history
end

# set -x EDITOR        'atom'

# Mac は LS_COLORS, Ubuntu等は LSCOLORS
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LSCOLORS=gxfxcxdxbxegedabagacad

set PATH ~/Library/Android/sdk/tools $PATH
set PATH ~/Library/Android/sdk/platform-tools $PATH
set PATH ~/.pyenv/bin $PATH
set PATH "/usr/local/bin/" $PATH
set PATH ~/flutter/bin $PATH

set PATH /usr/local/share/git-core/contrib/diff-highlight $PATH

#rbenv init - --no-rehash | source
#. (pyenv init - --no-rehash | psub)

set HISTSIZE 1000000
set SAVEHIST 1000000

set -U GHQ_SELECTOR peco

alias v='vim'
alias g='git'
alias gg='ghq get'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/kakumamo/your-name/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/kakumamo/your-name/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/kakumamo/your-name/node_modules/tabtab/.completions/sls.fish ]; and . /Users/kakumamo/your-name/node_modules/tabtab/.completions/sls.fish

# iterm
# source ~/.iterm2_shell_integration.(basename $SHELL)

#set -x GOENV_ROOT $HOME/.goenv
#set -x PATH $GOENV_ROOT/bin $PATH
#eval (goenv init - | source)
#set -x PATH $GOPATH/bin $PATH

echo -e "\nsource "(brew --prefix asdf)"/asdf.fish"
