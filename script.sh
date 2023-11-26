#!/bin/bash

# 定义命令列表，每个命令占一行
commands=(
  "command1"
  "command2"
  "command3"
  # 添加更多命令
)

# 循环执行每个命令
for cmd in "${commands[@]}"; do
  # 启动命令
  $cmd &

  # 获取命令的进程ID
  cmd_pid=$!

  # 等待120秒
  sleep 120

  # 终止命令进程
  kill $cmd_pid
done

