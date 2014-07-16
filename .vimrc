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
call pathogen#runtime_append_all_bundles()
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
" let Tlist_Ctags_Cmd='~/.vim/plugin/taglist.vim'
" let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'

" =====Plugin:syntastic
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list=1
