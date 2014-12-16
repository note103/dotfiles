scriptencoding utf-8

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
syntax on

set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'thinca/vim-ref'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle "vim-perl/vim-perl"

"Open-browser
NeoBundle 'tyru/open-browser.vim'
nmap <C-l> <Plug>(openbrowser-open)
let g:quickrun_config['html'] = {
      \   'outputter': 'browser'
      \ }

" Quickrun.vim
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
set splitbelow
"let g:quickrun_config={'_': {'split': 'vertical'}}
"set splitright
nnoremap <C-k> :QuickRun<C-m>

" Quickrun_Markdown
NeoBundle 'hallison/vim-markdown'
let g:quickrun_config['markdown'] = {
      \   'outputter': 'browser'
      \ }

" PrevimOpen_Markdown
NeoBundle 'kannokanno/previm'
nnoremap <silent> <C-p> :PrevimOpen<CR>

" Calendar.vim
NeoBundle 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
nnoremap <Space>c  :Calendar -split=horizontal<CR>

" Hateblo.vim
NeoBundle 'moznion/hateblo.vim'
NeoBundle 'mattn/webapi-vim'

set autoindent
set cmdheight=2
set foldmethod=marker
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchtime=3
set nobackup
set noswapfile
set number
set ruler
set showcmd
set showmatch
set smartcase
set undodir=~/.vimundo undofile
set whichwrap=b,s,[,],<,>,h,l
set wrap
set wrapscan
set clipboard+=unnamed
set clipboard=unnamed

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap Y y$
noremap! <C-a> <Home>
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-e> <End>
noremap! <C-d> <Del>
noremap! <C-k> <C-o>D
noremap! <C-j> <Esc>
nnoremap <C-h> :nohl<CR>
nnoremap <Space><C-w> :set nowrap<CR>
nnoremap <Space><C-q> :set wrap<CR>
nnoremap <Space>h  ^
nnoremap <Space>l  $
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
nnoremap <silent> <Space><Space>l :NeoCompleteLock<Enter>
nnoremap <silent> <Space><Space>u :NeoCompleteUnlock<Enter>
nnoremap <silent> <Space>. :sp $MYVIMRC<Enter>
nnoremap <silent> <Space>, :sp $MYGVIMRC<Enter>
nnoremap <silent> <Space><Space>, :<C-u>edit $MYGVIMRC<Enter>
nnoremap <silent> <Space><Space>. :<C-u>edit $MYVIMRC<Enter>

inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap // //<LEFT>
inoremap `` ``<LEFT>
inoremap <> <><LEFT>
inoremap <Bar><Bar> <Bar><Bar><LEFT>
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M')
inoremap <expr> ,ds strftime('%Y-%m-%d')
inoremap <expr> ,dd strftime('%H:%M')

" Tabspace
if has("autocmd")
  filetype on
  autocmd FileType markdown setlocal ts=2 sts=2 sw=2 et
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 et
  autocmd FileType php setlocal ts=4 sts=4 sw=4 et
  autocmd FileType perl setlocal ts=4 sts=4 sw=4 et
  autocmd FileType html setlocal ts=4 sts=4 sw=4 et
  autocmd FileType json setlocal ts=4 sts=4 sw=4 et
endif
set expandtab
set ts=4 sw=4 sts=0

" Snippets
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
nnoremap <Space><Space>ps :sp $HOME/.vim/bundle/vim-snippets/snippets/perl.snip<CR>
imap <C-q>     <Plug>(neosnippet_expand_or_jump)
smap <C-q>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Omnifunc
autocmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif

" Neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Perl
augroup filetypedetect
    au BufNewFile,BufRead *.psgi    setf perl
    au BufNewFile,BufRead *.t       setf perl
    au BufNewFile,BufRead *.tt      setf tt2html
    au BufNewFile,BufRead *.tt2     setf tt2html
    au BufNewFile,BufRead cpanfile  setf perl
augroup END

" http://perl-users.jp/articles/advent-calendar/2012/casual/13
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl-script.txt
autocmd BufNewFile *.t  0r $HOME/.vim/template/perl-test.txt
map ,pt <Esc>:%! perltidy -se<CR>
map ,ptv <Esc>:'<,'>! perltidy -se<CR>

call neobundle#end()
