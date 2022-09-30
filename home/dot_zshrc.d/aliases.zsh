# General Aliases
alias j="z"
alias vim="nvim"
alias hg='history | grep '

# ls (eza)
alias ls="eza --color=auto"
alias ll="eza -l ${LS_OPTIONS}"
alias la="eza -la ${LS_OPTIONS}"
alias l="eza -l ${LS_OPTIONS}"
alias lrt="eza -la -snew"

# Auth helm
alias authhelm="gcloud auth print-access-token | helm registry login -u oauth2accesstoken --password-stdin https://europe-west1-docker.pkg.dev"
