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
# Copyright 2020 © Shashank Srivastav
#
# More info at:
# https://github.com/shashankgroovy/dotfiles
#


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Icons for Prompt
# ✗ ⏎ ➜ ❮ ❯ ⚡λ ↓ ↑ ↕ ● ✭ ✖ ✚ λ ± ∓ ≠ ∅ ⁕ ✻ ⚙ ☣ ★ ☡ ⚠ ‼ ♪ ♫ ♛ ➤ ♯ ♥ ♦ ♣ ♠ ⚀ ⚁ ⚂ ⚃ ⚄ ⚅

setopt auto_cd
# to have fish like quick suggestions
# plugins=(zsh-autosuggestions)

# source zsh aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# looks
ZSH_THEME="avit"
autoload -U colors && colors
setopt correct
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "
export TERM='xterm-256color'

# aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias tmuxconfig="vim ~/.tmux.conf"
alias tmuxcommands="head -n 24 ~/.tmux.conf"
alias dotfiles="cd ~/.dotfiles"
alias files='io.elementary.files'
alias refresh="source ~/.zshrc"
alias :q="exit"
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

# python
alias ipy="ipython3"
alias py="python2"
alias py3="python3"

# for git
alias gitcls="git rm -r --cached"
alias gi="git init"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gr="git reset"
alias gm="git merge"
alias gpu="git push"
alias gpl="git pull"
alias gst="git status"
alias gch="git checkout"
alias gb="git branch"
alias gcl="git clone"
alias gs="git stash"
alias gsp="git stash pop"
alias sos="fsck --cache --no-reflogs --lost-found --dangling HEAD"

# Virtualenv
export WORKON_HOME=~/.envs
VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3'
# source /usr/local/bin/virtualenvwrapper.sh

# direnv for environment variables
 eval "$(direnv hook zsh)"

# plugins
plugins=(zsh-wakatime archlinux)
# alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vim='nvim'

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
ulimit -n 8096

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/.google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/.google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/.google-cloud-sdk/completion.zsh.inc'; fi
