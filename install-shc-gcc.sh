#!/bin/bash

# install-shc-gcc.sh
# Linux Shell脚本
# 安装最新版的shc和gcc

# 需嵌入 creat-install-remove-cmd.sh 中的子程序：creat-install-remove-cmd()

# 子程序：安装最新版本的shc和gcc
# 入参：无
# 出参：无
# 返回值：'0'表示执行成功，'1'表示执行失败
install-shc-gcc() {
    # 安装shc
    if creat-install-remove-cmd "shc"; then
        $remove_cmd  # 执行卸载
        $install_cmd # 执行安装
    else return 1; fi # 安装失败
    # 安装gcc
    if creat-install-remove-cmd "gcc"; then
        $remove_cmd  # 执行卸载
        $install_cmd # 执行安装
    else return 1; fi # 安装失败
    # 安装成功
    return 0
}

# 调用示例
if install-shc-gcc; then
    echo "shc and gcc install Success"
else
    echo "shc and gcc install failed"
fi

exit 1