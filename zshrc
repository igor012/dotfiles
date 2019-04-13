
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs aws)
POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER=""
HIST_STAMPS="mm/dd/yyyy"

plugins=(
   git docker brew cask docker-compose iterm2 terraform ansible zsh_reload kubectl aws
)

source $ZSH/oh-my-zsh.sh

# User configuration
eval `gdircolors $HOME/.dircolors`
eval "$(jump shell zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /Users/fabien.carre/.travis/travis.sh ] && source ~/.travis/travis.sh
[ -f ~/Documents/dotfiles/iterm2_shell_integration.zsh ] && source ~/Documents/dotfiles/iterm2_shell_integration.zsh
[ -f ~/Documents/google-cloud-sdk/completion.zsh.inc ] && source ~/Documents/google-cloud-sdk/completion.zsh.inc
source <(awless completion zsh)


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
