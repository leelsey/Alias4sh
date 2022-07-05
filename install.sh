logo() {
    echo "#             _ _           _  _       _ \n#       /\\   | (_)         | || |     | | \n#      /  \\  | |_  __ _ ___| || |_ ___| |__ \n#     / /\\ \\ | | |/ _\` / __|__   _/ __| '_ \\ \n#    / ____ \\| | | (_| \\__ \\  | | \\__ \\ | | | \n#   /_/    \\_\\_|_|\\__,_|___/  |_| |___/_| |_| \n#\n"
}
begin() {
    touch ${ZDOTDIR:-~}/.aliasrc && chmod 600 ${ZDOTDIR:-~}/.aliasrc
    logo >> ${ZDOTDIR:-~}/.aliasrc
}
main() {
    begin
    echo 'alias shrl="exec $SHELL"' >> ${ZDOTDIR:-~}/.aliasrc
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo 'alias zshrl="source ~/.zshrc"' >> ${ZDOTDIR:-~}/.aliasrc
        echo 'alias his="history"' >> ${ZDOTDIR:-~}/.aliasrc
        echo 'alias hisp="history -p"' >> ${ZDOTDIR:-~}/.aliasrc
        echo 'alias hisc="echo -n > ~/.zsh_history && history -p  && exec $SHELL -l"' >> ${ZDOTDIR:-~}/.aliasrc
        echo 'alias hiscl="rm -f ~/.bash_history && rm -f ~/.node_repl_history && rm -f ~/.python_history"' >> ${ZDOTDIR:-~}/.aliasrc
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo 'alias zshrl="source ~/.bashrc"' >> ${ZDOTDIR:-~}/.aliasrc
        echo 'alias his="history"' >> ${ZDOTDIR:-~}/.aliasrc
        echo 'alias hisc="history -c"' >> ${ZDOTDIR:-~}/.aliasrc
    fi
    echo 'alias grep="grep --color=auto"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias egrep="egrep --color=auto"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias fgrep="fgrep --color=auto"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias diff="diff --color=auto"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias ls="ls --color=auto"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias l="ls -CF"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias ll="ls -l"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias la="ls -A"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias lla="ls -al"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias lld="ls -al --group-directories-first"' >> ${ZDOTDIR:-~}/.aliasrc
    echo "alias lst=\"ls -al | grep -v '^[d|b|c|l|p|s|-]'\"" >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias lr="ls -lR"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias tree="tree -Csu"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias dir="dir --color=auto"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias dird="dir -al --group-directories-first"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias vdir="vdir --color=auto"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias cls="clear"' >> ${ZDOTDIR:-~}/.aliasrc
    if [ "$(uname)" == "Darwin" ]; then
        echo 'alias ip="ipconfig"' >> ${ZDOTDIR:-~}/.aliasrc
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo 'alias ip addr="ip addr --color"' >> ${ZDOTDIR:-~}/.aliasrc
    fi
    echo 'alias dfh="df -h"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias duh="du -h"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias p="cd .."' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias f="finger"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias j="jobs -l"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias d="date"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias c="cal"' >> ${ZDOTDIR:-~}/.aliasrc
    echo 'alias curl="curl -w '\'\\'\n'\''"' >> ${ZDOTDIR:-~}/.aliasrc
    echo '#alias rm="rm -i"' >> ${ZDOTDIR:-~}/.aliasrc
    echo '#alias cp="cp -i"' >> ${ZDOTDIR:-~}/.aliasrc
    echo '#alias mv="mv -i"' >> ${ZDOTDIR:-~}/.aliasrc
    echo '#alias mkdir="mkdir -p"' >> ${ZDOTDIR:-~}/.aliasrc
    echo '#alias rmdir="rmdir -p"' >> ${ZDOTDIR:-~}/.aliasrc    
}
shrc() {
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo '-> Add on .zshrc file...'
        echo '\n#Alias4sh' >> ${ZDOTDIR:-~}/.zshrc
        echo 'source ~/.aliasrc \n' >> ${ZDOTDIR:-~}/.zshrc
        echo '\nDone! Try "source ~/.zshrc" or  to load the aliases. \n'
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo '-> Add on .bashrc file...'
        echo '\n#Alias4sh' >> ${ZDOTDIR:-~}/.bashrc
        echo 'source ~/.aliasrc \n' >> ${ZDOTDIR:-~}/.bashrc
        echo '\nDone! Try "source ~/.bashrc" or  to load the aliases. \n'
    fi
}
logo
echo '-> Checking for shell & OS...'
if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ] || [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    if [ "$(uname)" == "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        if [ -f "$HOME/.aliasrc" ]; then
            echo '-> Reinstall Alias4sh...'
            rm -f $HOME/.aliasrc
            main
            echo '\nDone! Restart your shell or to load the aliases. \nIf not work, check "source ~/.asliasrc" code in your shell resoure file (.zshrc or .bashrc). \n'
        else
            echo '-> Install Alias4sh, wait a moment...'
            main
            shrc
        fi
    else
        echo "\nSorry, not support OS. It's only supoort macOS and Linux.\n"
    fi
else
    echo "\nSorry, not support Shell. It's only support Zsh and Bash.\n"
fi