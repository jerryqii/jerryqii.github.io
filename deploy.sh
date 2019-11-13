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

git init
git add -A
git commit -m "$deploycomment"

# 如果你想要部署到 https://<USERNAME>.github.io
git push -f git@github.com:jerryqii/jerryqii.github.io.git master

cd -