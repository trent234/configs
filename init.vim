" trent wilson
" neovim config

"""""""""""""""""""""""""" global vim settings """""""""""""""""""""""""""""""

" syntax highlighting. this is auto on with vim-plug
"syntax on

" row numbers
set number

" reminder not to go to far down the line
set colorcolumn=80 
highlight ColorColumn ctermbg=6

" underline on current line
set cursorline

" set vertical split (new) to open new window below existing
" motivation here was to have debug window pop up below like any ide
set splitbelow
" horiz default seems odd.. so while we're at it..
set splitright

""""""""""""""""""" nerdtree"""""""""""""""""""""""""""""""""""""""""""""""""
"auto init on start
autocmd vimenter * NERDTree

" width set
let g:NERDTreeWinSize=24

"now switch focus back to the original file and not nerdtree
autocmd VimEnter * wincmd p

"autoclose when its the last buffer open (after a close of another buffer)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""" vim-go related settings """"""""""""""""""""""""""""""""""""

" enables use of missing vim-go commands. this is auto on with vim-plug
" filetype plugin indent on

" write content on :make automatically and save the hassle of saving manually
set autowrite

" avoid learning about location lists and the shortcuts for it (for now)
" stick with quicklists for everything in vim-go
let g:go_list_type = "quickfix"

" auto do autocomplete dropdown
au filetype go inoremap <buffer> . .<C-x><C-o>

" change dropdown menu gb color bc default gray was unreadable in remote desktop
highlight Pmenu ctermbg=green guibg=green

" idk yet but its in the tut and my backspace has gone wonky and this fixed it 
set backspace=indent,eol,start

" close documentation preview after omnicomplete selection
" autocmd CompleteDone * pclose

""""""""""""""""""""" vim-delve """""""""""""""""""""""""""""""""""""""""""""
"used to create a new (horiz) window to run the terminal in.
let g:delve_new_command = "new"

""""""""""""""""""""" vim-solarized-themes """""""""""""""""""""""""""""""""""""
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'

""""""""""""""""""""" vim-plug """""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sebdah/vim-delve'
Plug 'benmills/vimux'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

