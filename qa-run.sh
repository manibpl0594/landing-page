#!/bin/bash
#git pull
#read -p "module name:" x
ayna -single http://appointy.com/${env.Module}/
echo "url: http://appointy.com/${env.Module}/"
cd root/
mv wp-content/* ${env.Module}/
mv wp-includes/* ${env.Module}/
rm -rf  wp-content
rm -rf wp-includes
mkdir -p ${env.Module}/uploads/2020/04
cp ../cropped-* ${env.Module}/uploads/2020/04/
uncss ${env.Module}/index.html > ${env.Module}/xy.css
cd ${env.Module}
find . -type f -name index.html -print0 | xargs -0 sed -i -e "s|/cache/asset-cleanup/css/head-.*\.css|/xy.css|g"
#find . -type f -name index.html -print0 | xargs -0 sed -i '' -e "s|/cache/asset-cleanup/css/head-f85fcedc95322507df634d2a73b50423d6319bd2.css|/xy.css|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s/http:/https:/g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/appointy.com|/qa-www.appointy.com|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-content|/${env.Module}|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-includes|/${env.Module}|g"
chmod 755 xy.css
cd ../..
# echo 'sync start'
rsync -Parv root/${env.Module}/* landing-pages/${env.Module}/
# rm -rf root/

# echo 'docker build start'
# tag=$(date +%s)
# docker build -t gcr.io/appointy-test/landing-pages:$tag -f Dockerfile .
# docker push gcr.io/appointy-test/landing-pages:$tag

# echo 'git push start'
# git add .
# git commit -m '${env.Module} updated'
# git push
