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
export PYTHONPATH=~/.lib/python

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

# Setting PATH for EPD-7.3-1
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH

MKL_NUM_THREADS=1
export MKL_NUM_THREADS
