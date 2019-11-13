#!/usr/bin/env sh

# 终止一个错误
set -e

# 构建
npm run build

# 进入生成的构建文件夹
cd docs/.vuepress/dist

# 如果你是要部署到自定义域名
echo 'jerryqi.cn' > CNAME

cd -

# 生成当前提交comment
dd=$(date '+%Y-%m-%d %H:%M:%S')
deploycomment="Deploy at ${dd}"

# 提交代码
git add -A
git commit -m "$deploycomment"
git push origin master

# 因为GitHub不能定义Serve的目录, 所以这里通过subtree给他提交到GitHub
# git subtree add --prefix=docs/.vuepress/dist git@github.com:jerryqii/jerryqii.github.io.git master --squash
git subtree push --prefix=docs/.vuepress/dist git@github.com:jerryqii/jerryqii.github.io.git master

cd -

# 相关命令参考
# git subtree add --prefix=docs/.vuepress/dist git@github.com:jerryqii/jerryqii.github.io.git master --squash
# git subtree pull --prefix=docs/.vuepress/dist git@github.com:jerryqii/jerryqii.github.io.git master --squash
# git subtree push --prefix=docs/.vuepress/dist git@github.com:jerryqii/jerryqii.github.io.git master
# git remote add -f github git@github.com:jerryqii/jerryqii.github.io.git
# git subtree add --prefix=docs/.vuepress/dist github master --squash
# git subtree pull --prefix=docs/.vuepress/dist github master --squash
# git subtree push --prefix=docs/.vuepress/dist github master

# git subtree教程
# https://www.jianshu.com/p/d42d330bfead