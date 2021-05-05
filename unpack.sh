#!/bin/bash

# TempleGSI_Baker - Unpack Script Utils
# Copyright (C) 2021 Jvlong2019 <together08@yeah.net>

source ./dumpvars.sh
romzip="$1"

if [ -e $romzip ]; then
  7z x $romzip
  echo "解压 zip 完成"
else
  echo "当前所输入的刷机包不存在"
fi

# payload.bin检测
if [ -e './payload.bin' ]; then
   mv ./payload.bin ../payload
   echo "解压payload.bin中..."
   cd ../
   cd ./payload
   python ./payload.py ./payload.bin ./out
   mv ./payload.bin ../tmp
   echo "移动img至输出目录..."

 if [ -e "./out/product.img" ]; then
    mv ./out/product.img ../tmp/
 fi

 if [ -e "./out/reserve.img" ]; then
    mv ./out/reserve.img ../tmp/
 fi
 
 mv ./out/system.img ../tmp/
 mv ./out/vendor.img ../tmp/
 rm -rf ./out/*
 cd ../
 cd ./tmp
 mv ./system.img ../
 mv ./vendor.img ../

 if [ -e "./product.img" ]; then
   mv ./product.img ../
 fi
 
 if [ -e "./reserve.img" ]; then
   mv ./reserve.img ../
 fi
 echo "转换完成"
fi

#br检测
if [ -e ./system.new.dat.br ];then
  echo "正在解压system.new.br"
  if [ -e ./system.new.dat.br ];then
    $bin/brotli -d system.new.dat.br
    python $bin/sdat2img.py system.transfer.list system.new.dat ./system.img
    mv ./system.img ../
    rm -rf ./system.new.dat
  fi

  if [ -e ./vendor.new.dat.br ];then
    echo "正在解压vendor.new.br"
    $bin/brotli -d vendor.new.dat.br
    python $bin/sdat2img.py vendor.transfer.list vendor.new.dat ./vendor.img
    mv ./vendor.img ../
  fi

  if [ -e ./product.new.dat.br ];then
     echo "正在解压product.new.br"
     $bin/brotli -d product.new.dat.br
     python $bin/sdat2img.py product.transfer.list product.new.dat ./product.img
     mv ./product.img ../
  fi
fi

#dat检测
if [ -e ./system.new.dat ];then
  echo "正在转换system.new.dat"
  if [ -e ./system.new.dat ];then
    python $bin/sdat2img.py system.transfer.list system.new.dat ./system.img
    mv ./system.img ../
  fi

  if [ -e ./vendor.new.dat ];then
    python $bin/sdat2img.py vendor.transfer.list vendor.new.dat ./vendor.img
    mv ./vendor.img ../
  fi

  if [ -e ./product.new.dat ];then
    python $bin/sdat2img.py product.transfer.list product.new.dat ./product.img
    mv ./product.img ../
  fi
fi

#img检测
if [ -e ./system.img ];then
  mv ./*.img ../
fi

cd ../