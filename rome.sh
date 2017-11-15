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

rome_dir=".rome"
modules_list="modules.properties"

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
                    mkdir ${tempRootDir}/${rome_dir}/`basename ${moduleDir}`
                    echo ${moduleDir} >> ${tempRootDir}/${rome_dir}/${modules_list}
                fi
	        fi
	    done
	fi
}

# 初始化
# 生成 ".remo" 文件夹
# 扫描各个模块，生成仓库文件夹
init() {
    if test -e ${root}/${rome_dir}
    then
        echo -e "${red}Remo has been initialized!${red}"
        return
    fi
    mkdir ${root}/${rome_dir}
    touch ${root}/${modules_list}
    scanGradleProjects ${root}
}

clear() {
    if [ ! -e ${root}/${rome_dir} ]
    then
        echo -e "${red}Remo has not been initialized!${red}"
        return
    fi
    rm -rf ${root}/${rome_dir}
    echo "${green}done!${green}"
}

# 编译单个
build() {
    moduleName=$1
    if [ ${moduleName}=="" ]
    then
    buildAll
    fi
}

# 编译所有的模块，并更新 aar 或者 jar
buildAll() {
    echo "buildAll"
}

case $1 in
"init")
    init
    ;;
"clear")
    clear
    ;;
"build")
    build $2
    ;;
esac