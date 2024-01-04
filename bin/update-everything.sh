#!/usr/bin/env bash

#
# macOS.
# -------------

# echo ""
# echo "$(tput setaf 3) Update macOS Apps"
# echo "------------------------------$(tput sgr0)"
# sudo softwareupdate -i -a
# mas upgrade

#
# Homebrew.
# -------------

echo ""
echo ""
echo "$(tput setaf 3) Update Homebrew"
echo "------------------------------$(tput sgr0)"

brew update
brew upgrade
brew cleanup


#
# Node.js & npm.
# -------------

echo ""
echo ""
echo "$(tput setaf 3) Update Node.js & npm"
echo "------------------------------$(tput sgr0)"

# shellcheck source=/dev/null
[ -s "$HOME/.nvm" ] && . "$HOME/.nvm/nvm.sh"

# Updates to latest nvm Node.js.
nvm install node --reinstall-packages-from=node
nvm alias default node

# Updates npm itself.
nvm install-latest-npm
# npm install npm -g

# Update all global packages.
npm update -g



#
# Ruby.
# -------------

# echo ""
# echo ""
# echo "$(tput setaf 3) Update rvm"
# echo "------------------------------$(tput sgr0)"

# # Updates rvm itself.
# rvm get stable
# rvm reload

# # Updates all gemsets.
# rvm gemset update

# # Cleanup.
# rvm cleanup all


#
# ClamAV.
# -------------

echo ""
echo ""
echo "$(tput setaf 3) Update ClamAV Database"
echo "------------------------------$(tput sgr0)"

freshclam -v


#
# GPG.
# -------------

echo ""
echo ""
echo "$(tput setaf 3) Refresh GPG keys"
echo "------------------------------$(tput sgr0)"

gpg --refresh-keys

echo ""
echo "$(tput setaf 2) -------------------------------"
echo " ✓ all done$(tput sgr0)"
