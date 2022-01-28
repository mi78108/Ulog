# Plasma_设置快捷键在最近使用的桌面间切换
## 描述
   安装完plasma 设置了常用的快捷键。一直没找到类似 Gnome 下 `切换到上一个桌面`,Dwm 中 `Toggle Desktop` 的选项。
   由于习惯了全屏打开应用。 一个桌面浏览器看资料。一个桌面编辑器写东西。然后 Win+Tab 快捷键，在这两个桌面间跳转。而不是遍历所有桌面。看了kde kwin script 的相关文档。似乎不是太复杂， 简单写了个凑合能用。

## 环境
> - 时间: 2022年 01月 28日 星期五 17:22:08 CST
> - 主机名: MI-DESKTOP
> - 环境变量: [环境变量](./file/env.md)


## 状态
- [x] 已解决

## 原因
   * 由于习惯了全屏打开应用。 一个桌面浏览器看资料。一个桌面编辑器写东西。然后 Win+Tab 快捷键，在这两个桌面间跳转。而不是遍历所有桌面。

## 修复
> - 代码已上传到 `https://github.com/mi78108/ToggleDesktop`
> - 代码直接放到 `~/.local/share/kwin/scripts/` 下
> - 打开系统设置中的 Kwin 脚本管理， 启用 `ToggleDesktop`
> - 打开快捷键设置中 Kwin 组， 找到 `ToggleDesktop` 设置相应的快捷键
 
![图片](https://user-images.githubusercontent.com/15873910/151523812-ec857648-efdc-4c63-87ca-455e2e8f1097.png)![图片](https://user-images.githubusercontent.com/15873910/151523520-4ef141cf-d974-4d9d-ba88-2f49f9f4df49.png)
