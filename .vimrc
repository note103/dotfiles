" neobundle
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

filetype plugin indent on     " required!
filetype indent on
syntax on

" tpope / vim-pathogen
NeoBundle 'tpope/vim-pathogen'
execute pathogen#infect()
syntax on
filetype plugin indent on

" calendar.vim
NeoBundle 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" Markdown設定
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \   'outputter': 'browser'
      \ }
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'hallison/vim-markdown'

" Markdown-PrevimOpen設定
NeoBundle 'kannokanno/previm'
let g:previm_open_cmd=open -a Firefox
" プレビューのショートカット
nnoremap <silent> <C-p> :PrevimOpen<CR>

" hateblo.vim
NeoBundle 'moznion/hateblo.vim'
NeoBundle 'mattn/webapi-vim'

" hatena.vim
NeoBundle 'motemen/hatena-vim'
let g:hatena_user='note103'
let g:hatena_upload_on_write = 0
let g:hatena_upload_on_write_bang = 1
let g:hatena_no_default_keymappings = 1
let g:hatena_entry_file = '~/Dropbox/me/docs/tools/hatena.txt'

" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d<Tab>%H:%M:%S')
inoremap <expr> ,ds strftime('%Y/%m/%d')
inoremap <expr> ,dd strftime('%H:%M:%S')

" vimrc等へのショートカット
nnoremap <silent> <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <silent> <Space>, :<C-u>edit $MYGVIMRC<Enter>

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

" バックアップファイル作らない
set nobackup

" ハイライト表示すぐ消せるように
nnoremap <C-l> :nohl<CR>

:set ts=4 sw=4 sts=0

" ファイル形式によってタブのルールを個別設定
if has("autocmd")
  filetype on
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 et
  autocmd FileType perl setlocal ts=4 sts=4 sw=4 et
  autocmd FileType html setlocal ts=4 sts=4 sw=4 et
  autocmd FileType mkd setlocal ts=4 sts=4 sw=4 et
endif

" 改行時に前の行のインデントを継続
set autoindent

" undo履歴を ~/.vimundo ディレクトリに保存して次回起動時に復元(Vim 7.3 以降)
set undodir=~/.vimundo undofile

" Remember cursor position when closed just before {{{
if has("autocmd")
  au MyAutoCmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \ exe "normal! g'\"" |
        \ endif
endif
"}}}

" Searching
set ignorecase "Ignoring capital and lower case when searching
set smartcase "If searching condition includes both of capital and lower, distinguish them
set incsearch "Doing incremental search
set wrapscan "Enable wrap search
set hlsearch "Highlighting results of searching

" OSのクリップボードを使う
set clipboard+=unnamed
set clipboard=unnamed

" 対応括弧の表示秒数を3秒にする
set matchtime=3

" Perl開始時のおまじない
inoremap ,ff #!/usr/bin/env perl<CR>use strict;<CR>use warnings;

"\を打ちやすく
inoremap <C-@> \
"
" ●ショートカット
inoremap <C-n> ●

" Quickrun設定
au BufNewFile,BufRead *.go set filetype=go
au BufNewFile,BufRead *.pl set filetype=perl
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.rb set filetype=ruby
au BufNewFile,BufRead *.py set filetype=python
let g:quickrun_config={'_': {'split': 'vertical'}}
"set splitbelow    " 横分割したら新しいウィンドウは下に
set splitright    " 縦分割したら新しいウィンドウは右に
NeoBundle "osyo-manga/unite-quickfix"
NeoBundle "osyo-manga/shabadou.vim"
