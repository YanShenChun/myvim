" An example for a vimrc file.
"
" Maintainer:	Shoutao Xie <shanghaitan1987@126.com>
" Last change:	2014 Jul 12
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Plugin manger pathogen settings
execute pathogen#infect()
call pathogen#helptags()

" -----------COMMON settings
syntax on
filetype plugin indent on

" Set encodings
set encoding=utf-8

" Show line number
set number

" Set default windows size when first opening
set lines=70 columns=100

" Set windows tranparency
" used by MacVim but not vim here.
if has("gui_macvim")
	set transparency=10
	set guifont=Courier_New:h14
endif

" set background color
set bg=dark

" set the color scheme
colorscheme lucius

set tabstop=4

" =====Plugin:Ctags settings=====
" let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'

" =====Plugin:syntastic
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list=1

" =====Plugin:ctrlp settings=====
" Change the default mapping and the default command to invoke Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" When invoked, unless a starting directory is specified, CtrlP will set its
" local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'

" Exclude files or directories using Vim's wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\,*.swp,*.zip,*.exe   " Windows

" Simulate NERD_TREE start
" Use the below scripts to implement the same feature like NERD_TREE
" since NERD_TREE doesn't work at all with Pathogen.
" Refer to: 
" 	http://modal.us/blog/2013/07/27/back-to-vim-with-nerdtree-nope-netrw/
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" Change directory to the current buffer when opening files.
set autochdir
" Simulate NERD_TREE end
