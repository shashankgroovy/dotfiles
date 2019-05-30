"
"      _                 _
"  ___| |__   __ _ _ __ | | _____
" / __| '_ \ / _` | '_ \| |/ / __|
" \__ \ | | | (_| | | | |   <\__ \
" |___/_| |_|\__,_|_| |_|_|\_\___//dotfiles
"
"
" The vim configuration, part of my dotfiles setup.
"
" Copyright 2018 © Shashank Srivastav
"
" More info at:
" https://github.com/shashankgroovy/dotfiles
"


" General

    set nocompatible                "make it the first line

    set autoread
    set encoding=utf-8
    set laststatus=2
    set modelines=0
    set mouse=a

    filetype on
    filetype plugin indent on
    filetype plugin on

    syntax enable

    source $VIMRUNTIME/mswin.vim    "allows standard windows copy/paste keystrokes
    behave mswin                    "mouse behavior like windows

    " Pressing Tab on the command line will show a menu to complete buffer and
    "file names
    set wildchar=<Tab> wildmenu wildmode=full


" Navigation

    " Better Tab control
    nnoremap tn :tabnew<CR>
    nnoremap td :tabclose<CR>
    nnoremap tj :tabnext<CR>
    nnoremap tk :tabprev<CR>
    nnoremap <C-tab>   :tabnext<CR>
    nnoremap <C-S-tab> :tabprevious<CR>

    " Easy movement between split windows
    nnoremap <c-h> <c-w>h
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-l> <c-w>l


" Editor

    " Folding
    "set nofoldenable
    set foldlevel=1
    set foldmethod=indent
    set foldnestmax=10

    " Editing
    set cursorline                  " highlight the line with the cursor
    set number
    set ruler                       " show the co-ordinates of the cursor
    set scrolloff=3                 " provide some context for editing

    " Formatting
    "set textwidth=79                " lines longer than 79 columns will be broken
    set autoindent                  " align the new line indent with the previous line
    set backspace=indent,eol,start  " backspace through everything in insert mode
    set expandtab                   " use spaces, not tabs (optional)
    set nowrap                      " don't wrap lines
    set shiftround                  " round indent to multiple of 'shiftwidth'
    set softtabstop=4               " insert/delete four spaces when hitting TAB/Backspace
    set tabstop=4 shiftwidth=4      " a tab is four spaces (or set this to 2)

    " Searching
    set gdefault                    " g flag is set on default
    set hlsearch                    " highlight matches
    set ignorecase                  " searches are case insensitive...
    set incsearch                   " incremental searching
    set smartcase                   " except when you tell vim


" Vim UI

    " Switch off the bell
    set visualbell t_vb=
    set novisualbell

    " Look
    set background=dark
    set guifont=Fira\ Code:h10

    if has('gui_running')
        set guioptions-=T
        set guioptions-=R
        set guioptions-=r
        set guioptions-=L
        set guioptions-=l
        set guioptions-=m
        colorscheme afterglow
    else
        set t_Co=256
        colorscheme afterglow
    endif
    let g:space_vim_dark_background = 233


    " Customizing the insert menu
    " http://goo.gl/UqCSV

    set completeopt=longest,menuone
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
    inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" Key (re)mapping

    " Mapping leader
    let mapleader = ','

    " Better mapping for Esc
    imap jk <ESC>

    " Better use of H and L
    nnoremap H ^
    nnoremap L $

    " Yank from the cursor to the end of the line
    nnoremap Y y$

    " Change to Directory of Current file
    command! CDC lcd %:p:h

    " Better use of space in normal mode
    nnoremap <space> za

    " Increment/Decrement integer
    nnoremap <M-a> <C-a>
    nnoremap <M-x> <C-x>

    " Toggle spell check
    nmap <silent> <leader>s :set spell!<CR>

    " Clear the search buffer when hitting return
    nnoremap <CR> :nohlsearch<cr>

    " Format json
    nnoremap gr :%!python -m json.tool <CR> :set ft=json <CR>

    " Opens $MYVIMRC for editing vimrc in a jiffy
    nnoremap <Leader><Leader>v :e $MYVIMRC

    " Source $MYVIMRC reloads the saved $MYVIMRC
    nnoremap <Leader><Leader>s :source $MYVIMRC

    " Source ~/.gvimrc for macvim
    nnoremap <Leader><Leader>g :source ~/.gvimrc

    " Toggle Tagbar
    nmap <Leader><Leader>c :TagbarToggle<CR>

" Searching

    " ACK
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"

    " The Silver Searcher
    if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor
    endif


" Plugins

    " Use Pathogen
    execute pathogen#infect()

    " Use Vim-plug
    call plug#begin()

        Plug 'chriskempson/base16-vim'
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'easymotion/vim-easymotion'
        Plug 'ervandew/supertab'
        Plug 'fatih/vim-go'
        Plug 'honza/vim-snippets'
        Plug 'jiangmiao/auto-pairs'
        "Plug 'klen/python-mode'
        Plug 'majutsushi/tagbar'
        Plug 'mattn/emmet-vim'
        Plug 'mbbill/undotree'
        Plug 'mileszs/ack.vim'
        Plug 'posva/vim-vue'
        Plug 'scrooloose/nerdtree'
        Plug 'scrooloose/syntastic'
        Plug 'sheerun/vim-polyglot'
        Plug 'terryma/vim-multiple-cursors'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-unimpaired'
        Plug 'valloric/youcompleteme'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'vim-syntastic/syntastic'
        Plug 'wakatime/vim-wakatime'

    call plug#end()


" Plugin invokes

    " Airline
    let g:airline_theme='tomorrow'
    let g:airline#extensions#tabline#enabled = 1
    if has('gui_running')
        let g:airline_symbols = {}
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.branch = ''
        let g:airline_left_alt_sep = ''
        let g:airline_left_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline#extensions#tabline#left_alt_sep = ''     " 
        let g:airline#extensions#tabline#left_sep = ''         " 
        let g:airline#extensions#tabline#right_alt_sep = ''    " 
        let g:airline#extensions#tabline#right_sep = ''        " 
        let g:airline_skip_empty_sections = 1
    endif

    " CtrlP
    "let g:ctrlp_cmd = 'CtrlPBuffer'
    let g:clear_cache_on_exit = 0
    let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|git'
    let g:ctrlp_working_path_mode = 'ra'
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

    " Emmet-vim bindings
    let g:use_emmet_complete_tag = 1
    let g:user_emmet_expandabbr_key = "<leader>em"
    let g:user_emmet_leader_key = "<leader>e"
    let g:user_emmet_mode = "a"

    " NERD Tree
    map <leader>n :NERDTreeToggle <cr>
    let NERDChristmasTree = 1
    let NERDTreeShowBookmarks  = 1
    let NERDTreeWinPos = "left"

    " Autoload vim to the directory of current file
    "au VimEnter * NERDTreeFind

    " Supertab
    let g:SuperTabMappingForward = '<S-space>'
    let g:SuperTabMappingBackward = '<c-S-space>'

    " Vim slime settings
    "let g:slime_target = "tmux"

    " UltiSnips
    if has('gui_running')
      " Load it only in macvim, fucks up in terminal
      " let g:UltiSnipsExpandTrigger = "<M-space>"
      " let g:UltiSnipsJumpForwardTrigger = "<c-b>"
      " let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

      "let g:UltiSnipsExpandTrigger="<leader>p"
      "let g:UltiSnipsJumpForwardTrigger="<Down>"
      "let g:UltiSnipsJumpBackwardTrigger="<UP>"
    endif

    " YouCompleteMe
    let g:ycm_python_binary_path = '/usr/local/bin/python3'

    " Zencoding bindings
    let g:use_zen_complete_tag = 1
    let g:user_zen_expandabbr_key = '<leader>o'


" Quick functions

    " Scratch pad
    function! ScratchToggle()
        if exists("w:is_scratch_window")
            unlet w:is_scratch_window
            exec "q"
        else
            exec "normal! :Scratch\<cr>\<C-W>J:resize 13\<cr>"
            let w:is_scratch_window = 1
        endif
    endfunction

    command! ScratchToggle call ScratchToggle()
    nnoremap <silent> <leader><tab> :ScratchToggle<cr>

     " Toggle to trigger background
    function! ToggleBG()
        let s:tbg = &background
        " Inversion
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction

    noremap <leader>bg :call ToggleBG()<CR>

    " Show syntax highlighting groups for word under cursor
    function! <SID>SynStack()
        if !exists("*synstack")
            return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc

    nmap <C-S-T> :call <SID>SynStack()<CR>


" Programming Languages

    " Markdown to HTML
    nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>

    " jshint validation
    nnoremap <leader><F1> :JSHint<CR>
    inoremap <leader><F1> <C-O>:JSHint<CR>
    vnoremap <leader><F1> :JSHint<CR>

    " show next jshint error
    nnoremap <leader><F2> :lnext<CR>
    inoremap <leader><F2> <C-O>:lnext<CR>
    vnoremap <leader><F2> :lnext<CR>

    " show previous jshint error
    nnoremap <leader><F3> :lprevious<CR>
    inoremap <leader><F3> <C-O>:lprevious<CR>
    vnoremap <leader><F3> :lprevious<CR>

    " Python syntax highlighting
    let python_highlight_all=1

    " Use python3 for syntastic using flake8
    let g:syntastic_python_python_exec = '/usr/local/bin/python3'
    let g:syntastic_python_flake8_exec = 'python3'
    let g:syntastic_python_flake8_args = ['-m', 'flake8']

    " Indentation settings
    autocmd Bufread *.py setlocal tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4 autoindent
    autocmd Bufread *.js setlocal tabstop=2 shiftwidth=2 smarttab expandtab softtabstop=2 autoindent

    " Golang's vim-go settings
    let g:go_fmt_command = "goimports"
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_function_calls = 1
    let g:go_auto_type_info = 1
