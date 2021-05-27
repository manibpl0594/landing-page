#!/bin/bash
#git pull
#read -p "module name:" x
#ayna -single http://appointy.com/$x/
echo "url: http://appointy.com/$x/"
cd root/
mv wp-content/* $x/
mv wp-includes/* $x/
rm -rf  wp-content
rm -rf wp-includes
mkdir -p $x/uploads/2020/04
cp ../cropped-* $x/uploads/2020/04/
uncss $x/index.html > $x/xy.css
cd $x
find . -type f -name index.html -print0 | xargs -0 sed -i -e "s|/cache/asset-cleanup/css/head-.*\.css|/xy.css|g"
#find . -type f -name index.html -print0 | xargs -0 sed -i '' -e "s|/cache/asset-cleanup/css/head-f85fcedc95322507df634d2a73b50423d6319bd2.css|/xy.css|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s/http:/https:/g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/appointy.com|/qa-www.appointy.com|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-content|/$x|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-includes|/$x|g"
chmod 755 xy.css
cd ../..
# echo 'sync start'
rsync -Parv root/$x/* landing-pages/$x/
# rm -rf root/

# echo 'docker build start'
# tag=$(date +%s)
# docker build -t gcr.io/appointy-test/landing-pages:$tag -f Dockerfile .
# docker push gcr.io/appointy-test/landing-pages:$tag

# echo 'git push start'
# git add .
# git commit -m '$x updated'
# git push
