### SYSTEM ###
function getproc {
    local proc=$1
    ps aux |grep -i ${proc}
}
function macupdate {
    function chezmoi_update() { chezmoi update }
    function omz_update() { omz update }
    function macos_update() { softwareupdate -i -a }
    case $1 in
        chezmoi) chezmoi_update;;
        omz) omz_update;;
        mac) macos_update;;
        all) chezmoi_update; omz_update; macos_update;;
        *) exit 1;;
    esac
}
### GIT ###

# Gitignore
function gi() {
    curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;
}

### DNS ###
function sdig {
    local record=$1
    local type=$2
    dig -t ${2} +nostats +nocomments +nocmd ${1}
}

### HTTP ###
function rehttp {
    local url=$1
    curl -sS -D - ${url}  -o /dev/null
}

######## TEST ########

function help {
    local func_name=$1
    case $func_name in
        "lol") echo "lol" ;;
    esac
}

##
plop() {
    plop=$(mktemp --directory -t 'plop' -p /var/tmp)
    cd $plop
}
