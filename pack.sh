#!/bin/bash

source ./dumpvars.sh
romname="$1"
systemdir="$2"
dirsize="$(du -sm "$systemdir" | awk '{print $1}')"
ssize=$(($dirsize+130))
size=$(($ssize*1024*1024))
output="$LOCALDIR/output"
day=$(date "+%Y%m%d")
outdir="$output/$romname-TempleGSI-AB-$day"
packimg="$romname-TempleGSI-AB-$day.img"

echo "开始打包..."

mkdir -p "$output"
mkdir -p "$outdir"

bin/make_ext4fs.exe -S $systemdir/../config/system_file_contexts -X $systemdir/../config/system_fs_config -l $size -L system -K vUA6spGTE7EuEd4H -a /system $packimg system

echo "打包完成"
echo "输出路径：$outdir/$packimg"
