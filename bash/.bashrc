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

# color definitions:
# use the following colors in the prompt like this :
# echo -e "${red}yippiee {blue}ki {green}yay"

# No_color    '\e[0m'        
# Black       '\e[0;30m'       ##     Red         '\e[0;31m'      
# Yellow      '\e[0;32m'       ##     Green       '\e[0;33m'   
# Blue        '\e[0;34m'       ##     Cyan        '\e[0;35m'   
# Purple      '\e[0;36m'       ##     White       '\e[0;37m' 

# mercuial prompt information
hg_ps1() {
    hg prompt "{{branch}}{ at {bookmark}} {status}" 2> /dev/null
}

hg_dirty() {
    hg status --no-color 2> /dev/null \
    | awk '$1 == "?" { unknown = 1 } 
           $1 != "?" { changed = 1 }
           END {
             if (changed) printf "!"
             else if (unknown) printf "?" 
           }'
}

hg_branch() {
    hg branch 2> /dev/null | \
        awk '{ printf "\033[1;33m hg➜ \033[01;37m" $1 }'
    hg bookmarks 2> /dev/null | \
        awk '/\*/ { printf "\033[37;0m at \033[33;40m" $2 }'
}


# use ➜ in place of $ to change prompt end
if [ "$color_prompt" = yes ]; then
    # use the following with hg-prompt
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\[\033[01;35m\]\h \[\e[1;36m\]\w\[\e[01;37m\] $(hg_ps1) \[\e[0;91m\]$(hg_dirty) \[\e[0m\]'

    # without hg-prompt
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\[\033[01;35m\]\h \[\e[1;36m\]\w\[\e[01;37m\] $(hg_branch) \[\e[0;91m\]$(hg_dirty) \[\e[0m\]'
    # here \033 == \e which is an ASCII escape character

else
    PS1='${debian_chroot:+($debian_chroot)}\n\u at \h in \w $ '
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
alias rust="rustc"

alias :q="exit"
alias n="nautilus"
alias refresh="source ~/.bashrc"
alias bashconfig="gvim ~/.bashrc"
alias weechat="weechat-curses"
alias gn="cowsay -d 'Later, hacker' && sleep 3 && sudo shutdown -h now"
alias cya="cowsay -t 'Cya in a while' && sleep 3 && sudo pm-suspend"
alias yawn="cowsay -b 'knight is coming' && sleep 3 && sudo pm-hibernate"

# for git
alias gitcls="git rm -r --cached ."
alias gpu="git push"
alias gpl="git pull"
alias gi="git init"
alias ga="git add"
alias gc="git commit -m"
alias gd="git diff"
alias gr="git reset"
alias gst="git status"
alias gch="git checkout"
alias gb="git branch"


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
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-i386/bin/"

# go settings
export PATH=$PATH:/opt/go/bin
export GOPATH=/opt/gocode/
export GOROOT=/opt/go/

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# Add android development tools to path
# Android Studio
PATH=$PATH:$HOME/bin/android-studio/bin/studio.sh
# Eclipse IDE
PATH=$PATH:$HOME/build/adt-bundle-linux-x86-20140321/eclipse 
# the android sdk
PATH=$PATH:$HOME/build/adt-bundle-linux-x86-20140321/eclipse/sdk/tools
PATH=$PATH:$HOME/build/adt-bundle-linux-x86-20140321/eclipse/sdk/platform-tools
