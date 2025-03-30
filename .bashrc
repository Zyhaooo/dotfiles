export EDITOR="helix"

export GOPATH="$HOME/.local/share/go"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias hx='helix'
alias e="emacs -nw"

. ~/.git/git-prompt.sh
. ~/.git/git-completion.bash

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

# 自定义 PS1 提示符
set_prompt() {
    local last_status=$?

    # 使用RGB颜色
    # 前景色
    # \[\e[38;2;R;G;Bm\]
    # 背景色
    # \[\e[48;2;R;G;Bm\]
    #
    # 使用256色
    # 前景色
    # \[\e[38;5;{n}m\]
    # 背景色
    # \[\e[48;5;{n}m\]
    #

    local GIT_COLOR="\[\e[38;2;0;255;204m\]"
    local DIR_COLOR="\[\e[38;2;255;251;0m\]"
    local STATUS_COLOR_0="\[\e[38;2;255;0;255m\]"
    local STATUS_COLOR_1="\[\e[38;2;255;60;0m\]"
    
    local RESET="\[\e[0m\]"

    local status_color
    if [ $last_status -eq 0 ]; then
        status_color="${STATUS_COLOR_0}"
    else
        status_color="${STATUS_COLOR_1}"
    fi

    # 当前目录
    local current_dir="${DIR_COLOR}\W${RESET}"

    # Git信息
    git_status="${GIT_COLOR}$(__git_ps1 " %s")${RESET}"

    # 最终PS1
    PS1="${status_color}λ ${RESET}${current_dir}${git_status} "
}

PROMPT_COMMAND=set_prompt


