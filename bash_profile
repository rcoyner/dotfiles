# Append to the history file instead of overwriting it
shopt -s histappend

if [[ `uname -s` == 'Darwin' ]]; then
    COLORFLAG='-G'
else
    COLORFLAG='--color=auto'
fi

# Default Aliases
alias cp='cp -vi'
alias df='df -h'
alias grep='grep --color=auto'
alias l='ls $COLORFLAG -ChF'
alias la='ls $COLORFLAG -lhFA'
alias ll='ls $COLORFLAG -lhF'
alias ls='ls $COLORFLAG -lhF'
alias mv='mv -vi'
alias psfind='ps aux |grep'
alias rm='rm -vi'

# Arch Linux Aliases
alias pacman='sudo pacman'

# Git Aliases
alias gap='git add --patch'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias gs='git status'
alias gpom='git push origin master'

export PS1='\033[0;36m\u@\h:\033[0;33m\w\033[0;36m\$\033[0;37m '

umask 022
bind 'set horizontal-scroll-mode on' # input scrolls instead of wrapping
bind 'set bell-style visible' # screen flashes instead of beeping

# History
HISTIGNORE='cd:dir:history:l:la:ll:ls:su:clear'
history_control=ignoredups

LESS_DIR=`which less`
VIM_DIR=`which vim`
export EDITOR="$VIM_DIR"
export PAGER="$LESS_DIR"
export VISUAL="$VIM_DIR"

if [ -n "$DISPLAY" ]; then
    # Arch Linux
    if [ -f /usr/bin/chromium ]; then
        export BROWSER=/usr/bin/chromium
    fi

    # Debian
    if [ -f /usr/bin/chromium-browser ]; then
        export BROWSER=/usr/bin/chromium-browser
    fi
fi

if [ -d /usr/local/bin ]; then
    export PATH=/usr/local/bin:$PATH
fi

if [ -d /usr/local/sbin ]; then
    export PATH=/usr/local/sbin:$PATH
fi

if [ -d ~/bin ]; then
    export PATH=~/bin:$PATH
fi

if [ -d /usr/bin/vendor_perl ]; then
    export PATH=/usr/bin/vendor_perl:$PATH
fi

if [ -d ~/opt/android-studio/sdk ]; then
    export ANDROID_HOME=~/opt/android-studio/sdk
fi

if [ -d ~/opt/android-studio/sdk/tools ]; then
    export PATH=~/opt/android-studio/sdk/tools:$PATH
fi

if [ -d ~/opt/android-studio/sdk/platform-tools ]; then
    export PATH=~/opt/android-studio/sdk/platform-tools:$PATH
fi

if [ -d ~/opt/android-studio/bin ]; then
    export PATH=~/opt/android-studio/bin:$PATH
fi

if [ -d /opt/java/bin ]; then
    export PATH=/opt/java/bin:$PATH
fi

if [ -d /usr/bin/pip ]; then
    export PIP_RESPECT_VIRTUALENV=true
fi

KEYCHAIN_DIR=`which keychain`
if [ $? -eq 0 ]; then
    $KEYCHAIN_DIR -Q -q ~/.ssh/id_rsa
    [[ -f ~/.keychain/$HOSTNAME-sh ]] && source ~/.keychain/$HOSTNAME-sh
fi
