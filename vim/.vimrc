" Script Encoding
set encoding=utf-8
scriptencoding utf-8

" Save Directory
set browsedir=buffer

" Setting Display
 " Cursor
 set ruler
 set cursorline
 set cursorcolumn

 " Display
 set number
 set cmdheight=2
 set helpheight=999
 set scrolloff=10
 set sidescrolloff=15
 set sidescroll=1

 " Emphasize
 set showmatch
 set list
 set listchars=tab:>-,trail:_,eol:↲

 " 全角スペース・行末のスペース・タブの可視化
 if has("syntax")
    syntax on

    " PODバグ対策
    syn sync fromstart
    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab "\t" display containedin=ALL
        "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
    endfunction

    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
 endif

" Setting Input
set backspace=eol,start,indent
set whichwrap=b,s,<,[,>,]

 " Indent
 set autoindent
 set smartindent
 set cindent
 set smarttab
 set expandtab

 set tabstop=2
 set shiftwidth=2
 set softtabstop=2

 if has("autocmd")
   "ファイルタイプの検索を有効にする
   filetype plugin on
   "ファイルタイプに合わせたインデントを利用
   filetype indent on
   "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
   autocmd FileType c           setlocal sw=2 sts=2 ts=2 et
   autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
   autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
   autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
   autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
   autocmd FileType scala       setlocal sw=2 sts=2 ts=2 et
   autocmd FileType json        setlocal sw=2 sts=2 ts=2 et
   autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
   autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
   autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
   autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
   autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
 endif

" File
set hidden
set confirm
set autoread
set nobackup
set noswapfile

" Search
set nohlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault

" Clipboard
if has('gui') || has('xterm_clipboard')
  set clipboard=unnamed
endif

" Beep Sound
set visualbell
set errorbells

" Command Line
set wildmenu
set wildmode=list:longest,full
set history=10000

" Peripherals
set clipboard=unnamed,unnamedplus
set mouse=a

" Delay
set ttimeoutlen=10

" ファイルを開いた時に、以前のカーソル位置を復元する
function! s:RestoreCursorPosition()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup vimrc_restore_cursor_position
  autocmd!
  autocmd BufWinEnter ?* call s:RestoreCursorPosition()
augroup END

"アクティブウィンドウに限りカーソル行を強調する
augroup vimrc_set_cursorline_only_active_window
  autocmd!
  autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END


