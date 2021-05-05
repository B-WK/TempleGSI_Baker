# TempleGSI_Baker - Setup Utils
# Copyright (C) 2021 Jvlong2019 <together08@yeah.net>

echo "安装 winget..."
.\init\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle

echo "使用 winget 工具安装依赖..."
winget install gsudo
winget install BellSoft.LibericaJDK8Full
winget install 7zip
winget install 7Zip-zstd
winget install GnuWin32.Wget
winget install python
winget install git
winget install Microsoft.VisualStudio.BuildTools

echo "使用 pip 安装 python 依赖..."
pip install protobuf pycryptodome pycrypto -i https://pypi.tuna.tsinghua.edu.cn/simple/
pip install init\backports.lzma-0.0.14-cp38-cp38-win32.whl

echo "依赖安装完成"
