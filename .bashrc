# Check for an interactive session
[ -z "$PS1" ] && return

# Loop over the configuration files in the bashrc.d directory
RC_DIR=~/.bashrc.d
CONFIG_FILES=$RC_DIR/*
if [ -d "$RC_DIR" ]; then
	for file in $CONFIG_FILES; do
		source "$file"
	done
fi
