# 定义输入和输出文件
input_file = "commands.txt"
output_file = "new_script.sh"

# 读取命令列表文件，将每一行存入 commands 列表
with open(input_file, "r") as f:
    commands = [line.strip() for line in f if line.strip()]

# 创建新的脚本文件并写入代码
with open(output_file, "w") as f:
    f.write("#!/bin/bash\n\n")
    
    # 写入命令列表
    f.write("commands=(\n")
    for cmd in commands:
        f.write(f'  "{cmd}"\n')
    f.write(")\n\n")
    
    # 写入循环执行代码
    f.write("""# 循环执行每个命令
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
""")

print(f"新脚本文件已生成：{output_file}")
