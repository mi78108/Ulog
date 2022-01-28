# Plasma_没有图标
## 描述
  登陆plasma后。桌面应用没有图标，设置菜单指示也没有图标。更改主题以及图标会恢复正常，但只在当前会话生效。注销后失效


## 环境
> - 时间: 2022年 01月 28日 星期五 16:51:27 CST
> - 主机名: MI-DESKTOP
> - 环境变量: [环境变量](./file/env.md)


## 状态
- [x] 已解决

## 原因
  > DM 启动时设置了错误的环境变量。
  * 我这里被设置为: `QT_QPA_PLATFORMTHEME=`
  * 正确为:  `QT_QPA_PLATFORMTHEME=qt5ct` 或者 `QT_QPA_PLATFORMTHEME=gtk2`
  * 注意：两个值分别对应`qt5ct` 和 `qt5-styleplugins` 这两个包。
   


## 修复
> - 安装 qt5ct 这个包 `emerge -av qt5ct`
> - 检查 `/etc/env.d/98qt5ct` 中， `QT_QPA_PLATFORMTHEME` 的值是否正确
