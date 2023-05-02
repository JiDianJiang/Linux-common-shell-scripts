#!/bin/bash

# compile-sh-to-exe.sh
# Linux Shell脚本
# 把shell脚本编译成可执行文件

# 获取脚本命令行第一个参数 并检查是否存在
VAR_1=$1
if [ -z "$VAR_1" ]; then echo "Please enter the name of the file to be compiled."; echo "Example: $0 /a/b/c/x.sh"; exit 1; fi

# 检查脚本命令行第一个参数 输入的文件是否存在
if [ ! -f "$VAR_1" ]; then echo "Error: file does not exist."; exit 1; fi


# 子程序：编译并生成可执行文件
# 入参：$1 脚本文件路径和名称（支持绝对和相对路径）
# 出参：无
# 返回值：'0'表示执行成功，'1'表示执行失败
compile-sh-to-exe() {
    if [ ! -f "$1" ]; then echo "Error: script file does not exist."; return 1; fi
    # 获取脚本文件路径和名称
    local script_file=$(basename "$1"); local script_dir=$(dirname "$1")
    local script_path=$(cd "$script_dir" && pwd)/"$script_file"
    # 使用shc编译
    local shc_cmd="shc -f $script_path"
    if ! $shc_cmd; then return 1; fi
    local rm_cmd="rm ${script_dir}/${script_file}.x"
    if ! $rm_cmd; then return 1; fi
    # 使用gcc编译
    local gcc_cmd="gcc -static ${script_dir}/${script_file}.x.c -o ${script_dir}/${script_file}.gx"
    if ! $gcc_cmd; then return 1; fi
    local rm_cmd="rm ${script_dir}/${script_file}.x.c"
    if ! $rm_cmd; then return 1; fi
    ldd ${script_dir}/${script_file}.gx
    # 编译成功
    return 0
}


# 调用示例
if compile-sh-to-exe "$VAR_1"; then
    echo "compile Success"
else
    echo "compile failed"
fi

# 命令行执行：./compile-sh-to-exe.sh /a/b/x.sh
# 命令行执行：./compile-sh-to-exe.sh x.sh

exit 1