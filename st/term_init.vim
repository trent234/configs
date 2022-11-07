" nvim config for use by st on terminal launch

" start in terminal mode
term

" start in insert mode
startinsert

" hide the status bar & command bar (nothing left here)
set laststatus=0
set cmdheight=0

" number on normal mode. this also signifies whether in term or normal mode  
au TermEnter * set nonumber
au TermLeave * set number

" remap term to normal mode switch to del key
tnoremap <Del> <C-\><C-n>

" connect vi and sys clipboards
set clipboard=unnamedplus

" close when term process exits
autocmd TermClose * if !v:event.status | quit | endif

