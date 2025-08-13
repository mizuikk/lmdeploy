#!/bin/bash -ex

mkdir -p /wheels

# 使用清华源安装 python 包
if [[ "${CUDA_VERSION_SHORT}" != "cu118" ]]; then
    pip install nvidia-nccl-cu12 -i https://pypi.tuna.tsinghua.edu.cn/simple
else
    pip install nvidia-nccl-cu11 -i https://pypi.tuna.tsinghua.edu.cn/simple
fi

python3 -m build -w -o /wheels -v .