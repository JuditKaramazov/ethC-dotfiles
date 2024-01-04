#!/usr/bin/env bash
#
# Pulls in changes and makes new symlinks.
#
# Adapted from:
# https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh
# https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
########################################################################

# List of files/folders to symlink in homedir.
FILES="aliases exports private zshrc zprofile editorconfig gitconfig gitignore hushlogin bin tmux.conf vimrc"

for FILE in $FILES; do

    # Removes old symlinks (if present).
    if [ -h "$HOME/.$FILE" ]; then
        rm "$HOME/.$FILE"
        echo "$(tput setaf 64)✓$(tput sgr0) Removed old symlink to $(tput setaf 37)$FILE$(tput sgr0)"
    fi

    # Symlink files.
    ln -s "$PWD/$FILE" "$HOME/.$FILE"
    echo "$(tput setaf 64)✓$(tput sgr0) Created new symlink to $(tput setaf 37)$FILE$(tput sgr0)"

done

exit
