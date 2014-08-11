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
set laststatus=2   " ステータス行を常に表示
set t_Co=256
set cmdheight=1    " メッセージ表示欄を1行確保
set whichwrap=h,l
set nowrapscan


nnoremap <silent> tt  :<C-u>tabe<CR>
nnoremap <C-p>  gT
nnoremap <C-n>  gt

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
nnoremap <silent> vs :vsplit"<CR><C-w>l

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor

imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

"---------------------------
" Start Neobundle Settings.
"---------------------------

"" bundleで管理するディレクトリを指定
"if has('vim_starting')
"    set runtimepath+=~/.vim/bundle/neobundle.vim/
"endif
"
"" Required:
"call neobundle#rc(expand('~/.vim/bundle/'))
"
"" Let NeoBundle manage NeoBundle
"" Required:
"NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc.vim', {
"      \ 'build' : {
"      \     'windows' : 'tools\\update-dll-mingw',
"      \     'cygwin' : 'make -f make_cygwin.mak',
"      \     'mac' : 'make -f make_mac.mak',
"      \     'unix' : 'make -f make_unix.mak',
"      \    },
"      \ }
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/vimfiler.vim'
"NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'mattn/emmet-vim'
"NeoBundle 'Shougo/neocomplcache.vim'
"NeoBundle 'itchyny/lightline.vim'
"
"call neobundle#end()
"
"" Required:
"filetype plugin indent on
"
"" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
"" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
"NeoBundleCheck
"
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
noremap <C-h> <C-w>
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

" スペースw,q,Qで保存，終了処理
nnoremap <Space>w  :<C-u>w<CR>
nnoremap <Space>q  :<C-u>q<CR>
nnoremap <Space>Q  :<C-u>q!<CR>

" スペースh,lで文頭文末移動
nnoremap <Space>h  ^
nnoremap <Space>l  $
nnoremap d<Space>l d$
nnoremap d<Space>h d^

" スペースo,Oで空白行の挿入
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

" ESC ESC打鍵で検索用ハイライトの無効化
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

" jkと素早く打鍵すると入力モードを抜ける
inoremap jk  <Esc>

" コマンドラインモードでの移動をEmacsライクなキーバインドに
cnoremap <C-f>  <Right>
cnoremap <C-b>  <Left>
cnoremap <C-a>  <C-b>
cnoremap <C-e>  <C-e>
cnoremap <C-u> <C-e><C-u>
cnoremap <C-v> <C-f>a

nnoremap <Space>/  *<C-o>
nnoremap g<Space>/ g*<C-o>

nnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
nnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
vnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
vnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'

" Vimで括弧の補完→改行してインデント
inoremap {<Enter> {}<Left><CR><BS><ESC><S-o>
inoremap [<Enter> []<Left><CR><BS><ESC><S-o>
inoremap (<Enter> ()<Left><CR><BS><ESC><S-o>


function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction


" なんか公式推奨のlightlineの設定

let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" http://deris.hatenablog.jp/entry/2014/05/20/235807
" http://www.geek.sc/archives/977
