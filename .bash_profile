# figure out the OS
uname_str=`uname`
PLATFORM='unknown'
if [[ "$uname_str" == 'Darwin' ]]; then
    PLATFORM='mac'
elif [[ "$uname_str" == 'Linux' ]]; then
    PLATFORM='linux'
fi
export PLATFORM

# Add my bin to the path as well as /usr/local
export PATH=~/.bin:/usr/local/sbin:$PATH

. $HOME/.bashrc

# Generic Colouriser
if [[ "$PLATFORM" == "mac" ]]; then
    source "`brew --prefix grc`/etc/grc.bashrc"
fi

# Bash completion
if [[ "$PLATFORM" == "mac" ]]; then
    bcpath=`brew --prefix`/etc/bash_completion
elif [[ "$PLATFORM" == "linux" ]]; then
    bcpath=/etc/bash_completion
fi
[ -f "$bcpath" ] && source "$bcpath"

## Cleanup ##
unset PLATFORM

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
