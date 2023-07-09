"
"       _                 _           __  _       _    __ _ _
"   ___| |__   __ _ _ __ | | _____   / /_| | ___ | |_ / _(_) | ___  ___
"  / __| '_ \ / _` | '_ \| |/ / __| / / _` |/ _ \| __| |_| | |/ _ \/ __|
"  \__ \ | | | (_| | | | |   <\__ \/ / (_| | (_) | |_|  _| | |  __/\__ \
"  |___/_| |_|\__,_|_| |_|_|\_\___/_/ \__,_|\___/ \__|_| |_|_|\___||___/
"
"
"  The zsh configuration, part of my dotfiles setup.
"
"  Copyright 2023 © Shashank Srivastav
"
"  More info at:
"  https://github.com/shashankgroovy/dotfiles
"


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
