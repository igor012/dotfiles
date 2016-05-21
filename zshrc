# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
stty -ixon

ZSH_THEME="agnoster"
DEFAULT_USER="fab"
ENABLE_CORRECTION="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git vagrant archlinux colored-man cp systemd sudo tmux gem)

# Load lesspipe
[ -x /usr/bin/lesspipe.sh  ] && eval "$(lesspipe.sh)"


# Load ls colors
[ -x /usr/bin/dircolors ] && eval "$(dircolors $HOME/.dircolors)"


# User configuration
#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/fab/.local/bin:/home/fab/Documents/tools:/sbin:/home/fab/.bin:/opt/logstash/bin:/home/fab/.gem/ruby/2.3.0/bin"
source $ZSH/oh-my-zsh.sh
source $HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim
export LC_TIME="en_US.UTF-8"
export TERM="xterm-256color"
export LS_OPTIONS="--color"
export LESSOPEN='|/usr/bin/lesspipe.sh %s'
export LESS='-R'
export VAGRANT_DEFAULT_PROVIDER="libvirt"
export ARCHFLAGS="-arch x86_64"
export VISUAL="vim"

#GEM AND RUBY
#export GEM_HOME=/home/fab/.gem/ruby/2.3.0
#export GEM_PATH=/home/fab/.gem/ruby/2.3.0
# SSH #
#if [ -n "$DESKTOP_SESSION" ];then
#    eval $(gnome-keyring-daemon --start --components=ssh)
#    export SSH_AUTH_SOCK
#fi

alias ls='ls $LS_OPTIONS'
alias l='ls -l'
alias ll='ls -l'
alias la='ls -la'
alias ltr='ls -artl'
alias lad="ls -ald $1 .??* 2> /dev/null || echo 'No hidden files'" #Only list hidden files to the lastest
alias open='xdg-open'
alias vim='vim -p'
alias grep='GREP_COLOR="33" grep'
alias tmux="tmux -2"
alias tn='tmux new -s work'
alias tc='tmux new -s chats'
alias tl="tmux list-sessions"
alias ta="tmux attach-session -t"
alias sdocker="sudo docker"
alias vgstatus="vagrant status"
alias vgup="vagrant up"
alias vginit="vagrant init"
alias vgreload="vagrant reload --provision"

#FUNCTIONS
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
            *.Z)              uncompress $1     ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
