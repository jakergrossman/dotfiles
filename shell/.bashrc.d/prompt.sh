prompt_command () {
    c () {
        local -A colors=(
            [black]=0
            [red]=1
            [green]=2
            [blue]=4
            [purple]=5
        )
        echo "\[$([[ -v colors["$1"] ]] && tput setaf "${colors[$1]}" || tput sgr0)\]"
    }
    test -n "$(git status --porcelain 2>/dev/null)" && local vcs="$(c purple)*$(c)" || local vcs=" "
    export PS1="$(c green)\u@\h$(c):$(c blue)\w$vcs$(c)$ "
}

PROMPT_COMMAND=prompt_command
