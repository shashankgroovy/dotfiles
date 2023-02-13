source ~/.vimrc

" colorscheme archery
colorscheme ayu
" colorscheme PaperColor
" colorscheme base16-horizon-dark

set guifont=Iosevka:h17
set linespace=3

" Make neovim transparent
highlight Normal guibg=none
highlight NonText guibg=none

" Load the lua configurations
lua require('tuner')
nmap <CR> :nohlsearch<cr>
