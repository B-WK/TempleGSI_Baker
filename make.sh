#!/bin/bash

source ./dumpvars.sh

romzip="$1"

if [ "$1" = "" ];then E:\手机刷机包\红米NOTE7
  echo "请输入需要解压的 zip 路径！"
  exit 1
fi

bash ./unpack.sh $romzip
