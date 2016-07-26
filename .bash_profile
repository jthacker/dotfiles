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

[ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
    export GPG_AGENT_INFO
else
    eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
fi

## Cleanup ##
unset PLATFORM
