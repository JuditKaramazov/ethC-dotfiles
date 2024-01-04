#!/usr/bin/env bash
# 
# Usage:
# ./updaterepos.sh [parent_directory] 
#
#   Example usage:
#   ./updaterepos.sh projects/ [MAKE SURE YOU USE / SLASHES]
#
# Original idea from:
# http://stackoverflow.com/a/36800741/733677
#

updateRepo() {
    local dir="$1"
    local original_dir="$2"
    cd "$dir" || return # Switches to the git repo.
    repo_url=$(git config --get remote.origin.url)
    
    echo "$(tput setaf 136)Updating Repo: $dir with url: $repo_url$(tput sgr0)"
    
    main_branch="master"
    if [ "$repo_url" == "git@someserver:repo/repo.git" ]; then # If you have a repo where the primary branch isn't master.
        main_branch="trunk"
    fi

    # Updates the repo, and then stashes any local changes.
    echo "$(tput setaf 240)calling: git fetch --all && git stash$(tput sgr0)"
    (git fetch --all && git stash)
    current_branch=$(git rev-parse --abbrev-ref HEAD)

    # Switches to master/trunk branch and rebases it, then switches back to original branch.
    if [ "$current_branch" != $main_branch ]; then
        echo "$(tput setaf 240)calling: git checkout $main_branch && git rebase && git checkout $current_branch $(tput sgr0)"
        (git checkout $main_branch && git rebase && git checkout "$current_branch")
    fi

    # Rebases the original branch, and then stashes pop back to original state.
    echo "$(tput setaf 240)calling: git rebase && git stash pop on branch: $current_branch $(tput sgr0)"
    (git rebase && git stash pop ) 

    # Switches back to the starting directory.
    cd "$original_dir" || return
    echo ""
}

directory_to_update=${1}

if [ -z "$directory_to_update" ] ; then
    echo "$(tput setaf 240)no directory passed in, using current directory$(tput sgr0)"
    directory_to_update=$PWD
fi 

echo "$(tput setaf 240)Updating git repos in directory: $directory_to_update $(tput sgr0)"

count=0

for dir in $(find "$directory_to_update" -maxdepth 4 -type d -name .git -print0 | xargs -n -0 1 dirname); do
    updateRepo "$dir" "$directory_to_update"
    ((count+=1))
done

echo "$(tput setaf 76)✓ $count local git repos have been updated!$(tput sgr0)"
