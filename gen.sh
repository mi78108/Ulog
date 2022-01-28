#!/bin/sh

:<<!
    根据问题标题和描述生成目录
!

doc_file="./问题清单.md"
echo '# 目录列表' > $doc_file
for year in $(ls ./); do
    if [[ -d $year ]]; then
                year_file="$year/README.md"
        if [[ -f $year_file ]]; then
            echo '# 目录列表' > $year_file
        fi
        echo "## $year 年度" >> $doc_file 
        for dc in $(ls $year); do
            taregt="$year/$dc/README.md"
            if [[ -f $taregt ]]; then 
                echo "Find [ $dc ]"
                doc=`sed -n '0,/^$/p' $taregt`
                doc1=$(echo "$doc" | awk '{if($0 ~ /^#/) print "> * "$0" [详情](./'$taregt')"; else print ">   "$0}' | grep -v "描述")
                doc2=$(echo "$doc" | awk '{if($0 ~ /^#/) print "> * "$0" [详情](./'$dc'/README.md)"; else print ">   "$0}' | grep -v "描述")

                cat >> $year_file <<EOF

$doc2

EOF
                cat >> $doc_file <<EOF

$doc1

EOF
            fi
        done
    fi
done
