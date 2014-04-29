# 维持upstream的更新

添加远端记录，添加一次即可

    git remote add upstream git://github.com/...

获取upstream更新

    git fetch upstream

合并upstream到当前fork分支

    git merge upstream/origin

推到fork的远端

    git push origin master

# 添加github上传令牌 #

    sudo apt-get install ruby
    gem install travis

用curl命令获得github上的token

    curl -u "username" https://api.github.com

用生成的token来生成secure

    travis encrypt RT-Thread/rtthread-manual-doc GITHUB_TOKEN=

# 移除http SSL验证 #

    git config --global http.sslVerify false
    
# 配置用户名 #

    git config --global user.name "Billy Everyteen"
    git config --global user.email "me@here.com"

# 创建远端的另外一个镜像 #

    git remote add mirror https://...git
    git push mirror master
