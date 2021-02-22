" trent wilson
" neovim config
" corequisites:
" 	-vim-plug to get plugins working
" 	-go for go related plugings to work
" 	-to do: copy/paste into clipboard and set up language server

"""""""""""""""""""""""""" global vim settings """""""""""""""""""""""""""""""

" syntax highlighting. this is auto on with vim-plug
"syntax on

" row numbers
set number

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
""""""""""""""""""" nerdtree"""""""""""""""""""""""""""""""""""""""""""""""""
"auto init on start
autocmd vimenter * NERDTree

" width set
let g:NERDTreeWinSize=20

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
"let g:go_list_type = "quickfix"

" auto do autocomplete dropdown
"au filetype go inoremap <buffer> . .<C-x><C-o>

" change dropdown menu gb color bc default gray was unreadable in remote desktop
highlight Pmenu ctermbg=green guibg=green

" idk yet but its in the tut and my backspace has gone wonky and this fixed it 
"set backspace=indent,eol,start

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
"let g:go_def_mapping_enabled = 0

""""""""""""""""""""" vim-delve """""""""""""""""""""""""""""""""""""""""""""
"used to create a new (horiz) window to run the terminal in.
let g:delve_new_command = "new"

""""""""""""""""""""" vim-solarized-themes """""""""""""""""""""""""""""""""""""
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'

"""""""""""""""""" coc.nvim default settings """""""""""""""""""""""""""""""""

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'sebdah/vim-delve'
Plug 'benmills/vimux'                                       
Plug 'preservim/nerdtree'                                           
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'                    
Plug 'vim-airline/vim-airline-themes'
call plug#end()

