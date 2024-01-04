#!/usr/bin/env bash
#
# Creates symlinks from the home directory to
# any desired dotfiles in ~/dotfiles.
#
# Adapted idea from:
# https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
########################################################################

set e

# list of files/folders to symlink in homedir
FILES="aliases exports private zshrc zprofile gitconfig gitignore hushlogin bin tmux.conf vimrc"

# ----------------------------------------------------------------------
# Creates the private file first; will be symlinked but ignored by git.
# ----------------------------------------------------------------------

touch private

# ----------------------------------------------------------------------
# Creates symlinks from the homedir to any files in the dotfiles directory
# specified in $FILES.
# ----------------------------------------------------------------------

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

# ----------------------------------------------------------------------
# Homebrew.
# ----------------------------------------------------------------------

echo "$(tput setaf 136)           Brewing all the things. "
echo "=============================================$(tput sgr0)"

./bin/install-brew.sh

echo "$(tput setaf 64)---------------------------------------------"
echo "                 ✓ done$(tput sgr0)"

# ----------------------------------------------------------------------
# Prompt.
# ----------------------------------------------------------------------

# Switches to using brew-installed zsh as default shell.
if [[ $(uname -m) == 'arm64' ]]; then
  PATH_HOMEBREW=/opt/homebrew
else
  PATH_HOMEBREW=/usr/local
fi

if ! grep -F -q "$PATH_HOMEBREW/bin/zsh" /etc/shells; then
  echo "$PATH_HOMEBREW/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s $PATH_HOMEBREW/bin/zsh;
fi;

echo "$(tput setaf 64)============================================="
echo "                 ✓ all done"
echo "=============================================$(tput sgr0)"
