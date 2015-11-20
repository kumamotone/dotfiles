" めちゃんこ参考にさせていただいた↓
" ぼくのかんがえたさいしょうのvimrc - derisの日記
"  http://deris.hatenablog.jp/entry/2014/05/20/235807
" おすすめの.vimrc設定と.zshrc設定 - 株式会社参謀本部の社長ブログ
"  http://www.geek.sc/archives/977
" Ragiko氏のvimrc
"  https://github.com/ragiko/vimrc

syntax on "シンタックスハイライト
"set nocompatible "vi互換ではなくVimのデフォルト設定にする
"set encoding=utf-8 "エンコード
"set fenc=utf-8:set encoding=utf-8
set encoding=utf-8
" set termencoding=utf-8
" set fileencodings=utf-8,cp932
" ✝✝軽い気持ちで以下を入れると死ぬ✝✝
" set fileformats=mac,unix,dos
set number "行番号を表示
" OS のクリップボードを使う
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
else
    set clipboard& clipboard+=unnamed,autoselect
endif 
set ruler "右下位に表示される行・列の番号を表示する
set matchtime=3 "の表示秒数を3秒に
set wrap "ウィンドウの幅より長い行は折り返され，次の行に続けて表示される
set ignorecase " 小文字の検索でも大文字も見つかるようにする
set smartcase " ただし大文字も含めた検索の場合はその通りに検索する
set incsearch " インクリメンタルサーチを行う
set hlsearch " 検索結果をハイライト表示
set ttymouse=xterm2 " xtermとscreen対応
set showcmd " コマンドを画面最下部に表示する
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set laststatus=2 " ステータス行を常に表示
set t_Co=256 " lightline使うときになんとなく書いとけって書いてあったから書いてる
set cmdheight=1 " メッセージ表示欄を1行確保
set whichwrap=h,l "左右のカーソル移動において、行を跨いで移動出来る様にするオプション
set wrapscan " 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する。
set noswapfile "スワップファイルは使わない
set listchars=tab:>\ ,extends:<

" タブ/インデントの設定
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

set wildmenu wildmode=list:longest,full

noremap <silent> fm :Unite file_mru<CR>
" viwmfilerの起動
nnoremap <silent> vf :VimFiler<CR>
nnoremap <silent> vs :vsplit"<CR>:VimFiler<CR>

" Ctrl + hl でウィンドウ間を移動
noremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

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

" /で検索した場合と、?で検索した場合で、
" nとNで移動する方向が異なるのが不便
" このため、/と?のどちらで検索した場合でも、nで前方検索
" Nで後方検索するよう設定

nnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
nnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
vnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
vnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'

function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction

" 色設定　黒背景にmolokai
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

" Vimで括弧の補完→改行してインデント
inoremap {<Enter> {}<Left><CR><BS><ESC><S-o>
inoremap [<Enter> []<Left><CR><BS><ESC><S-o>
inoremap (<Enter> ()<Left><CR><BS><ESC><S-o>


" JSON のダブルクォーテーションを自動で消してくれる機能を無効化
let g:vim_json_syntax_conceal = 0

" Vimで入力補完を常にオンにするvimrc
" http://io-fia.blogspot.jp/2012/11/vimvimrc.html

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

" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 NeoBundle 'Shougo/unite.vim' " ファイルオープンを便利に(VimFiler用)
 NeoBundle 'Shougo/vimfiler.vim' " ファイラ
 NeoBundle 'Shougo/neomru.vim' " Unite.vimで最近使ったファイルを表示できるようにする(VimFiler用)
 NeoBundle 'thinca/vim-quickrun' " :QuickRun でクイック実行
NeoBundle 'Shougo/neocomplcache.vim' "入力補完機能を提供する Vim のプラグイン
NeoBundle 'itchyny/lightline.vim' " Statuslineを豪華に
NeoBundle 'Yggdroot/indentLine' " インデントを見やすく 
NeoBundle 'tpope/vim-endwise' " Ruby向けにendを自動挿入してくれる 
NeoBundle 'tomtom/tcomment_vim' " コメントON/OFFを手軽に実行
NeoBundle 'ConradIrwin/vim-bracketed-paste' " paste mode 自動化
NeoBundle 'elzr/vim-json'

" My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" ペーストモード　vimはコンソール外から貼り付けとかしてくるときに
" インデントがおかしくなるみたいなのでF10で切り替えられるようにしておく

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

" Paste Mode <F10>
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>

"-----------------------------------------------------------------------------
"
" ここからよく意味はわかってないけど公式推奨のlightlineの設定
"
"-----------------------------------------------------------------------------

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

"-----------------------------------------------------------------------------
"
" よく意味はわかってないけど公式推奨のlightlineの設定 ここまで
"
"-----------------------------------------------------------------------------

" Powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"set laststatus=2
"set showtabline=2
"set noshowmode
