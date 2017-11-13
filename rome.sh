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

remo_dir=".remo"

root=`pwd`

#暂时只能扫描一级目录下的 build.gradle 文件
scanGradleProjects() {
	tempRootDir=$1
	if test -d ${tempRootDir}
	then
	    for moduleDir in ${tempRootDir}/*
	    do
	        if test -d ${moduleDir}
	        then
                if test -e ${moduleDir}/build.gradle
                then
                    echo ${moduleDir} >> ${tempRootDir}/modules
                fi
	        fi
	    done
	fi
}

if test -e ${root}/modules
then echo '' > ${root}/modules
fi
scanGradleProjects ${root}
