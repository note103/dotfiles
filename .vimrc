scriptencoding utf-8

filetype on
filetype plugin on
filetype indent on
syntax on

set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'thinca/vim-ref'

" Quickrun.vim
NeoBundle 'thinca/vim-quickrun'
NeoBundle "osyo-manga/unite-quickfix"
NeoBundle "osyo-manga/shabadou.vim"

" Quickrun window setting
let g:quickrun_config = {'_': {'split': ''}}
set splitbelow
"let g:quickrun_config = {'_': {'split': 'vertical'}}
"set splitright

nnoremap <C-k> :QuickRun<C-m>

" Markdown
" Quickrun_Markdown
NeoBundle 'hallison/vim-markdown'
let g:quickrun_config['markdown'] = {
      \   'outputter': 'browser'
      \ }

" PrevimOpen_Markdown
NeoBundle 'kannokanno/previm'
nnoremap <silent> <C-p> :PrevimOpen<CR>

"Open-browser
NeoBundle 'tyru/open-browser.vim'
nmap <C-l> <Plug>(openbrowser-open)
let g:quickrun_config['html'] = {
      \   'outputter': 'browser'
      \ }

" Calendar.vim
NeoBundle 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
nnoremap <Space>c  :Calendar -split=horizontal<CR>
nnoremap <Space><Space>c  :Calendar<CR>

" Hateblo.vim
NeoBundle 'moznion/hateblo.vim'
NeoBundle 'mattn/webapi-vim'

set autoindent
set backup
set backupdir=~/.vim/tmp
set cmdheight=2
set directory=~/.vim/tmp
set foldmethod=marker
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchtime=3
set number
set ruler
set showcmd
set showmatch
set smartcase
set swapfile
set undodir=~/.vimundo undofile
set whichwrap=b,s,[,],<,>,h,l
set wrap
set wrapscan
set clipboard=unnamed

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap Y y$
nnoremap <C-h> :nohl<CR>
nnoremap <Space><C-w> :set nowrap<CR>
nnoremap <Space><C-q> :set wrap<CR>
nnoremap <Space>h  ^
nnoremap <Space>l  $
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
nnoremap <Space>. :sp $MYVIMRC<Enter>
nnoremap <Space>, :sp $MYGVIMRC<Enter>
nnoremap <Space><Space>, :edit $MYGVIMRC<CR>
nnoremap <Space><Space>. :edit $MYVIMRC<CR>
nnoremap <Space>sv :source $HOME/.vimrc<CR>
nnoremap <Space><Space>n  :%s///gn
nnoremap <Space><Space>s  :%s///gc
nnoremap <Space>vs  :VimShell<CR>
nnoremap <Space>vb :sp $HOME/.vimshrc<CR>
nnoremap <Space><Space>vb :edit $HOME/.vimshrc<CR>
nnoremap <Space><Space>l  :%s/\s\+$//gc<CR>

noremap! <C-a> <Home>
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-e> <End>
noremap! <C-d> <Del>
noremap! <C-h> <Backspace>
noremap! <C-k> <C-o>D
inoremap ,,e <Esc>:NeoCompleteEnable<Enter>a
inoremap ,,l <Esc>:NeoCompleteLock<Enter>a
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
inoremap ,ee __END__
inoremap ,dt __DATA__
map ,pt :%! perltidy -se<CR>
map ,ptv :'<,'>! perltidy -se<CR>

" Tabspace
if has("autocmd")
  filetype on
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
  autocmd FileType markdown setlocal ts=2 sts=2 sw=2 et
  autocmd FileType sh setlocal ts=4 sts=4 sw=4 et
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 et
  autocmd FileType php setlocal ts=4 sts=4 sw=4 et
  autocmd FileType perl setlocal ts=4 sts=4 sw=4 et
  autocmd FileType html setlocal ts=4 sts=4 sw=4 et
  autocmd FileType json setlocal ts=4 sts=4 sw=4 et
endif
set expandtab
set ts=4 sw=4 sts=0

" Snippets
" Plugin key-mappings.
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

nnoremap <Space><Space>pl :sp $HOME/.vim/bundle/neosnippet-snippets/neosnippets/perl.snip<CR>
nnoremap <Space><Space>rb :sp $HOME/.vim/bundle/neosnippet-snippets/neosnippets/ruby.snip<CR>
nnoremap <Space><Space>sql :sp $HOME/.vim/bundle/neosnippet-snippets/neosnippets/sql.snip<CR>
nnoremap <Space><Space>sh :sp $HOME/.vim/bundle/neosnippet-snippets/neosnippets/sh.snip<CR>
nnoremap <Space><Space>md :sp $HOME/.vim/bundle/neosnippet-snippets/neosnippets/markdown.snip<CR>
nnoremap <Space><Space>h :sp $HOME/.vim/bundle/neosnippet-snippets/neosnippets/html.snip<CR>
nnoremap <Space><Space>php :sp $HOME/.vim/bundle/neosnippet-snippets/neosnippets/php.snip<CR>

" Omnifunc
autocmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif

" Neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define keyword
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" filetype setting
augroup filetypedetect
    au BufNewFile,BufRead *.sh set filetype=sh
    au BufNewFile,BufRead *.rb set filetype=ruby
    au BufNewFile,BufRead *.js set filetype=javascript
    au BufNewFile,BufRead *.py set filetype=python
    au BufNewFile,BufRead *.go set filetype=go
    au BufNewFile,BufRead *.pl set filetype=perl
    au BufNewFile,BufRead *.psgi set filetype=perl
    au BufNewFile,BufRead *.t set filetype=perl
    au BufNewFile,BufRead cpanfile set filetype=perl
    au BufNewFile,BufRead *.tt set filetype=tt2html
    au BufNewFile,BufRead *.tt2 set filetype=tt2html
augroup END

" template setting
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl-script.txt
autocmd BufNewFile *.pm 0r $HOME/.vim/template/perl-script.txt
autocmd BufNewFile *.t 0r $HOME/.vim/template/perl-test.txt
autocmd BufNewFile *.sh 0r $HOME/.vim/template/sh.txt
autocmd BufNewFile *.html 0r $HOME/.vim/template/html.txt

call neobundle#end()
