#!/bin/sh

test -d "$MEDIADIR" || exit
test -d "$WORLDMODS_DIR" || exit
test -f "/media_dirty" || exit

rm -rf /media_dirty

cd $WORLDMODS_DIR


collect_from () {
	echo "Processing media from: $1"
	find -L "$1" -type f -name "*.png" -o -name "*.ogg" -o -name "*.x" -o -name "*.b3d" | while read f; do
		basename "$f"
		hash=`openssl dgst -sha1 <"$f" | cut -d " " -f 2`
		cp "$f" $MEDIADIR/$hash
	done
}

mkdir -p $MEDIADIR
collect_from $WORLDMODS_DIR

printf "Creating index.mth... "
printf "MTHS\x00\x01" >$MEDIADIR/index.mth
find $MEDIADIR -type f -not -name index.mth | while read f; do
	openssl dgst -binary -sha1 <$f >>$MEDIADIR/index.mth
done
echo "done"
