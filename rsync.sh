#!/usr/bin/env bash
[[ "$(uname -s)" = "CYGWIN"* ]] && PROJECT_DIR=$(cygpath -u "$3") || PROJECT_DIR="$3"

REMOTE_HMACHINET="$1"
REMOTE_DIR="$REMOTE_HMACHINET:~/$4"
PRIVATE_KEY="$2"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "The .sh script dir is $SCRIPT_DIR"
echo "I'm using private key from $PRIVATE_KEY"
echo "syncing dirs: $PROJECT_DIR -> $REMOTE_DIR:"


#r - recursive
#l - links as symlinks
#t - preserve modification times
#D - preserve device & special files
#z - comporess during transfer
#v - verbose
#u - skip files newer on the receiver
rsync -e "ssh -i $PRIVATE_KEY" -rltDzvu --exclude-from=$SCRIPT_DIR/rsync-exclude --delete $PROJECT_DIR/. $REMOTE_DIR

echo "Voila!"