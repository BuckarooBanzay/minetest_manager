#!/bin/sh


crond -f &
crond_pid=$!

if [ -f "$DEBUG_LOG" ]
then
  echo "Following debug.txt"
  tail -f $DEBUG_LOG | grep 'ERROR\[Main\]' >> $ERROR_LOG_OUTPUT &
fi

while `true`
do
  sleep 3600
done

# kill $crond_pid
