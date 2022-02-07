# 使用Syncthing同步文件并执行脚本
## 描述
   使用Syncthing可以在不同设备之间同步文件。我在办公室电脑(Linux),和macbook上都部署了一套。使用起来很舒服，基本做到无缝操作。但有时候我在家想访问办公室电脑里其他路径的文件，而我又恰好无法远程登陆的，就在想同否通过Syncthing同步脚本过去执行。

## 环境
> - 时间: 2022年 02月 07日 星期一 15:29:58 CST
> - 主机名: MI-DESKTOP
> - 环境变量: [环境变量](./file/env.md)


## 状态
    [x] 已解决

## 原因


## 修复
    主要通过脚本实现:
    ```
        $ cat ~/Sync/init
        #!/usr/bin/env zsh

        for script in $HOME/Sync/do.d/*;
        do
            if [[ -f $script ]] && [[ -x $script ]]; then
            echo "`date` exec > "$script
            $script &
        fi
        done

    ```

    然后需要在crontab加条任务
    `* * * * *       /home/user/Sync/init >> /tmp/do.log 2>&1`

    如果是多台设备需要指定某台运行
    ```
        $ cat ~/Sync/do.d/do_target
#!/usr/bin/env zsh

script_path="$HOME/Sync/do.d/$(hostname)"
[ -d $script_path ] || mkdir $script_path
cd $script_path

for script in $script_path/*;
do
    if [[ -f $script ]] && [[ -x $script ]]; then
        echo "`date` exec > "$script
        $script &
    fi
done
    ```
