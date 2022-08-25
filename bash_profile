DIRCOLORS_PATH=`command -v dircolors`
LESS_PATH=`command -v less`
KEYCHAIN_PATH=`command -v keychain`
VIM_PATH=`command -v vim`

shopt -s histappend  # append to the history file instead of overwriting it

if [[ `uname -s` == 'Darwin' ]]; then
    COLORFLAG='-G'
else
    COLORFLAG='--color=auto'
fi

if [ ! -z $DIRCOLORS_PATH]; then
    if [ -x "$DIRCOLORS_PATH" ]; then  # outputs bash code to set LS_COLORS
        eval `dircolors --bourne-shell`
    fi
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

# Git Aliases
alias gap='git add --patch'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias gs='git status'
alias gpom='git push origin main'

export PS1='\033[0;36m\u@\h:\033[0;33m\w\033[0;36m\$\033[0;37m '

umask 022
bind 'set horizontal-scroll-mode on' # input scrolls instead of wrapping
bind 'set bell-style visible' # screen flashes instead of beeping

# History
HISTIGNORE='cd:dir:history:l:la:ll:ls:su:clear'
history_control=ignoredups

export EDITOR="$VIM_PATH"
export PAGER="$LESS_PATH"
export VISUAL="$VIM_PATH"

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

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    export PROJECT_HOME=$HOME/src
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
    source /usr/bin/virtualenvwrapper.sh
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

if [ -d ~/go/bin ]; then
	export PATH=~/go/bin:$PATH
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

if [ -d ~/.cargo/bin ]; then
    export PATH=~/.cargo/bin:$PATH
fi

if [ -f $KEYCHAIN_PATH ]; then
    $KEYCHAIN_PATH -Q -q ~/.ssh/id_rsa
    [[ -f ~/.keychain/$HOSTNAME-sh ]] && source ~/.keychain/$HOSTNAME-sh
fi

# Informs GPG which terminal it is executing to prompt for a passphrase.
GPG_TTY=$(tty)
export GPG_TTY

# Allow for GPG to be used under a SSH.
if [ -n "$SSH_CONNECTION" ]; then
    export PINENTRY_USER_DATA="USE_CURSES=1"
fi
