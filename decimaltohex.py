start = 50000000000000000000
end = 66666666666666666666

# 计算每组的大小
group_size = (end - start + 1) // 1440

# 打开文本文件来保存结果
with open('win10output.txt', 'w') as file:
    for i in range(10):
        group_start = start + i * group_size
        group_end = group_start + group_size - 1
        # 将开始和结束的数字转换为十六进制并保存到文件，去掉前缀0x
        group_str = f"{group_start:X}".lstrip('0x') + f":{group_end:X}".lstrip('0x') + "\n"
        file.write(group_str)

