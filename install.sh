logo() {
    echo "#             _ _           _  _       _ \n#       /\\   | (_)         | || |     | | \n#      /  \\  | |_  __ _ ___| || |_ ___| |__ \n#     / /\\ \\ | | |/ _\` / __|__   _/ __| '_ \\ \n#    / ____ \\| | | (_| \\__ \\  | | \\__ \\ | | | \n#   /_/    \\_\\_|_|\\__,_|___/  |_| |___/_| |_| \n#\n"
}
begin() {
    mkdir -p $HOME/.config/alias4sh
    touch $HOME/.config/alias4sh/aliasrc && chmod 600 $HOME/.config/alias4sh/aliasrc
    logo >> $HOME/.config/alias4sh/aliasrc
}
main() {
    begin
    echo 'alias shrl="exec $SHELL"' >> $HOME/.config/alias4sh/aliasrc
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo 'if [ -f ${ZDOTDIR:-~}/.zprofile ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    alias zshrl="source ~/.zprofile"' >> $HOME/.config/alias4sh/aliasrc
        echo 'elif [ -f ${ZDOTDIR:-~}/.zshrc ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    alias zshrl="source ~/.zshrc"' >> $HOME/.config/alias4sh/aliasrc
        echo 'elif [ -f ${ZDOTDIR:-~}/.zprofile ] || [ -f $HOME/.zprofile ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    alias zshrl="source ~/.zprofile && source ~/.zshrc"' >> $HOME/.config/alias4sh/aliasrc
        echo 'fi' >> $HOME/.config/alias4sh/aliasrc
        echo 'alias his="history"' >> $HOME/.config/alias4sh/aliasrc
        echo 'alias hisp="history -p"' >> $HOME/.config/alias4sh/aliasrc
        echo 'alias hisc="echo -n > ~/.zsh_history && history -p  && exec $SHELL -l"' >> $HOME/.config/alias4sh/aliasrc
        echo 'alias hisca="hisc; rm -f ~/.bash_history; rm -f ~/.node_repl_history; rm -f ~/.python_history"' >> $HOME/.config/alias4sh/aliasrc
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo 'if [ -f $HOME/.zprofile ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    alias bashrl="source ~/.bash_profile"' >> $HOME/.config/alias4sh/aliasrc
        echo 'elif [ -f $HOME/.zshrc ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    alias bashrl="source ~/.bashrc"' >> $HOME/.config/alias4sh/aliasrc
        echo 'elif [ -f $HOME/.zprofile ] || [ -f $HOME/.zprofile ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    alias bashrl="source ~/.bash_profile && source ~/.bashrc"' >> $HOME/.config/alias4sh/aliasrc
        echo 'fi' >> $HOME/.config/alias4sh/aliasrc
        echo 'alias his="history"' >> $HOME/.config/alias4sh/aliasrc
        echo 'alias hisc="history -c"' >> $HOME/.config/alias4sh/aliasrc
    fi
    echo 'alias grep="grep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias egrep="egrep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias fgrep="fgrep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias diff="diff --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias ls="ls --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias l="ls -CF"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias ll="ls -l"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias la="ls -A"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias lla="ls -al"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias lld="ls -al --group-directories-first"' >> $HOME/.config/alias4sh/aliasrc
    echo "alias lst=\"ls -al | grep -v '^[d|b|c|l|p|s|-]'\"" >> $HOME/.config/alias4sh/aliasrc
    echo 'alias lr="ls -lR"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias tree="tree -Csu"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias dir="dir --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias dird="dir -al --group-directories-first"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias vdir="vdir --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias cls="clear"' >> $HOME/.config/alias4sh/aliasrc
    if [ "$(uname)" == "Darwin" ]; then
        echo 'alias ip="ipconfig"' >> $HOME/.config/alias4sh/aliasrc
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo 'alias ip addr="ip addr --color"' >> $HOME/.config/alias4sh/aliasrc
    fi
    echo 'alias dfh="df -h"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias duh="du -h"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias nvi="nvim"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias cdh="cd ~"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias p="cd .."' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias f="finger"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias j="jobs -l"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias d="date"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias c="cal"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias mv="mv -iv"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias cp="cp -iv"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias rm="rm -iv"' >> $HOME/.config/alias4sh/aliasrc
    echo '#alias mkdir="mkdir -p"' >> $HOME/.config/alias4sh/aliasrc
    echo '#alias rmdir="rmdir -p"' >> $HOME/.config/alias4sh/aliasrc
    echo '#alias curl="curl -w '\'\\'\n'\''"' >> $HOME/.config/alias4sh/aliasrc
}
shrc() {
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo ' - Add on .zprofile file...'
        echo '\n# Alias4sh' >> $HOME/.zprofile
        echo 'source ~/.config/alias4sh/aliasrc \n' >> $HOME/.zprofile
        echo '\nDone! \n • Try "source ~/.zprofile" or restart Terminal to load the aliases. \n'
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo ' - Add on .bash_profile file...'
        echo '\n# Alias4sh' >> $HOME/.bash_profile
        echo 'source ~/.config/alias4sh/aliasrc \n' >> $HOME/.bash_profile
        echo '\nDone! \n • Try "source ~/.bash_profile" or Terminal to load the aliases. \n'
    fi
}
logo
echo ' - Check shell type and OS!'
if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ] || [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    if [ "$(uname)" == "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        if [ -f "$HOME/.config/alias4sh/aliasrc" ]; then
            echo ' - Reinstalled Alias4sh!'
            rm -f $HOME/.config/alias4sh/aliasrc
            main
            echo '\nDone! \n • Restart your shell or restart Terminal to load the aliases to your shell‘s profile.'
            echo ' • If not work, check "source ~/.config/alias4sh/aliasrc" code in your shell resoure file (.zprofile or .bash_profile). \n'
        else
            echo ' - Install Alias4sh, wait a moment...'
            main
            shrc
        fi
    else
        echo "\nSorry, not support OS. It's only supoort macOS and Linux.\n"
    fi
else
    echo "\nSorry, not support Shell. It's only support Zsh and Bash.\n"
fi