#!/bin/bash
ROM_ROOT="$(pwd)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d "$ROM_ROOT/packages" ]; then
    echo "错误：请在 ROM 源码根目录下运行此脚本！"
    exit 1
fi

echo "正在还原中文语言文件到源码树..."
cp -rv "$SCRIPT_DIR/packages" "$ROM_ROOT/"
echo "所有汉化文件已还原成功！"
