" フォント設定
set guifont=Ricty-Regular:h15

" ウィンドウ設定
set lines=90 columns=120
set transparency=0

" スクロールバーを消す
set guioptions-=L

" ビープ音消去
set vb t_vb=

"Displaying
" 自動折り返し不可
set formatoptions=q
set textwidth=0
set tw=0

" 画面最後の行をできる限り表示
set display+=lastline

" 行表示
set number
" 右下に表示される行・列の番号を表示する
set ruler
set wrap
set showcmd
" カーソル行の背景色を変える
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
"highlight CursorLine ctermbg=4 guibg=black

" カーソル位置のカラムの背景色を変える
"set cursorcolumn
" ステータス行を常に表示
set laststatus=2
" メッセージ表示欄を2行確保
set cmdheight=2

" Setting of color scheme {{{
if !has('win32unix')
  set t_Co=256
  set background=light
  colorscheme solarized
endif
"}}}

" 日本語/アルファベット表示
if has('multi_byte_ime') || has('xim')
  highlight Cursor guifg=NONE guibg=Darkyellow
  highlight CursorIM guifg=NONE guibg=Darkred
endif

" Highlighting noisy white spaces {{{
highlight ZenkakuSpace guibg=#66CCCC
highlight TrailingZenkakuSpace guibg=#0099CC
highlight TopSpaces guibg=#FF6600
highlight Spaces guibg=#FFCC66
highlight TrailingSpaces guibg=#CC0033
highlight Tabs guibg=#CCCC99
highlight TrailingTabs guibg=#999966
augroup HighlightingNoisySpaces
  au!
  au BufNewFile,BufRead * call matchadd('ZenkakuSpace', '　')
  au BufNewFile,BufRead * call matchadd('TrailingZenkakuSpace', '　\{-1,}$')
  au BufNewFile,BufRead * call matchadd('Spaces', ' ')
  au BufNewFile,BufRead * call matchadd('TrailingSpaces', ' \{-1,}$')
  au BufNewFile,BufRead * call matchadd('TopSpaces', '^ ')
  au BufNewFile,BufRead * call matchadd('Tabs', '\t')
  au BufNewFile,BufRead * call matchadd('TrailingTabs', '\t\{-1,}$')
augroup END
"}}}

