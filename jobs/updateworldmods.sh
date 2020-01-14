#!/bin/sh
test -d "$WORLDMODS_DIR" || exit
cd $WORLDMODS_DIR

test -z "$WORLDMODS_BRANCH" && WORLDMODS_BRANCH=master

git remote update
git diff --exit-code HEAD origin/$WORLDMODS_BRANCH && exit

echo "updating worldmods"

# pull branch
git pull origin $WORLDMODS_BRANCH

# new mods
git submodule init

# changed repo urls
git submodule sync

# updated commits
git submodule update

# removed directories
git clean -dff

echo "Update complete!"

# create dirty file marker
touch /media_dirty
