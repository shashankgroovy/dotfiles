#
#      _                 _           __  _       _    __ _ _
#  ___| |__   __ _ _ __ | | _____   / /_| | ___ | |_ / _(_) | ___  ___
# / __| '_ \ / _` | '_ \| |/ / __| / / _` |/ _ \| __| |_| | |/ _ \/ __|
# \__ \ | | | (_| | | | |   <\__ \/ / (_| | (_) | |_|  _| | |  __/\__ \
# |___/_| |_|\__,_|_| |_|_|\_\___/_/ \__,_|\___/ \__|_| |_|_|\___||___/
#
#
# The zsh configuration, part of my dotfiles setup.
#
# Copyright 2026 © Shashank Srivastav
#
# More info at:
# https://github.com/shashankgroovy/dotfiles
#


# ---- Shell options ---------------------------------------------------------
setopt auto_cd
setopt correct
autoload -U colors && colors
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

# Don't override TERM if the terminal already set one (alacritty/kitty/wezterm).
[[ -z "$TERM" || "$TERM" == "dumb" ]] && export TERM='xterm-256color'

ulimit -n 8192


# ---- History ---------------------------------------------------------------
HISTFILE=$HOME/.zhistory
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY


# ---- Completion system -----------------------------------------------------
# Must run before antidote loads fzf-tab / fast-syntax-highlighting.
# Skip the security audit on hot starts; rebuild the dump once a day.
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi


# ---- fzf shell integration -------------------------------------------------
# Loaded BEFORE antidote so fzf-tab can override fzf's Tab binding.
# Provides Ctrl-T (files), Alt-C (cd); Ctrl-R is reclaimed by atuin below.
source <(fzf --zsh)


# ---- Plugin manager: antidote ---------------------------------------------
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load


# ---- Prompt: starship ------------------------------------------------------
eval "$(starship init zsh)"


# ---- Version manager: mise --------------------------------------------------
# Per-project tool versions via .tool-versions / .mise.toml / .nvmrc / .python-version
eval "$(mise activate zsh)"


# ---- Shell extensions ------------------------------------------------------
eval "$(direnv hook zsh)"     # per-directory env vars
eval "$(zoxide init zsh)"     # smarter cd ('z' / 'zi')
__zoxide_cd() {
    builtin pushd "$@" > /dev/null
}
DIRSTACKSIZE=20               # cap the stack the pushd-based cd grows

# atuin owns Ctrl-R; Up/Down stay with history-substring-search for in-line cycling.
eval "$(atuin init zsh --disable-up-arrow)"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ---- PATH & environment ----------------------------------------------------
export PATH=$PATH:$HOME/.local/bin
export GPG_TTY=$TTY          # zsh builtin; avoids forking tty(1) on every shell start
export LESS="-XFR"           # set less options to enable font wrapping

# Go (mise also manages go; this just makes $GOPATH/bin available)
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# ---- Aliases ---------------------------------------------------------------
# Source any extra aliases the user keeps locally
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# Editor / config shortcuts
alias zshconfig="nvim ~/.zshrc"
alias tmuxconfig="nvim ~/.tmux.conf"
alias tmuxcommands="head -n 24 ~/.tmux.conf"
alias dotfiles="cd ~/.dotfiles"
alias alconfig="nvim ~/.config/alacritty/alacritty.toml"
alias refresh="exec zsh"
alias :q="exit"
alias vim='nvim'
alias lg="lazygit"
alias po="popd"

# Modern Unix replacements
# alias ls='eza --icons --git'
alias ls='eza --git'
alias ll='eza -la --icons --git --group-directories-first'
alias la='eza -a --icons'
alias lt='eza --tree --level=2 --icons'
alias cat='bat --paging=never --style=plain'  # bare cat-like behavior with syntax
alias catp='bat'                              # full bat with line numbers + paging

# Python
alias ipy="ipython"
alias py="python"

# Git
alias ga="git add"
alias gb="git branch"
alias gbd="git branch -D"
alias gc="git commit"
alias gch="git checkout"
alias gcl="git clone"
alias gd="git diff"
alias gds="git diff --staged"
alias gi="git init"
alias gitcls="git rm -r --cached"
alias gm="git merge"
alias gpl="git pull"
alias gpu="git push"
alias gr="git reset"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias gs="git stash"
alias gsp="git stash pop"
alias gst="git status"
alias gfp="git fetch --prune"
alias sos="git fsck --cache --no-reflogs --lost-found --dangling HEAD"

# macOS / fun
alias gn="cowsay -d 'Later, hacker' && sleep 3 && sudo shutdown -h now"
alias linux="cowsay -s 'We know you are on a linux machine'"
