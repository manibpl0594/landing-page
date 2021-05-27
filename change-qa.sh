#!/bin/bash
read -p "module name:" x
mv wp-content/* $x/
mv wp-includes/* $x/
rm -rf  wp-content
rm -rf wp-includes
mkdir -p $x/uploads/2020/04
cp ../cropped-* $x/uploads/2020/04/
find . -type f -name index.html -print0 | xargs -0 sed -i '' -e  "s/http:/https:/g"
find . -type f -name index.html -print0 | xargs -0 sed -i '' -e "s|/appointy.com|/qa-www.appointy.com|g"
find . -type f -name index.html -print0 | xargs -0 sed -i '' -e "s|/wp-content|/$x|g"
find . -type f -name index.html -print0 | xargs -0 sed -i '' -e "s|/wp-includes|/$x|g"
#find . -type f -name index.html -print0 | xargs -0 sed -i '' -e "s|qa-||g"
