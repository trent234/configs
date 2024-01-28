" trent wilson
" neovim config
" corequisites: start by installing vim-plug and plugins working
" vimux and nerdtree may get modded or removed at a later date

" plugins
call plug#begin('~/.vim/plugged')
" style
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" language server
"Plug 'neovim/nvim-lspconfig'

" for c dev
"Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make'}
"Plug 'ray-x/navigator.lua'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'github/copilot.vim'

" two below are for go programming. can any of it be replaced with coc func?
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'sebdah/vim-delve'
" Plug 'benmills/vimux'
call plug#end()

"""""""""""""""""""""""""" global vim settings """""""""""""""""""""""""""""""

" row numbers
set number

set cmdheight=1

" reminder not to go to far down the line. and set nice solar color.
set colorcolumn=80
highlight ColorColumn ctermbg=6

" underline on current line
set cursorline

" set vertical split (new) to open new window below existing
" motivation here was to have debug window pop up below like any ide
set splitbelow
" horiz default seems odd.. so while we're at it..
set splitright

let g:go_def_mapping_enabled = 0

" connect vi and sys clipboards
set clipboard=unnamedplus

" delete trailing whitespace on save except for specified filetypes
" not working yet...
" let blacklist = ['md', 'markdown']
" autocmd BufWritePre * if index(blacklist, &ft) < 0 | %s/\s\+$//e

"""""""""""""""""""" terminal-mode settings """"""""""""""""""""""""""""""""""
tnoremap <Del> <C-\><C-n>
" be sure to add many more configs here. save history to normal loc?
" and endless possibilities....

""""" language server 
" No need for require('lspconfig'), navigator will configure it for you

""""""""""""""""""" vim-go related settings """"""""""""""""""""""""""""""""""""

" write content on :make automatically and save the hassle of saving manually
"set autowrite

" avoid learning about location lists and the shortcuts for it (for now)
" stick with quicklists for everything in vim-go
"let g:go_list_type = "quickfix"

" auto do autocomplete dropdown
"au filetype go inoremap <buffer> . .<C-x><C-o>


" idk yet but its in the tut and my backspace has gone wonky and this fixed it
"set backspace=indent,eol,start

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
"let g:go_def_mapping_enabled = 0

""""""""""""""""""""" vim-delve """""""""""""""""""""""""""""""""""""""""""""
"used to create a new (horiz) window to run the terminal in.
"let g:delve_new_command = "new"

""""""""""""""""""""" vim-solarized-themes """""""""""""""""""""""""""""""""""""
" to get the solarized theme run :AirlineTheme solarized
let g:airline_theme='solarized'

let g:airline_powerline_fonts = 1

