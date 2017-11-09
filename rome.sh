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

for file in $root/*
do 
	if test -f $file
	then
		echo $file 是文件
	fi
	if test -d $file
	then echo $file 是目录
	fi
done

echo "End"