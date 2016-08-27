# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
setopt auto_cd
# to have fish like quick suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# looks
ZSH_THEME="avit"
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
alias cya="cowsay -b 'knight is coming' && sleep 3 && sudo pm-hibernate"
alias yawn="cowsay -t 'Cya in a while' && sleep 3 && sudo pm-suspend"
alias linux="cowsay -s 'We know you are on a linux machine'"

source $ZSH/oh-my-zsh.sh

# PATH
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/Code/julia:/Code/get_shit_done:

#for fasd
eval "$(fasd --init auto)"
eval "$(fasd --init posix-alias zsh-hook)"
alias v='f -e vim'
alias m='f -e mplayer'
alias o='a -e xdg-open'

# python
alias ipy="ipython"
alias py="python"
# python - django
alias django="python manage.py"
# Rust
alias rust="rustc"
# nodejs
alias node="nodejs"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code
source /usr/local/bin/virtualenvwrapper.sh

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

# nginx
alias nginx="sudo /etc/init.d/nginx"

# apache
alias apache="sudo /usr/local/apache2/bin/apachectl"

## Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# java settings
# test -r ~/Code/java_code/bin/config.sh && source ~/Code/java_code/bin/config.sh
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-i386/bin/"

# redis settings
export PATH=$PATH:/opt/redis

# go settings
export PATH=$PATH:/opt/go/bin
export GOPATH=/opt/gocode/
export GOROOT=/opt/go/

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Add android development tools to path
# Android Studio
PATH=$PATH:$HOME/bin/android-studio/bin/studio.sh
# Eclipe IDE
PATH=$PATH:$HOME/build/adt-bundle-linux-x86-20140321/eclipse
# the android sdk
PATH=$PATH:$HOME/build/adt-bundle-linux-x86-20140321/eclipse/sdk/tools
PATH=$PATH:$HOME/build/adt-bundle-linux-x86-20140321/eclipse/sdk/platform-tools

# Add php/laravel to path
export PATH="$HOME/.composer/vendor/bin:$PATH"

export NVM_DIR="/home/shashank/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# node development
export NODE_ENV=development

# ruby
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# plugins
plugins=(zsh-wakatime)
