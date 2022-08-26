" reset this env to the standard nvim config
let $XDG_CONFIG_HOME = '~/.config'

" start in terminal mode
term

" start in insert mode
startinsert

" hide the status bar
set laststatus=0

" remap term to normal mode switch to del key
tnoremap <Del> <C-\><C-n>

" close when term process exits
autocmd TermClose * if !v:event.status | quit | endif

