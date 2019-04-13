###
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES_HOME="$HOME/.dotfiles"
export GOROOT="/usr/local/go"
export GOPATH="$HOME/.go"
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs aws)
POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
ZSH_THEME="powerlevel9k/powerlevel9k"
HIST_STAMPS="mm/dd/yyyy"


case $OSTYPE in
    linux*)  plugins=(git docker docker-compose terraform ansible zsh_reload kubectl aws)
             eval `dircolors $DOTFILES_HOME/dircolors`
             DEFAULT_USER="fab";;
    darwin*) plugins=(git docker brew cask docker-compose iterm2 terraform ansible zsh_reload kubectl aws)
             eval `gdircolors $DOTFILES_HOME/dircolors`
             DEFAULT_USER="fab";;
          *) plugins=(git zsh_reload);;
esac

source $ZSH/oh-my-zsh.sh

# User configuration
eval "$(jump shell zsh)"
[ -f $DOTFILES_HOME/fzf.zsh ] && source $DOTFILES_HOME/fzf.zsh
[ -f $DOTFILES_HOME/travis.sh ] && source $DOTFILES_HOME/travis.sh
[ -f $DOTFILES_HOME/iterm2_shell_integration.zsh ] && source $DOTFILES_HOME/iterm2_shell_integration.zsh
#[ -f $DOTFILES_HOME/google-cloud-sdk/completion.zsh.inc ] && source $DOTFILES_HOME/google-cloud-sdk/completion.zsh.inc
[ -x "$(command -v awless)" ] && source <(awless completion zsh)

if [ -x "$(command -v lsd)" ]; then
    alias ls="lsd --icon never -l"
else
   export LS_OPTIONS="--color=auto"
   alias ls='ls $LS_OPTIONS'
fi

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
