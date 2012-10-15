维持upstream的更新
==================
# 添加远端记录，添加一次即可
git remote add upstream git://github.com/...

# 获取upstream更新
git fetch upstream
# 合并upstream到当前fork分支
git merge upstream/origin
# 推到fork的远端
git push origin master
