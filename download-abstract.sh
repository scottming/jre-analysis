#!/bin/bash

# if ! [ -f $1 ] 
if [ -z $1 ]
then
  echo "Please enter a file containing DOIs, separated by line breaks"
  echo ""
  echo "Example:"
  echo ""
  echo "  download-abstract.sh list.txt"
  echo ""
fi

for doi in `cat $1` 
do
  v=$[100 + (RANDOM % 100)]$[1000 + (RANDOM % 1000)]
  v=$[RANDOM % 2].${v:1:2}${v:4:3}
  echo 'sleep:' $v
  sleep ${v}s
  echo 'downloading: ' $doi
  name=${doi//\//X}
  touch ${name}.json
  curl https://api.semanticscholar.org/graph/v1/paper/$doi?fields=abstract --output ${name}.json
  echo ""
done
