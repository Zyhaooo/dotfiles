export EDITOR="helix"
export GOPATH="$HOME/.local/share/go"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias hx='helix'
alias e="emacs -nw"

. ~/.git/git-prompt.sh
. ~/.git/git-completion.bash
export GIT_PS1_SHOWDIRTYSTATE=1 # 显示未提交修改
export GIT_PS1_SHOWUNTRACKEDFILES=1 # % 存在未跟踪文件
export GIT_PS1_SHOWUPSTREAM="auto" # 显示本地与远程分支差异 > => 本地领先; < => 本地落后
export GIT_PS1_SHOWCOLORHINTS=1 # 颜色支持

# 随机ASCII颜文字/表情
emoticons=(
    ":)"
    ":D"
    "O_O"
    "^_^"
    ">_<"
    "(*_*)"
    "=^.^="
)

# 如果是交互式终端，则随机选择一个表情
if [[ $- == *i* ]]; then
    echo -e "\e[36m${emoticons[$RANDOM % ${#emoticons[@]}]}\e[0m"
fi

# 自定义 PS1 提示符（含命令状态颜色）
set_prompt() {
    local last_status=$?

    # 增强对比度的颜色（保留基础色但使用加亮版本）
    local RED="\[\e[91;1m\]"    # 亮红
    local GREEN="\[\e[92;1m\]"  # 亮绿
    local YELLOW="\[\e[93;1m\]" # 亮黄
    local MAGENTA="\[\e[95;1m\]" # 亮品红
    local RESET="\[\e[0m\]"

    # 状态颜色（保持红/绿但更明亮）
    local status_color
    if [ $last_status -eq 0 ]; then
        status_color="${GREEN}"
    else
        status_color="${RED}"
    fi

    # 当前目录（保持黄色但更醒目）
    local current_dir="${YELLOW}\W${RESET}"

    # Git信息（提升对比度）
    git_status="$(__git_ps1 "[%s]")"

    # 最终PS1（保持原有结构，优化颜色）
    PS1="[${current_dir}]${git_status}${status_color} #${RESET} "
}
# 每次显示提示符前更新状态
PROMPT_COMMAND=set_prompt


