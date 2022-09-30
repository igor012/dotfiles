# FILE AUTOMATICALLY GENERATED FROM /Users/fab/.zimrc
# EDIT THE SOURCE FILE AND THEN RUN zimfw build. DO NOT DIRECTLY EDIT THIS FILE!

if [[ -e ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]] zimfw() { source "${HOME}/.zim/zimfw.zsh" "${@}" }
fpath=("${HOME}/.zim/modules/git/functions" "${HOME}/.zim/modules/utility/functions" "${HOME}/.zim/modules/duration-info/functions" "${HOME}/.zim/modules/git-info/functions" "${HOME}/.zim/modules/zsh-completions/src" "${HOME}/.zim/modules/archive/functions" "${HOME}/.zim/modules/utility/functions" ${fpath})
autoload -Uz -- git-alias-lookup git-branch-current git-branch-delete-interactive git-branch-remote-tracking git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw duration-info-precmd duration-info-preexec coalesce git-action git-info archive lsarchive unarchive mkcd mkpw
source "${HOME}/.zim/modules/environment/init.zsh"
source "${HOME}/.zim/modules/git/init.zsh"
source "${HOME}/.zim/modules/input/init.zsh"
source "${HOME}/.zim/modules/termtitle/init.zsh"
source "${HOME}/.zim/modules/utility/init.zsh"
source "${HOME}/.zim/modules/utility/init.zsh"
source "${HOME}/.zim/modules/duration-info/init.zsh"
source "${HOME}/.zim/modules/completion/init.zsh"
source "${HOME}/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${HOME}/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "${HOME}/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${HOME}/.zim/modules/fzf/init.zsh"
source "${HOME}/.zim/modules/archive/init.zsh"
source "${HOME}/.zim/modules/exa/init.zsh"
source "${HOME}/.zim/modules/zsh-z/zsh-z.plugin.zsh"
source "${HOME}/.zim/modules/ohmyzsh/plugins/git/git.plugin.zsh"
source "${HOME}/.zim/modules/ohmyzsh/plugins/kubectl/kubectl.plugin.zsh"
source "${HOME}/.zim/modules/ohmyzsh/plugins/terraform/terraform.plugin.zsh"
