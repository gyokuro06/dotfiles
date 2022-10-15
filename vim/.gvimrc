"----------------------------
".gvimrc
"----------------------------

" Save Directory
set browsedir=buffer

" Setting Display
 " Display
 set lines=25           " typical
 set columns=90         " margin for 'number' and 'foldcolumn'
 set cmdheight=1        " MacVim $VIM/gvimrc overwrites my .vimrc settings
 set guioptions=c       " show no GUI components
 set transparency=10
 " Toolbar
 set guioptions+=T
 " Window
 defaults write org.vim.MacVim MMZoomBoth -boolean YES

 " Keymapping
  " Change Window Size
  nnoremap sO <C-w>=
  nnoremap so <C-w>_<C-w>|
  " SKK
  inoremap <silent> <C-j> <C-^>

" Setting Font
  if has('win32')
    " When VL Gothic isn't found in the system, use MS Gothic.
    set guifont=VL_Gothic:h12:cSHIFTJIS,MS_Gothic:h12:cSHIFTJIS
    set linespace=0
  elseif has('mac')
    set guifont=VL_Gothic:h16
    set linespace=0
  endif

" Setting IM Bug
if exists('&imdisableactivate')
  set noimdisableactivate
endif
