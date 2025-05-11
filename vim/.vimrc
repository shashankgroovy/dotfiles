"
"      _                 _
"  ___| |__   __ _ _ __ | | _____
" / __| '_ \ / _` | '_ \| |/ / __|
" \__ \ | | | (_| | | | |   <\__ \
" |___/_| |_|\__,_|_| |_|_|\_\___//dotfiles
"
"
" Vim configuration, part of my dotfiles setup.
"
" Copyright 2024 © Shashank Srivastav
"
" More info at:
" https://github.com/shashankgroovy/dotfiles


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
    nnoremap <C-`>   :bnext<CR>
    nnoremap <C-S-`> :bprevious<CR>

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
    set relativenumber
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
    silent! colorscheme one
    " set guifont=Fira\ Code\ Regular:h11 "Monoid:h13 PragmataPro:h13

    if has('gui_running')
        set guioptions-=T
        set guioptions-=R
        set guioptions-=r
        set guioptions-=L
        set guioptions-=l
        set guioptions-=m
        set guifont=Iosevka\ 12
    else
        set t_Co=256
        set termguicolors
        set guifont=Iosevka:h12
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
    " nnoremap <M-a> <C-a>
    " nnoremap <M-x> <C-x>

    " Toggle spell check
    nmap <silent> <leader>s :set spell!<CR>

    " Clear the search buffer when hitting return
    nnoremap <CR> :nohlsearch<cr>

    " Format json
    " nnoremap gj :%!python -m json.tool <CR> :set ft=json <CR>
    nnoremap gj :%!jq .<CR> :set ft=json <CR>

    " " Move lines in visual mode
    vnoremap <C-j> :m '>+1<CR>gv=gv
    vnoremap <C-k> :m '<-2<CR>gv=gv

    " Use clipboard
    nnoremap <leader>y "+y
    nnoremap <leader>p "+p
    vnoremap <leader>y "+y
    vnoremap <leader>p "+p

    " Better Buffer control
    nnoremap <Leader>bn :bn <CR>
    nnoremap <Leader>bp :bp <CR>

    " Opens $MYVIMRC for editing vimrc in a jiffy
    nnoremap <Leader><Leader>v :e $MYVIMRC

    " Source $MYVIMRC reloads the saved $MYVIMRC
    nnoremap <Leader><Leader>s :source $MYVIMRC

    " Source ~/.gvimrc for macvim
    nnoremap <Leader><Leader>g :source ~/.gvimrc

    " Toggle Tagbar
    nmap <Leader>c :TagbarToggle<CR>

    " Toggle UndoTree
    nmap <Leader>u :UndotreeToggle<CR>

    " Toggle Zen Mode
    nnoremap <Leader><Leader>z :Goyo<CR>
    nnoremap <Leader><Leader>zl :Limelight!!<CR>

    " No highlight
    nnoremap <silent> ;h :nohl<cr>

    " Telescope bindings
    nnoremap <silent> ;f <cmd>Telescope find_files<cr>
    nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
    nnoremap <silent> \\ <cmd>Telescope buffers<cr>
    " nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

    " Terminal remap
    " Easily exit out of terminal mode
    tnoremap <Esc> <C-\><C-n>
    nnoremap <leader>tt :ToggleTerm<CR>

    " Lazygit
    nnoremap <leader>lg :LazyGit<CR>

    " Gp remap
    nnoremap <leader>gp :GpChatToggle<CR>

    " Lspsaga
    " nnoremap <silent>K :Lspsaga hover_doc<CR>

    " Terminal remap
    " Easily exit out of terminal mode
    tnoremap <Esc> <C-\><C-n>
    nnoremap <leader>tt :ToggleTerm<CR>

    " Gp remap
    nnoremap <leader>gp :GpChatToggle<CR>

    " Copilot -remap tab
    " imap <silent><script><expr> <C-\> copilot#Accept("\<CR>")
    " let g:copilot_no_tab_map = v:true

" Searching

    " ACK
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"

    " The Silver Searcher
    if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor
    endif


" Plugins

    " Use Vim-plug
    call plug#begin()

        Plug 'dense-analysis/ale'
        Plug 'folke/tokyonight.nvim'
        Plug 'github/copilot.vim'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-cmdline'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-vsnip'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'hrsh7th/vim-vsnip'
        Plug 'kdheepak/lazygit.nvim'
        Plug 'lewis6991/gitsigns.nvim'
        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-lua/popup.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'nvim-treesitter/nvim-treesitter'
        Plug 'onsails/lspkind.nvim'
        Plug 'ray-x/lsp_signature.nvim'
        Plug 'ryanoasis/vim-devicons'
        Plug 'williamboman/mason-lspconfig.nvim'
        Plug 'williamboman/mason.nvim'

        " Plug 'liuchengxu/vim-clap'
        Plug 'AndrewRadev/splitjoin.vim'
        Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
        Plug 'ayu-theme/ayu-vim'
        Plug 'chriskempson/base16-vim'
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'easymotion/vim-easymotion'
        Plug 'ervandew/supertab'
        Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
        Plug 'goolord/alpha-nvim'
        Plug 'honza/vim-snippets'
        Plug 'ianks/vim-tsx'
        Plug 'jiangmiao/auto-pairs'
        Plug 'joereynolds/gq.vim'
        Plug 'junegunn/goyo.vim'
        Plug 'junegunn/limelight.vim'
        Plug 'leafgarland/typescript-vim'
        Plug 'majutsushi/tagbar'
        Plug 'mattn/emmet-vim'
        Plug 'maxmellon/vim-jsx-pretty'
        Plug 'mbbill/undotree'
        Plug 'mileszs/ack.vim'
        Plug 'ntk148v/vim-horizon'
        Plug 'pangloss/vim-javascript'
        Plug 'robitx/gp.nvim'
        Plug 'rust-lang/rust.vim'
        Plug 'scrooloose/nerdtree'
        Plug 'sebdah/vim-delve'
        Plug 'sheerun/vim-polyglot'
        Plug 'terryma/vim-multiple-cursors'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-rhubarb'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-unimpaired'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'vim-scripts/BufOnly.vim'
        Plug 'wakatime/vim-wakatime'

    call plug#end()


" Plugin invokes

    " Airline
    let g:airline_theme='onedark'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_symbols = {}
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.linenr = '␊'
    let g:airline_left_alt_sep = '/'    " 
    let g:airline_left_sep = '' "
    let g:airline_right_alt_sep = '\'   " 
    let g:airline_right_sep = '' "
    let g:airline#extensions#tabline#left_alt_sep = ''     " 
    let g:airline#extensions#tabline#left_sep = ''         " 
    let g:airline#extensions#tabline#right_alt_sep = ''    " 
    let g:airline#extensions#tabline#right_sep = ''        " 
    let g:airline_skip_empty_sections = 1

    " Show ALE on Airline
    let g:airline#extensions#ale#enabled = 1

    " CtrlP
    "let g:ctrlp_cmd = 'CtrlPBuffer'
    let g:clear_cache_on_exit = 0
    let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|git'
    let g:ctrlp_working_path_mode = 'ra'
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

    " Goyo and Limelight
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!

    " Emmet-vim bindings
    let g:use_emmet_complete_tag = 1
    let g:user_emmet_expandabbr_key = "<leader>em"
    let g:user_emmet_leader_key = "<leader>e"
    let g:user_emmet_mode = "a"

    " NERD Tree
    map <leader>n :NERDTreeToggle <cr>
    map <leader><leader>n :NERDTreeFind <cr>
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

    nnoremap <silent> <leader><tab> :call ScratchToggle()<cr>

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

    " Allow saving of files as sudo when I forgot to start vim using sudo.
    cmap w!! w !sudo tee > /dev/null %


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

    " Indentation settings
    autocmd Bufread *.py setlocal tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4 autoindent
    autocmd Bufread *.js setlocal tabstop=2 shiftwidth=2 smarttab expandtab softtabstop=2 autoindent

    " Golang's vim-go settings
    let g:go_bin_path = $HOME."/go/bin"
    let g:go_fmt_command = "goimports"
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_function_calls = 1
    let g:go_auto_type_info = 1

    " Rust formatting settings
    let g:rustfmt_autosave = 1

    " .envrc
    au BufNewFile,BufRead,BufReadPost,BufWritePost .envrc set syntax=bash
    "
    " Sql formatting
    function! SqlFormatter()
        set noai
        silent execute "%!sqlformat --reindent --keywords upper --identifiers lower -"
        set syntax=sql
    endfunction
    noremap <leader>gs :call SqlFormatter()<CR>
