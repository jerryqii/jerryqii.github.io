#!/usr/bin/env sh

# 终止一个错误
set -e

dd=$(date '+%Y-%m-%d %H:%M:%S')
deploycomment="Deploy at ${dd}"

# 构建
npm run build

git add -A
git commit -m "$deploycomment"
git push origin master

# 进入生成的构建文件夹
cd docs/.vuepress/dist

# 如果你是要部署到自定义域名
echo 'jerryqi.cn' > CNAME

# git init
# git add -A
# git commit -m "$deploycomment"
git subtree split -P ./ -b {新分支名称}

# 如果你想要部署到 https://<USERNAME>.github.io
git push -f git@github.com:jerryqii/jerryqii.github.io.git master

cd -

git subtree pull --prefix=docs/.vuepress/dist git@github.com:jerryqii/jerryqii.github.io.git master --squash
git subtree push --prefix=docs/.vuepress/dist git@github.com:jerryqii/jerryqii.github.io.git master
# git remote add -f github git@github.com:jerryqii/jerryqii.github.io.git
# git subtree add --prefix=docs/.vuepress/dist github master --squash
# git subtree pull --prefix=docs/.vuepress/dist github master --squash
# git subtree push --prefix=docs/.vuepress/dist github master