# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
setopt auto_cd

# looks
ZSH_THEME="robbyrussell"
autoload -U colors && colors
setopt correct
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "
export TERM='xterm-256color'

# aliases
alias zshconfig="gvim ~/.zshrc"
alias ohmyzsh="gvim ~/.oh-my-zsh"
alias tmuxconfig="gvim ~/.tmux.conf"
alias dotfiles="cd ~/.dotfiles"
alias n='nautilus'
alias refresh="source ~/.zshrc"
alias :q="exit"
alias gn="cowsay -d 'Later, hacker' && sleep 3 && sudo shutdown -h now"
alias cya="cowsay -t 'Cya in a while' && sleep 3 && sudo pm-suspend"
alias yawn="cowsay -b'knight is coming' && sleep 3 && sudo pm-hibernate"

source $ZSH/oh-my-zsh.sh

# PATH
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/Code/julia:/Code/get_shit_done:

#for fasd
eval "$(fasd --init auto)"
eval "$(fasd --init posix-alias zsh-hook)"
alias v='f -e vim'
alias m='f -e mplayer'
alias o='a -e xdg-open'

# for sublime
alias subl="sublime"
alias nano="sublime"

# python
alias ipy="ipython"
alias py="python"
# python - django
alias django="python manage.py"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code
source /usr/local/bin/virtualenvwrapper.sh

# for git
alias gitcls="git rm -r --cached ."
#alias gpu="git push -u origin master"
alias gi="git init"
alias ga="git add"
alias gc="git commit"
alias gr="git reset"
alias gm="git merge"
alias gpu="git push"
alias gpl="git pull"
alias gst="git status"
alias gch="git checkout"
alias gb="git branch"
alias gcl="git clone"

# nginx settings
alias nginx-start="sudo /etc/init.d/nginx start"
alias nginx-stop="sudo /etc/init.d/nginx stop"
alias nginx-reload="sudo /etc/init.d/nginx reload"
alias nginx-restart="sudo /etc/init.d/nginx restart"
alias nginx-status="/etc/init.d/nginx status"

## Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# java settings
test -r ~/Code/java_code/bin/config.sh && source ~/Code/java_code/bin/config.sh

# redis settings
export PATH=$PATH:/opt/redis

# go settings
export PATH=$PATH:/opt/go/bin
export GOPATH=/opt/gocode/
export GOROOT=/opt/go/

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting