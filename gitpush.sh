#! /bin/bash

# git 自动化部署脚本
# 同步本地目录到文件git仓库

sudo cp -rf -u /etc/portage/* portage/
sudo cp -rf -u /usr/share/wallpapers/tupian/*  tupian/
sudo cp -rf -u /usr/share/sddm/* sddm/
sudo cp -rf -u ../../.config/neofetch/* neofetch/
sudo cp -rf -u ../../.docker/* docker/

sudo rm -rf docker/redis/data/* && rm -rf docker/mysql/data/* && rm -rf docker/nginx/html/*

# 如果当前工作区没有更改则无需继续进行
git status

# 确定是否要提交
read -r -p "是否继续提交?【Y/n】" input

case $input in
    [yY][eE][sS]|[yY])
        echo "继续提交"

        git add .
        git status

        # 输入提交说明
        read -p "请输入本次提交的备注说明:" commit
        echo "<<<<<<<< 将暂存区内容提交到本地仓库:开始 >>>>>>>>"
        git commit -m ${commit} --no-verify

        # 输入拉取远程仓库的分支名称
        read -p "请输入要推送远程仓库的分支名称:" pushBranch
        if [ "$pushBranch" != "" ]
        then 
            echo "<<<<<<<< 推送本地分支更到远程分支并合并:${pushBranch}开始 >>>>>>>>"
            git push origin ${pushBranch}
        else
            git push
        fi

        echo "<<<<<<<<<<<<<<本次推送完毕!>>>>>>>>>>>>>"
        ;;
        [nN][oO]|[nN])
            echo "中断提交"
            echo 1
        ;;
esac