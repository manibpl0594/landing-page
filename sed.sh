find . -type f -name index.html -print0 | xargs -0 sed -i -e "s|/cache/asset-cleanup/css/head-.*\.css|/xy.css|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s/http:/https:/g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/appointy.com|/qa-www.appointy.com|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-content|/$Module|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-includes|/$Module|g"