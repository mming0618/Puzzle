import subprocess

# 读取要替换的字符串
with open('win10output.txt', 'r') as replace_file:
    replacements = [line.strip() for line in replace_file]

# 固定的字符串
fixed_string =' "./keyhunt -m rmd160 -f tests/66.rmd -r 31b4e81b4e81b4e70:31d0369d0369d0357 -l compress -R -s 5 -t 12"'

# 打开输出文件以保存替换后的命令
with open('winn10command.sh', 'w') as output_file:
    for replacement in replacements:
        modified_string = fixed_string.replace("31b4e81b4e81b4e70:31d0369d0369d0357", replacement)
        
        # 写入替换后的命令到输出文件
        output_file.write(modified_string + '\n')
        
        # 执行命令
        #subprocess.call(modified_string, shell=True)
