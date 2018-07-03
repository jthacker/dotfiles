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
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH
fi
# Add my bin to the path
export PATH=~/.bin:$PATH
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

. $HOME/.bashrc

# Bash completion
if [[ "$PLATFORM" == "mac" ]]; then
    bcpath=/usr/local/share/bash-completion/bash_completion
elif [[ "$PLATFORM" == "linux" ]]; then
    bcpath=/etc/bash_completion
fi
[ -f "$bcpath" ] && source "$bcpath"

gpgconf --launch gpg-agent
export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh

if [[ ! -z "$GOPATH" ]]; then
    export PATH=$PATH:$GOPATH/bin
fi

## Cleanup ##
unset PLATFORM
