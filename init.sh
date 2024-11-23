#!/bin/bash

## Frontend

# Install npm packages

npm install

## Backend

# 项目根目录（可以根据需要修改）
PROJECT_DIR=$(pwd)
VENV_DIR="$PROJECT_DIR/backend/venv"

# 检查 Python 环境
if ! command -v python3 &> /dev/null; then
    echo "Python3 未安装或未在 PATH 中。请安装 Python3。"
    exit 1
fi

# 创建虚拟环境（如果不存在）
if [ ! -d "$VENV_DIR" ]; then
    echo "虚拟环境不存在，正在创建..."
    python3 -m venv "$VENV_DIR"
    if [ $? -ne 0 ]; then
        echo "虚拟环境创建失败，请检查 Python 环境。"
        exit 1
    fi
    echo "虚拟环境创建成功：$VENV_DIR"
else
    echo "虚拟环境已存在：$VENV_DIR"
fi

# 激活虚拟环境
echo "激活虚拟环境..."
source "$VENV_DIR/bin/activate"

# 检查是否成功激活虚拟环境
if [ $? -ne 0 ]; then
    echo "虚拟环境激活失败，请检查脚本路径和权限。"
    exit 1
fi

# 安装依赖
REQUIREMENTS_FILE="$PROJECT_DIR/backend/requirements.txt"
if [ -f "$REQUIREMENTS_FILE" ]; then
    echo "检测到 requirements.txt，正在安装依赖..."
    pip install --upgrade pip
    pip install -r "$REQUIREMENTS_FILE"
    if [ $? -eq 0 ]; then
        echo "Dependencies installation success!"
    else
        echo "Dependencies installation failed, please check the network and the file 'requirements.txt'!"
        exit 1
    fi
else
    echo "'requirements.txt' not detected, skip install the dependencies"
fi

# Install ibapi
source backend/venv/bin/activate
python backend/special_dependencies/ibapi/IBJts/source/pythonclient/setup.py install

# 完成
echo "Python virtual environment (venv) prepared."
echo "If you want to exit (venv), please execute 'deactivate'"


