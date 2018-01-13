#!/bin/bash

# -e 表示一有错误，立刻中断脚本执行。
# -u 表示用到不存在的环境变量就报错。
set -eu

# echo输出颜色，便于调试

black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
#浅红
magenta=$(tput setaf 5)
#青色
cyan=$(tput setaf 6)
#白色
white=$(tput setaf 7)
reverse=$(tput rev)
reset=$(tput sgr0)

gradle_file_url="https://github.com/qiaoyunrui/Rome/blob/master/gradle/rome.gradle"
gradle_name="rome.gradle"

init() {
    if [ -e ${gradle_name} ]
    then
        echo "${red}The ${gradle_name} has existed!${red}"
        return
    fi
    wget -o ${gradle_name} ${gradle_file_url}
    echo "${magenta}Download ${gradle_name} Done!${magenta}"
    gradle -b ${gradle_name} "hello"
}

if [ $# -eq 0 ]
then
    echo "${yellow}Rome.gradle${yellow}"
    exit 0
fi


case $1 in
"init")
    init
    ;;
esac
