#!/bin/bash

# 定义输入和输出文件
input_file="commands.txt"
output_file="new_script.sh"

# 读取命令列表文件，将每一行存入数组commands
mapfile -t commands < "$input_file"

# 创建新的脚本文件并写入前置代码
cat << 'EOF' > "$output_file"
#!/bin/bash

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
EOF

# 将命令列表追加到脚本文件中
{
  echo "commands=("
  for cmd in "${commands[@]}"; do
    echo "  \"$cmd\""
  done
  echo ")"
} | sed -i '/commands=(/r /dev/stdin' "$output_file"
