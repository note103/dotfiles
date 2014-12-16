" フォント設定
set guifont=Ricty-Regular:h15

" ウィンドウ設定
set lines=90 columns=80
set transparency=0

" スクロールバーを消す
set guioptions-=L

" ビープ音消去
set vb t_vb=

" 自動折り返し不可
set formatoptions=q
set textwidth=0
set tw=0

" 画面最後の行をできる限り表示
set display+=lastline

" カーソル行の背景色を変える
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline

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
highlight TopSpaces guibg=#FFCC66
highlight Spaces guibg=#FFCC66 "FF6600 "CC0033
highlight TrailingSpaces guibg=#FF6600
highlight Tabs guibg=#CCCC99 "#d8e4cc #d8e4cc #CCCC99 #e5e5cc
highlight TrailingTabs guibg=#b3bb0a "#999966
augroup HighlightingNoisySpaces
  au!
  au BufNewFile,BufRead * call matchadd('ZenkakuSpace', '　')
  au BufNewFile,BufRead * call matchadd('TrailingZenkakuSpace', '　\{-1,}$')
  "au BufNewFile,BufRead * call matchadd('Spaces', ' ')
  au BufNewFile,BufRead * call matchadd('TrailingSpaces', ' \{-1,}$')
  au BufNewFile,BufRead * call matchadd('TopSpaces', '^ ')
  au BufNewFile,BufRead * call matchadd('Tabs', '\t')
  au BufNewFile,BufRead * call matchadd('TrailingTabs', '\t\{-1,}$')
augroup END
"}}}

