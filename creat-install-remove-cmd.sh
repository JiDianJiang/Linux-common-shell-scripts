#!/bin/bash

# creat-install-remove-cmd.sh
# Linux Shell脚本
# 根据当前linux系统使用的包管理器，创建自动安装和卸载软件的命令。

# 子程序：创建自动安装和卸载软件的命令
# 入参：软件包的名称
# 出参：install_cmd 安装命令全局变量 / remove_cmd 卸载命令全局变量
# 返回值：'0'找到包管理并创建安装或卸载命令 / '1'没有找到适合的包管理器
creat-install-remove-cmd() {
    local package=$1 # 提取入参
	local su="sudo "
    # 判断使用哪个包管理器(标注'*'表示已测试过)
    if   command -v apt-get >/dev/null 2>&1;      then       # apt-get * (Debian, Ubuntu, Mint)
        install_cmd="${su}apt-get install -y $package";      remove_cmd="${su}apt-get remove -y $package"
    elif command -v yum >/dev/null 2>&1;          then       # yum     * (CentOS, Fedora, RHEL)
        install_cmd="${su}yum install -y $package";          remove_cmd="${su}yum remove -y $package"
    elif command -v dnf >/dev/null 2>&1;          then       # dnf       (Fedora, RHEL)
        install_cmd="${su}dnf install -y $package";          remove_cmd="${su}dnf remove -y $package"
    elif command -v pacman >/dev/null 2>&1;       then       # pacman    (Arch Linux, Manjaro)
        install_cmd="${su}pacman -S --noconfirm $package";   remove_cmd="${su}pacman -Rs --noconfirm $package"
    elif command -v zypper >/dev/null 2>&1;       then       # zypper    (openSUSE)
        install_cmd="${su}zypper install -y $package";       remove_cmd="${su}zypper remove -y $package"
    elif command -v emerge >/dev/null 2>&1;       then       # emerge    (Gentoo)
        install_cmd="${su}emerge -av $package";              remove_cmd="${su}emerge --unmerge $package"
    elif command -v apk >/dev/null 2>&1;          then       # apk       (Alpine Linux)
        install_cmd="${su}apk add $package";                 remove_cmd="${su}apk del $package"
    elif command -v urpmi >/dev/null 2>&1;        then       # urpmi     (Mandriva, Mageia)
        install_cmd="${su}urpmi $package";                   remove_cmd="${su}urpme $package"
    elif command -v aptitude >/dev/null 2>&1;     then       # aptitude  (Debian, Ubuntu, Mint)
        install_cmd="${su}aptitude install -y $package";     remove_cmd="${su}aptitude remove -y $package"
    elif command -v rpm >/dev/null 2>&1;          then       # rpm       (Red Hat, SUSE)
        install_cmd="${su}rpm -ivh $package.rpm";            remove_cmd="${su}rpm -e $package"
    else return 1; fi # 没有找到适合的包管理器
    # 找到适合的包管理器
    return 0
}

# 调用示例
if creat-install-remove-cmd "screen"; then
    echo "0;$install_cmd;$remove_cmd"
    $remove_cmd  # 执行卸载
    $install_cmd # 执行安装
fi

exit 1
