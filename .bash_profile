# figure out the OS
uname_str=`uname`
PLATFORM='unknown'
if [[ "$uname_str" == 'Darwin' ]]; then
    PLATFORM='mac'
elif [[ "$uname_str" == 'Linux' ]]; then
    PLATFORM='linux'
fi
export PLATFORM

if  [[ "$PLATFORM" == "mac" ]]; then
    export PATH=/usr/local/bin:$PATH
fi
# Add my bin to the path
export PATH=~/.bin:$PATH

. $HOME/.bashrc

# Bash completion
if [[ "$PLATFORM" == "mac" ]]; then
    bcpath=`brew --prefix`/etc/bash_completion
elif [[ "$PLATFORM" == "linux" ]]; then
    bcpath=/etc/bash_completion
fi
[ -f "$bcpath" ] && source "$bcpath"

## Cleanup ##
unset PLATFORM
