export GOPATH="${HOME}/.go"
export GOBIN="${GOPATH}/bin"
export PATH="${PATH}:/usr/local/sbin:${HOME}/.local/bin:$HOME/bin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:${GOBIN}:${HOME}/.homebrew/bin:${HOME}/Documents/google-cloud-sdk/bin:${HOME}/.krew/bin:/opt/podman/bin"
export LANG=en_US.UTF-8
export LESS="-F -X ${LESS}"
export EDITOR="nvim"
export PAGER="cat"
export LS_OPTIONS="--color=auto --icons"
export HISTSIZE=10000
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export TERM='xterm-256color'
fi
