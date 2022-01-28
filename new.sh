#!/bin/sh

:<<!
    新建一个问题
    按年组织目录 
!

target_dir="$(date +%Y)"
root_dir="$target_dir/$(echo $1 | tr ' ' '_')"

if [[ ! -e $target_dir ]]; then
    mkdir -v $target_dir
fi

if [[ "x$1" = "x" ]]; then
    echo "指定一个标题"
    exit 1
fi

if [[ -e "$root_dir" ]]; then
    echo "目录已存在"
    exit 1
fi

mkdir -vp $root_dir/{file,script}

cat > $root_dir/file/env.md <<EOF
# $1 环境变量
## K-V 格式
\`\`\`
$(export)
\`\`\`
EOF

cat > $root_dir/README.md <<EOF
# $1
## 描述


## 环境
> - 时间: $(date)
> - 主机名: $(hostname)
> - 环境变量: [环境变量](./file/env.md)


## 状态


## 原因


## 修复
EOF


