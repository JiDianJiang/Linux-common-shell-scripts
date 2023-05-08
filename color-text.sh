#!/bin/bash

# 文件：color-text.sh
# 类型：Linux bash 脚本
# 用途：显示常用彩色文字
# ----------
# 脚本参数：无
# 脚本返回：0:正常执行 1:执行错误
# ----------
# 作者：机电匠(JiDianJiang), also known as Mechatronics Craftsman (MC)
# 版权：Copyright (c) 2023 机电匠(JiDianJiang)
# 许可：GNU General Public License v3.0
# GITHUB：https://github.com/JiDianJiang
# ----------
# ----------

TEXT='
MobaXterm终端原生关键词颜色
+--------------+----------+
| 单词         | 中文意思 |
+--------------+----------+
| Ok           | 好的     |
| Error        | 错误     |
| Warning      | 警告     |
| Notice       | 提示     |
| Note         | 注意     |
| Attention    | 关注     |
| Info         | 信息     |
| Information  | 信息     |
| Building     | 构建     |
| Starting     | 开始     |
| Stopped      | 停止     |
| Abort        | 中止     |
| Cancel       | 取消     |
| Loading      | 加载中   |
| Done         | 完毕     |
| Yes          | 是       |
| No           | 否       |
| Success      | 成功     |
| Failed       | 失败     |
| Unable to    | 不能     |
| Shutdown     | 关机     |
| Closed       | 关闭     |
| Enabled      | 启用     |
| Disabled     | 禁用     |
| Active       | 活动的   |
| Inactive     | 不活动的 |
| Connected    | 连接成功 |
| Disconnected | 连接断开 |
+--------------+----------+
'
echo -e "$TEXT"
exit 0