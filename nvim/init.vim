" trent wilson
" neovim config
" corequisites: start by installing vim-plug and plugins working
" vimux and nerdtree may get modded or removed at a later date

" plugins
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'sebdah/vim-delve'
Plug 'benmills/vimux'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

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

" delete trailing whitespace on save except for specified filetypes
" not working yet...
" let blacklist = ['md', 'markdown']
" autocmd BufWritePre * if index(blacklist, &ft) < 0 | %s/\s\+$//e

" change dropdown menu gb color bc default gray was unreadable in remote desktop
" deprecated... delete?
" highlight Pmenu ctermbg=green guibg=green

""""""""""""""""""" nerdtree"""""""""""""""""""""""""""""""""""""""""""""""""
"auto init on start
"autocmd vimenter * NERDTree

" width set
let g:NERDTreeWinSize=20

"now switch focus back to the original file and not nerdtree
"autocmd VimEnter * wincmd p

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


" idk yet but its in the tut and my backspace has gone wonky and this fixed it
"set backspace=indent,eol,start

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
"let g:go_def_mapping_enabled = 0

""""""""""""""""""""" vim-delve """""""""""""""""""""""""""""""""""""""""""""
"used to create a new (horiz) window to run the terminal in.
let g:delve_new_command = "new"

""""""""""""""""""""" vim-solarized-themes """""""""""""""""""""""""""""""""""""
" let g:airline_solarized_bg='dark'
" let g:airline_theme='solarized'

"""""""""""""""""" coc.nvim settings """""""""""""""""""""""""""""""""
" just about all copied from github page no doubt

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
" tsw 20210427 gh for hover and show docs. above doesn't work for pyright?
nnoremap gh :call CocActionAsync('doHover')<CR>

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

" ******************* markdown preview copied from *************************
" https://github.com/iamcco/markdown-preview.nvim
" Usage-
" :MarkdownPreview
" :MarkdownPreviewStop

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']



