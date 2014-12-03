syntax enable
filetype indent on
filetype plugin indent on

" neobundle
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'VimClojure'
NeoBundle 'tpope/vim-pathogen'
execute pathogen#infect()

" calendar.vim
NeoBundle 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" Quickrun設定
au BufNewFile,BufRead *.go set filetype=go
au BufNewFile,BufRead *.pl set filetype=perl
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.rb set filetype=ruby
au BufNewFile,BufRead *.py set filetype=python
NeoBundle 'thinca/vim-quickrun'
NeoBundle "osyo-manga/unite-quickfix"
NeoBundle "osyo-manga/shabadou.vim"
let g:quickrun_config = {}
let g:quickrun_config={'_': {'split': ''}}
set splitbelow    " 横分割したら新しいウィンドウは下に
"let g:quickrun_config={'_': {'split': 'vertical'}}
"set splitright    " 縦分割したら新しいウィンドウは右に

" Quickrunショートカット
nnoremap <C-k> :QuickRun<C-m>

"open-browser.vim設定
NeoBundle 'tyru/open-browser.vim'
nmap <C-l> <Plug>(openbrowser-open)
let g:quickrun_config['html'] = {
      \   'outputter': 'browser'
      \ }

" Quickrun_Markdown設定
NeoBundle 'hallison/vim-markdown'
let g:quickrun_config['markdown'] = {
      \   'outputter': 'browser'
      \ }

" PrevimOpen_Markdown設定
NeoBundle 'kannokanno/previm'
" PrevimOpenプレビューのショートカット
nnoremap <silent> <C-p> :PrevimOpen<CR>

" hateblo.vim
NeoBundle 'moznion/hateblo.vim'
NeoBundle 'mattn/webapi-vim'

" 行表示
set number

" 右下に行・列の番号を表示する
set ruler

set showcmd

" ステータス行の表示
set laststatus=2

" メッセージ表示欄の行確保
set cmdheight=2

" backupfileを作らない
set nobackup

" swapfileを作らない
set noswapfile

" カーソルキーおよびh,lキーで行末／行頭から上下行への移動可能
set whichwrap=b,s,[,],<,>,h,l

" ノーマルモードで表示行移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" 挿入モードでEmacs的移動
noremap! <C-a> <Home>
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-e> <End>
noremap! <C-d> <Del>
noremap! <C-k> <C-o>D

noremap! <C-j> <Esc>

" 括弧入力時に1文字分左（括弧内）にカーソル移動
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>

" undo履歴を ~/.vimundo ディレクトリに保存して次回起動時に復元
set undodir=~/.vimundo undofile

" Searching
set ignorecase "Ignoring capital and lower case when searching
set smartcase "If searching condition includes both of capital and lower, distinguish them
set incsearch "Doing incremental search
set wrapscan "Enable wrap search
set hlsearch "Highlighting results of searching
set showmatch

" OSのクリップボードを使う
set clipboard+=unnamed
set clipboard=unnamed

" 対応括弧の表示秒数を3秒にする
set matchtime=3

" ファイル形式によってタブのルールを個別設定
if has("autocmd")
  filetype on
  autocmd FileType markdown setlocal ts=2 sts=2 sw=2 et
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 et
  autocmd FileType php setlocal ts=4 sts=4 sw=4 et
  autocmd FileType perl setlocal ts=4 sts=4 sw=4 et
  autocmd FileType html setlocal ts=4 sts=4 sw=4 et
endif

" Perl開始時のおまじないショートカット
inoremap ,ff #!/usr/bin/env perl<CR>use strict;<CR>use warnings;
inoremap ,ee __END__

" 改行時に前の行のインデントを継続
set autoindent

" 日時入力のショートカット
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M')
inoremap <expr> ,ds strftime('%Y-%m-%d')
inoremap <expr> ,dd strftime('%H:%M')

" vimrc, gvimrcへのショートカット
nnoremap <silent> <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <silent> <Space>, :<C-u>edit $MYGVIMRC<Enter>

" ハイライトを消すショートカット
nnoremap <C-h> :nohl<CR>

" yy で y$ の代わりに
nnoremap Y y$

" wrap初期設定
set wrap

" wrapショートカット
nnoremap <Space><C-w> :set nowrap<CR>
nnoremap <Space><C-q> :set wrap<CR>

nnoremap <Space>h  ^
nnoremap <Space>l  $

nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

" Calendar.vim ショートカット
nnoremap <Space>c  :Calendar -split=horizontal<CR>
