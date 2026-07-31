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
# Copyright 2023 © Shashank Srivastav
#
# More info at:
# https://github.com/shashankgroovy/dotfiles
#


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Icons for Prompt
# ✗ ⏎ ➜ ❮ ❯ ⚡λ ↓ ↑ ↕ ● ✭ ✖ ✚ λ ± ∓ ≠ ∅ ⁕ ✻ ⚙ ☣ ★ ☡ ⚠ ‼ ♪ ♫ ♛ ➤ ♯ ♥ ♦ ♣ ♠ ⚀ ⚁ ⚂ ⚃ ⚄ ⚅

setopt auto_cd

# plugins
plugins=(archlinux zsh-autosuggestions)

# source zsh aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# looks
ZSH_THEME="robbyrussell"
autoload -U colors && colors
setopt correct
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "
export TERM='xterm-256color'

# aliases
alias ls="eza"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias tmuxconfig="vim ~/.tmux.conf"
alias tmuxcommands="head -n 24 ~/.tmux.conf"
alias dotfiles="cd ~/.dotfiles"
alias files='io.elementary.files'
alias refresh="source ~/.zshrc"
alias alconfig="vim ~/.config/alacritty/alacritty.toml"
alias :q="exit"
alias :qa="pkill alacritty"
alias gn="cowsay -d 'Later, hacker' && sleep 3 && sudo shutdown -h now"
alias cya="cowsay -b 'knight is coming' && sleep 3 && sudo pm-hibernate"
alias yawn="cowsay -t 'Cya in a while' && sleep 3 && sudo pm-suspend"
alias linux="cowsay -s 'We know you are on a linux machine'"

source $ZSH/oh-my-zsh.sh

#for fasd
eval "$(fasd --init auto)"
eval "$(fasd --init posix-alias zsh-hook)"
alias v='f -e vim'
alias m='f -e mplayer'
alias o='a -e xdg-open'
alias pu='pushd'
alias po='popd'

# python
alias vipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias ipy="ipython"
alias py="python"

# for git
alias ga="git add"
alias gb="git branch"
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
alias gs="git stash"
alias gsp="git stash pop"
alias gst="git status"
alias sos="fsck --cache --no-reflogs --lost-found --dangling HEAD"

alias vim='nvim'

# Configurations

# Activate the gnome keyring daemon
# if [ -n "$DESKTOP_SESSION" ];then
#     eval $(gnome-keyring-daemon --start)
#     export SSH_AUTH_SOCK
# fi

# GPG signing for git
export GPG_TTY=$(tty)

# direnv for environment variables
 eval "$(direnv hook zsh)"

# NVM configurations
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Pyenv
export PATH=$(pyenv root)/shims:$PATH
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# Make virtualenvwrapper to use pyenv for creating envs
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# pytest and other packages
export PATH=$PATH:$HOME/.local/bin

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
ulimit -n 8096

# Virtualenv
export WORKON_HOME=~/.envs
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python'
source /usr/bin/virtualenvwrapper.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/shanks/google-cloud-sdk/path.zsh.inc' ]; then . '/home/shanks/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/shanks/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/shanks/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/shanks/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/shanks/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/shanks/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/shanks/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# HISTFILE=$HOME/.zhistory
# HISTSIZE=10000
# SAVEHIST=10000
# setopt SHARE_HISTORY
# setopt HIST_IGNORE_ALL_DUPS
# setopt HIST_IGNORE_SPACE
# setopt HIST_VERIFY
# setopt HIST_REDUCE_BLANKS

# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
