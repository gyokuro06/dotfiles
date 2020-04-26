" dein script2 (https://rcmdnk.com/blog/2017/08/20/computer-vim/)
  if &compatible
    set nocompatible               " Be iMproved
  endif

  augroup MyAutoCmd
    autocmd!
  augroup END

" dein----------------------------------------
  " Flags
  let s:use_dein = 1
  
  " Prepare .vim dir
  let s:vimdir = $HOME . '/.vim'
  if has('vim_starting')
    if ! isdirectory(s:vimdir)
      call system('mkdir ' . s:vimdir)
    endif
  endif
  
  " dein
  let s:dein_enabled  = 0
  if v:version >= 704 && s:use_dein && !filereadable(expand("~/.vim_no_dein"))
    let s:git = system("which git")
    if strlen(s:git) != 0
      " Set dein paths
      let s:dein_dir = s:vimdir . '/dein'
      let s:dein_github = s:dein_dir . '/repos/github.com'
      let s:dein_repo_name = 'Shougo/dein.vim'
      let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name
  
      " Check dein has been installed or not.
      if !isdirectory(s:dein_repo_dir)
        let s:is_clone = confirm("Prepare dein?", "Yes\nNo", 2)
        if s:is_clone == 1
          let s:dein_enabled = 1
          echo 'dein is not installed, install now '
          let s:dein_repo = 'https://github.com/' . s:dein_repo_name
          echo 'git clone ' . s:dein_repo . ' ' . s:dein_repo_dir
          call system('git clone ' . s:dein_repo . ' ' . s:dein_repo_dir)
        endif
      else
        let s:dein_enabled = 1
      endif
    endif
  endif
  
  " Begin plugin part
  if s:dein_enabled && &runtimepath !~# '/dein.vim'
    execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
    "let &runtimepath = &runtimepath . ',' . s:dein_repo_dir
  
    " Check cache
    if dein#load_state(s:dein_dir)
      call dein#begin(s:dein_dir)
  
      " プラグインリストを収めた TOML ファイル
      " 予め TOML ファイルを用意しておく
      let g:rc_dir    = s:vimdir . '/rc/'
      let s:toml      = g:rc_dir . '/dein.toml'
      let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

      " TOML を読み込み，キャッシュしておく
      call dein#load_toml(s:toml,     {'lazy':0})
      call dein#load_toml(s:lazy_toml,{'lazy':1})

      call dein#end()
      call dein#save_state()
    endif
  
    " }}} dein end
  
    " Installation check.
    if dein#check_install()
      call dein#install()
    endif
  endif
" dein-----------------------------------------


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
 "set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
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


" Keymapping
  " Save 
  nnoremap <CR> :<C-u>w<CR>
  
  " Quit
  nnoremap q :<C-u>q<CR>
  nnoremap Q q
  
  " Window
  nnoremap s  <Nop>
  nnoremap sj <C-w>j
  nnoremap sk <C-w>k
  nnoremap sl <C-w>l
  nnoremap sh <C-w>h
  nnoremap sJ <C-w>J
  nnoremap sK <C-w>K
  nnoremap sL <C-w>L
  nnoremap sH <C-w>H
  nnoremap sr <C-w>r
  
  " Tab
  nnoremap sn gt
  nnoremap sp gT
  nnoremap st :<C-u>tabnew<CR>
 

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
"set shellslash


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


