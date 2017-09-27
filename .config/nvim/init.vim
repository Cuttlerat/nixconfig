set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
colorscheme srcery-drk
autocmd BufNewFile,BufRead *.Dockerfile   set syntax=Dockerfile
" {{{ Sets
set rtp+=~/.config/nvim/Vundle.vim
set number
set smartindent
set autoindent
set softtabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set foldmethod=marker
set t_ut=
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" {{{ Langmap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" }}}
" }}}

" {{{ Vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

function! SuperCleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-p>"
	endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

" Whitespaces highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" {{{ Plugins
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Cuttlerat/bash-support.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
" }}}

let airline_theme = 'base16_chalk'
map <C-n> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:neocomplcache_enable_at_startup = 1

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" vim: set fdm=marker:
