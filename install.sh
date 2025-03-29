#!/bin/bash
set -euo pipefail

manifest="${1:-./Manifest}"

RED='\e[31m'
GREEN='\e[32m'
CYAN='\e[36m'
NC='\e[0m'

# 日志函数定义
log_error() {
    local message="$1"
    echo -e "${RED}[失败] ${message}${NC}"
}

log_success() {
    local message="$1"
    echo -e "${GREEN}[成功] ${message}${NC}"
}

log_info() {
    local message="$1"
    echo -e "${CYAN}[信息] ${message}${NC}"
}

log_normal() {
    local message="$1"
    echo -e "${message}${NC}"
}

process_manifest() {
    while IFS=: read -r source target; do
        [[ -z "$source" || "$source" == \#* ]] && continue

        source=$(realpath -e "$source" 2>/dev/null || {
            log_error "源文件不存在: ${source}"; continue; 
        })

        target=$(eval echo "$target")
        if [ -L "$target" ]; then
            # 如果是软链接则删除
            if rm "$target"; then
                log_info "已删除软链接: $target"
            else
                log_error "删除软链接失败: $target"
                continue
            fi
        elif [ -e "$target" ]; then
            # 如果是普通文件/目录则备份
            backup_target="${target}_bak"
            if mv "$target" "$backup_target" 2>/dev/null; then
                log_info "完成备份: ${target} → ${backup_target}"
            else
                log_error "备份失败: ${target} 原文件保留"
                continue
            fi
        fi        

        # emacs 操作
        mkdir -p ~/.emacs.d

        log_info "开始创建: ln -s $source $target"

        if ln -s "$source" "$target"; then
            log_success "创建成功: ${target} ⇒ ${source}"
        else
            log_error "失败链接: ${target}"
        fi

    done < "$manifest"
}

main() {
    process_manifest
    log_normal "操作完成"
}

main
