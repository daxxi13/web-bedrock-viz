#!/bin/bash
source /env
echo "MapSource = $MapSource"
rm -rf /tmp/MapCopy
if [ -d ${MapSource:-/source} ]; then
  echo "copy source to working directory"
  cp -r ${MapSource:-/source} /tmp/MapCopy
else
  echo "MapSource not set or not a directory"
  exit 1
fi
if [ -d /var/www/html/ ]; then
  echo "out folder exist"
else
  echo "creating out folder"
  mkdir -p /var/www/html/
fi
/usr/local/bin/bedrock-viz --db /tmp/MapCopy --out /var/www/html/ --html-all
