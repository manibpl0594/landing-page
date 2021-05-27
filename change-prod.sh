#!/bin/bash
read -p "module name:" x
mv wp-content/* $x/
rm -rf  wp-content
mkdir -p $x/uploads/2020/04
cp ../cropped-* $x/uploads/2020/04/
find . -type f -name index.html -print0 | xargs -0 sed -i "s/http:/https:/g"
find . -type f -name index.html -print0 | xargs -0 sed -i "s|/appointy.com|/www.appointy.com|g"
find . -type f -name index.html -print0 | xargs -0 sed -i "s|/wp-content|/$x|g"
find . -type f -name index.html -print0 | xargs -0 sed -i "s|/wp-includes|/$x|g"
find . -type f -name index.html -print0 | xargs -0 sed -i "s|qa-||g"
