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
export PATH=~/.bin:/usr/local/bin:/usr/loca/sbin:$PATH

. $HOME/.bashrc

# Bash completion
if [[ "$PLATFORM" == "mac" ]]; then
    path=`brew --prefix`/etc/bash_completion
elif [[ "$PLATFORM" == "linux" ]]; then
    path=/etc/bash_completion
fi
[ -f "$path" ] && source "$path"

## Cleanup ##
unset PLATFORM

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
