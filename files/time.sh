#!/bin/bash

set -ex

while true; do
    date +"%H%M%Z" -s "$(curl http://smaslennikov.com/whattimeisitrightmeow/time.txt | sed -e 's/ //g')"
    sleep $((60 - $(date +%-S)))
done
