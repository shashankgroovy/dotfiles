# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#    xterm-color) color_prompt=yes;;
# esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# use ➜ in place of $ to change prompt end
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Fasd settings
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# fasd aliases
alias v="f -e vim"  # quick opening files with vim
alias m="f -e vlc"  # quick opening files with vlc-media player
alias o="f -e xdg-open"  # quick opening files with xdg-open

# More aliases
alias py="python"
alias ipy="ipython"

alias :q="exit"
alias n="nautilus"
alias subl="sublime"
alias refresh="source ~/.bashrc"
alias bashconfig="gvim ~/.bashrc"
alias weechat="weechat-curses"
alias gn="cowsay -d 'Later, hacker' && sleep 3 && sudo shutdown -h now"
alias cya="cowsay -t 'Cya in a while' && sleep 3 && sudo pm-suspend"
alias yawn="cowsay -b 'knight is coming' && sleep 3 && sudo pm-hibernate"

# for git
alias gitcls="git rm -r --cached ."
#alias gpu="git push -u origin master"
alias gpu="git push"
alias gpl="git pull"
alias gi="git init"
alias ga="git add"
alias gc="git commit -am"
alias gr="git reset"
alias gst="git status"
alias gch="git checkout"
alias gb="git branch"


# nginx settings
alias nginx-start="sudo /etc/init.d/nginx start"
alias nginx-stop="sudo /etc/init.d/nginx stop"
alias nginx-reload="sudo /etc/init.d/nginx reload"
alias nginx-restart="sudo /etc/init.d/nginx restart"
alias nginx-status="/etc/init.d/nginx status"

## virtualenv settings
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code
source /usr/local/bin/virtualenvwrapper.sh

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# aws EC2 CLI toolkit
export EC2_HOME="/opt/ec2-api-tools/"

# java settings
test -r ~/Code/java_code/bin/config.sh && source ~/Code/java_code/bin/config.sh
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-i386/jre/"

# go settings
export PATH=$PATH:/opt/go/bin
export GOPATH=/opt/gocode/
export GOROOT=/opt/go/

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
