#!/bin/bash

TARGET=~/Sciebo/rengaraj19_tbd_snapshot/

[ -d "$TARGET" ] || exit 1

HEAD=$(cat "$TARGET"/head)
[ "x$HEAD" == "x" ] && exit 1
echo "Snapshot is at $HEAD"

DIFF=$(git -c core.fileMode=false --work-tree="$TARGET" diff $HEAD -- . ':!report/.gitignore')

if [ "x$DIFF" != "x" ]; then
  echo "ERROR: There have been changes done to the snapshot:"
  echo "$DIFF"
  exit 1
fi

git --work-tree="$TARGET" checkout HEAD -- .
git rev-parse HEAD > "$TARGET"/head

echo "Files copied."
echo "Snapshot is now at $(cat "$TARGET"/head)"

STALE=$(git --work-tree="$TARGET" clean -xdn -e head -- .)
if [ "x$STALE" != "x" ]; then
  echo "WARNING: Stale files found in snapshot:"
  echo "$STALE"
  echo "Run the following command to clean up:"
  echo "git --work-tree=\"$TARGET\" clean -xdf -e head -- ."
fi
