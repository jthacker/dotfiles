# Check for an interactive session
[ -z "$PS1" ] && return

# Loop over the configuration files in the bashrc.d directory
RC_DIR=~/.bashrc.d

if [ -d "$RC_DIR" ]; then
    CONFIG_FILES="$RC_DIR/*"
    OIFS="$IFS"
    IFS=$'\n'
	for file in $CONFIG_FILES; do
		source "$file"
	done
    IFS="$OIFS"
fi
