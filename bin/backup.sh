#!/usr/bin/env bash
#
# Requires rsync 3.
#
# Asks for the administrator password upfront.
sudo -v

# NOTE: Make sure you update the `DST` variable to match the name of the
# destination backup drive.

DST="/Volumes/Macintosh HD/"
SRC="/"
EXCLUDE="$HOME/.dotfiles/bin/.backupignore"

PROG=$0

# --acls                   update the destination ACLs to be the same as the source ACLs.
# --archive                turn on archive mode (recursive copy + retain attributes).
# --delete                 delete any files that have been deleted locally.
# --delete-excluded        delete any files (on DST) that are part of the list of excluded files.
# --exclude-from           reference a list of files to exclude.
# --hard-links             preserve hard-links.
# --one-file-system         don't cross device boundaries (ignore mounted volumes).
# --sparse                 handle sparse files efficiently.
# --verbose                increase verbosity.
# --xattrs                 update the remote extended attributes to be the same as the local ones.

if [ ! -r "$SRC" ]; then
    logger -t "$PROG" "Source $SRC not readable - Cannot start the sync process"
    exit;
fi

if [ ! -w "$DST" ]; then
    logger -t "$PROG" "Destination $DST not writeable - Cannot start the sync process"
    exit;
fi

logger -t "$PROG" "Start rsync"

sudo rsync --acls \
           --archive \
           --delete \
           --delete-excluded \
           --exclude-from="$EXCLUDE" \
           --hard-links \
           --one-file-system \
           --sparse \
           --verbose \
           --xattrs \
           "$SRC" "$DST"

logger -t "$PROG" "End rsync"

# Makes the backup bootable.
sudo bless -folder "$DST"/System/Library/CoreServices

# Updates the backup's cache.
# sudo update_dyld_shared_cache -force -root "$DST"
exit 0
