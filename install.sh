logo() {
    echo "#             _ _           _  _       _ \n#       /\\   | (_)         | || |     | | \n#      /  \\  | |_  __ _ ___| || |_ ___| |__ \n#     / /\\ \\ | | |/ _\` / __|__   _/ __| '_ \\ \n#    / ____ \\| | | (_| \\__ \\  | | \\__ \\ | | | \n#   /_/    \\_\\_|_|\\__,_|___/  |_| |___/_| |_| \n#\n"
}
begin() {
    mkdir -p ${ZDOTDIR:-~}/.config/alias4sh
    touch ${ZDOTDIR:-~}/.config/alias4sh/aliasrc && chmod 600 ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    logo >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
}
main() {
    begin
    echo 'alias shrl="exec $SHELL"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo 'alias zshrl="source ~/.zshrc"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
        echo 'alias his="history"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
        echo 'alias hisp="history -p"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
        echo 'alias hisc="echo -n > ~/.zsh_history && history -p  && exec $SHELL -l"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
        echo 'alias hiscl="rm -f ~/.bash_history && rm -f ~/.node_repl_history && rm -f ~/.python_history"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo 'alias zshrl="source ~/.bashrc"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
        echo 'alias his="history"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
        echo 'alias hisc="history -c"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    fi
    echo 'alias grep="grep --color=auto"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias egrep="egrep --color=auto"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias fgrep="fgrep --color=auto"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias diff="diff --color=auto"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias ls="ls --color=auto"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias l="ls -CF"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias ll="ls -l"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias la="ls -A"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias lla="ls -al"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias lld="ls -al --group-directories-first"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo "alias lst=\"ls -al | grep -v '^[d|b|c|l|p|s|-]'\"" >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias lr="ls -lR"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias tree="tree -Csu"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias dir="dir --color=auto"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias dird="dir -al --group-directories-first"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias vdir="vdir --color=auto"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias cls="clear"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    if [ "$(uname)" == "Darwin" ]; then
        echo 'alias ip="ipconfig"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo 'alias ip addr="ip addr --color"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    fi
    echo 'alias dfh="df -h"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias duh="du -h"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias cdh="cd ~"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias p="cd .."' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias f="finger"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias j="jobs -l"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias d="date"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo 'alias c="cal"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo '#alias curl="curl -w '\'\\'\n'\''"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo '#alias rm="rm -i"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo '#alias cp="cp -i"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo '#alias mv="mv -i"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo '#alias mkdir="mkdir -p"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc
    echo '#alias rmdir="rmdir -p"' >> ${ZDOTDIR:-~}/.config/alias4sh/aliasrc    
}
shrc() {
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo '-> Add on .zshrc file...'
        echo '\n# Alias4sh' >> ${ZDOTDIR:-~}/.zshrc
        echo 'source ~/.config/alias4sh/aliasrc \n' >> ${ZDOTDIR:-~}/.zshrc
        echo '\nDone! Try "source ~/.zshrc" or  to load the aliases. \n'
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo '-> Add on .bashrc file...'
        echo '\n# Alias4sh' >> ${ZDOTDIR:-~}/.bashrc
        echo 'source ~/.config/alias4sh/aliasrc \n' >> ${ZDOTDIR:-~}/.bashrc
        echo '\nDone! Try "source ~/.bashrc" or  to load the aliases. \n'
    fi
}
logo
echo '-> Checking for shell & OS...'
if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ] || [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    if [ "$(uname)" == "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        if [ -f "$HOME/.config/alias4sh/aliasrc" ]; then
            echo '-> Reinstall Alias4sh...'
            rm -f $HOME/.config/alias4sh/aliasrc
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