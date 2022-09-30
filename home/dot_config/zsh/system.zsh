

### GIT ###
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

### TEMP DIR ###
plop() {
    plop=$(mktemp --directory -t 'plop' -p /var/tmp)
    cd $plop
}
