export EDITOR=vim
export TERM=xterm-256color
export PS1="\u:\W\[\e[38;5;35m\]\$(parse_git_branch) \[\e[39m\]$ "

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Startup welcome screen
WELCOME_MSG=(
    "∩(︶▾︶)∩ Gud morning ~"
    "(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧  Gud afternoon ~"
    "(っ˘▾˘)っ Gud evening ~"
    "(づ￣ ³￣)づ Gud nite ~"
)

# Default set currMsg to evening
# from 6:00 - 11:59 is morning
# from 12:00 - 17:59 is afternoon
# from 18:00 - 22:59 is evening
# from 23:00 - next day 5:59 is night

curr_time=$(date +"%H")
curr_msg=3

if [ "$curr_time" -ge 6 ]; then
    if [ "$curr_time" -lt 12 ]; then
        curr_msg=0
    fi
fi

if [ "$curr_time" -ge 12 ]; then
    if [ "$curr_time" -lt 18 ]; then
        curr_msg=1
    fi
fi

if [ "$curr_time" -ge 18 ]; then
    if [ "$curr_time" -lt 23 ]; then
        curr_msg=2
    fi
fi

echo "${WELCOME_MSG[$curr_msg]}"

# alias
alias c='clear'
alias la='ls -a'
alias ping='~/Code/tools/prettyping.sh --nolegend'
alias which='type -all'
alias wttr='curl wttr.in'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -FGlAhp'
alias sl='ls'
alias ..='cd ..'

alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gps='git push'
alias gpl='git pull'

# funny error msgs
INSULTS=(
    "|   Haha, n00b!                            | \n"
    "|   Plz uninstall                          | \n"
    "|   Incompetence is also competence        | \n"
    "|   No speak computer???                   | \n"
    "|   Error code: 1D10T                      | \n"
    "|   Dog shit coder found?!                 | \n"
    "|   FakE cOdIng mONkEy spOttED iN wILd     | \n"
    "|   Fake it till you make it!              | \n"
    "|   Pro tip: type a valid command!         | \n"
    "|   Wow! That was impressively wrong!      | \n"
    "|   An easy fix will be sudo rm -rf /      | \n"
    "|   Absolutely nobody:     You: eRrOR      | \n"
)

command_not_found_handle () {
    printf "*------------------------------------------*\n"
    printf "${INSULTS[$((RANDOM % ${#INSULTS[@]}))]}"
    printf "|                                          |\n"
    printf "|  （╯°□°）╯︵( .o.) Command not found     |\n"
    printf "|                                          |\n"
    printf "*------------------------------------------*\n"
    printf "       o\n"
    printf "        o   ╭─╮\n"
    printf "         o  ⌾ ⌾\n"
    printf "            │▕│\n"
    printf "            ╰─╯\n"
    return 127
}
