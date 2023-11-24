#!/bin/bash

# 定义命令列表，每个命令占一行
commands=( 
"./keyhunt -m rmd160 -f tests/66.rmd -r 2B5E3AF16B1880000:2B60CCDA5CF520BD9 -l compress -R -s 5 -t 12"
 "./keyhunt -m rmd160 -f tests/66.rmd -r 2B60CCDA5CF520BDA:2B635EC34ED1C17B3 -l compress -R -s 5 -t 12"
 "./keyhunt -m rmd160 -f tests/66.rmd -r 2B635EC34ED1C17B4:2B65F0AC40AE6238D -l compress -R -s 5 -t 12"
 "./keyhunt -m rmd160 -f tests/66.rmd -r 2B65F0AC40AE6238E:2B688295328B02F67 -l compress -R -s 5 -t 12"
 "./keyhunt -m rmd160 -f tests/66.rmd -r 2B688295328B02F68:2B6B147E2467A3B41 -l compress -R -s 5 -t 12"
 "./keyhunt -m rmd160 -f tests/66.rmd -r 2B6B147E2467A3B42:2B6DA66716444471B -l compress -R -s 5 -t 12"
 "./keyhunt -m rmd160 -f tests/66.rmd -r 2B6DA66716444471C:2B7038500820E52F5 -l compress -R -s 5 -t 12"
 "./keyhunt -m rmd160 -f tests/66.rmd -r 2B7038500820E52F6:2B72CA38F9FD85ECF -l compress -R -s 5 -t 12"
 "./keyhunt -m rmd160 -f tests/66.rmd -r 2B72CA38F9FD85ED0:2B755C21EBDA26AA9 -l compress -R -s 5 -t 12"
 "./keyhunt -m rmd160 -f tests/66.rmd -r 2B755C21EBDA26AAA:2B77EE0ADDB6C7683 -l compress -R -s 5 -t 12"
)

# 循环执行每个命令
for cmd in "${commands[@]}"; do
  # 启动命令
  $cmd &

  # 获取命令的进程ID
  cmd_pid=$!

  # 等待120秒
  sleep 3600

  # 终止命令进程
  kill $cmd_pid
done

