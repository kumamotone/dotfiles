set nocompatible "vi互換ではなくVimのデフォルト設定にする

syntax on "シンタックスハイライト
set encoding=utf8 "エンコード
set list "不可視文字を表示
set number "行番号を表示
set ruler "右下位に表示される行・列の番号を表示する
set clipboard+=unnamed
set clipboard=unnamed "OSのクリップボードを使う
set matchtime=3 "の表示秒数を3秒に
set wrap "ウィンドウの幅より長い行は折り返され，次の行に続けて表示される
set ignorecase " 小文字の検索でも大文字も見つかるようにする
set smartcase " ただし大文字も含めた検索の場合はその通りに検索する
set incsearch " インクリメンタルサーチを行う
set hlsearch " 検索結果をハイライト表示
set ttymouse=xterm2 " xtermとscreen対応
set showcmd " コマンドを画面最下部に表示する
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set cursorline     " カーソル行の背景色を変える
set laststatus=2   " ステータス行を常に表示

set cmdheight=1    " メッセージ表示欄を1行確保

" タブ/インデントの設定

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

set wildmenu wildmode=list:longest,full

noremap <silent> fm :Unite file_mru<CR>
" vimfilerの起動
nnoremap <silent> vf :VimFiler<CR>

"---------------------------
" Start Neobundle Settings.
"---------------------------

" bundleで管理するディレクトリを指定
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'itchyny/lightline.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

"-------------------------------------------------
" ユーザー定義関数
"-------------------------------------------------
 
 " Paste Mode
 " {{{
 let paste_mode = 0 " 0 = normal, 1 = paste
 
 function! Paste_on_off()
 if g:paste_mode == 0
 set paste
 let g:paste_mode = 1
 else
 set nopaste
 let g:paste_mode = 0
 endif
 return
 endfunc
 " }}}


"-------------------------------------------------
" Function ユーザー定義関数
"-------------------------------------------------
 
 " Paste Mode <F10>
 nnoremap <silent> <F10> :call Paste_on_off()<CR>
 set pastetoggle=<F10>

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

"molokaiを使うときは
"ホームディレクトリ配下には~/.vim/colors/を作成して
" # mkdir ~/.vim
" # cd ~/.vim
" # mkdir colors
"githubからとってくる
" # git clone https://github.com/tomasr/molokai
" # mv molokai/colors/molokai.vim ~/.vim/colors/

" Ctrl + hjkl でウィンドウ間を移動
noremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
else
    set clipboard& clipboard+=unnamed,autoselect
endif 

nnoremap <Space>w  :<C-u>w<CR>
nnoremap <Space>q  :<C-u>q<CR>
nnoremap <Space>Q  :<C-u>q!<CR>

nnoremap <Space>h  ^
nnoremap <Space>l  $

nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

inoremap jk  <Esc>

cnoremap <C-f>  <Right>
cnoremap <C-b>  <Left>
cnoremap <C-a>  <C-b>
cnoremap <C-e>  <C-e>
cnoremap <C-u> <C-e><C-u>
cnoremap <C-v> <C-f>a

nnoremap <Space>/  *<C-o>
nnoremap g<Space>/ g*<C-o>

" http://deris.hatenablog.jp/entry/2014/05/20/235807
" http://www.geek.sc/archives/977



