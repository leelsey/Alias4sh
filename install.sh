aliasrcPath=$HOME"/.config/alias4sh/aliasrc"

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
    echo '\n# ENABLED ALIAS' >> $HOME/.config/alias4sh/aliasrc
    echo "# Reload Shell & Environment" >> $HOME/.config/alias4sh/aliasrc
    echo 'alias shrl="exec -l $SHELL"' >> $HOME/.config/alias4sh/aliasrc
    
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo 'if [ -f ${ZDOTDIR:-~}/.zprofile ] || [ -f $HOME/.zprofile ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    zshrl () { source ~/.zprofile && source ~/.zshrc; }' >> $HOME/.config/alias4sh/aliasrc
        echo 'elif [ -f ${ZDOTDIR:-~}/.zshrc ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    zshrl () { source ~/.zshrc; }' >> $HOME/.config/alias4sh/aliasrc
        echo 'elif [ -f ${ZDOTDIR:-~}/.zprofile ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    zshrl () { source ~/.zprofile; }' >> $HOME/.config/alias4sh/aliasrc
        echo 'fi' >> $HOME/.config/alias4sh/aliasrc
        echo "# History" >> $HOME/.config/alias4sh/aliasrc
        echo 'alias his="history"' >> $HOME/.config/alias4sh/aliasrc
        echo 'alias hisp="history -p"' >> $HOME/.config/alias4sh/aliasrc
        echo 'hisc () { echo -n > ~/.zsh_history && history -p  && exec $SHELL -l; }' >> $HOME/.config/alias4sh/aliasrc
        echo 'hisca () { echo -n > ~/.zsh_history && history -p && rm -f ~/.bash_history; rm -f ~/.node_repl_history; rm -f ~/.python_history; exec $SHELL -l; }' >> $HOME/.config/alias4sh/aliasrc
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo 'if [ -f $HOME/.zprofile ] || [ -f $HOME/.zprofile ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    bashrl () { source ~/.bash_profile && source ~/.bashrc; }' >> $HOME/.config/alias4sh/aliasrc
        echo 'elif [ -f $HOME/.zshrc ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    bashrl () { source ~/.bashrc; }' >> $HOME/.config/alias4sh/aliasrc
        echo 'elif [ -f $HOME/.zprofile ]; then' >> $HOME/.config/alias4sh/aliasrc
        echo '    bashrl () { source ~/.bash_profile; }' >> $HOME/.config/alias4sh/aliasrc
        echo 'fi' >> $HOME/.config/alias4sh/aliasrc
        echo "# History" >> $HOME/.config/alias4sh/aliasrc
        echo 'alias his="history"' >> $HOME/.config/alias4sh/aliasrc
        echo 'alias hisc="history -c"' >> $HOME/.config/alias4sh/aliasrc
    fi
    echo 'alias cl="clear"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias cls="clear"' >> $HOME/.config/alias4sh/aliasrc

    echo "# File & Directory" >> $HOME/.config/alias4sh/aliasrc
    echo 'alias ls="ls --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias l="ls -CF"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias l.="ls -CFd .*"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias ll="ls -l"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias ll.="ls -ld .*"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias la="ls -A"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias lsd="ls -A --group-directories-first"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias lal="ls -Al"' >> $HOME/.config/alias4sh/aliasrc 
    echo 'alias lad="ls -Al --group-directories-first"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias lla="ls -al"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias lld="ls -al --group-directories-first"' >> $HOME/.config/alias4sh/aliasrc
    echo "alias lst=\"ls -al | grep -v '^[d|b|c|l|p|s|-]'\"" >> $HOME/.config/alias4sh/aliasrc
    echo 'alias lr="ls -lR"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias tree="tree -Csu"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias dir="dir --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias dird="dir -al --group-directories-first"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias vdir="vdir --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias mv="mv -iv"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias cp="cp -iv"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias ln="ln -iv"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias rmdir="rmdir -v"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias mkdir="mkdir -v"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias cdh="cd ~"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias cdr="cd /"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias cdp="cd .."' >> $HOME/.config/alias4sh/aliasrc

    # Search
    echo 'alias grep="grep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias egrep="egrep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias fgrep="fgrep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias xzegrep="xzegrep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias xzfgrep="xzfgrep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias xzgrep="xzgrep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias zegrep="zegrep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias zfgrep="zfgrep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias zgrep="zgrep --color=auto"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias find.="find ."' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias findh="find ~"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias findr="find /"' >> $HOME/.config/alias4sh/aliasrc

    # Permission
    echo 'alias chown="chown --preserve-root"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias chown="chown --preserve-root"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias chgrp="chgrp --preserve-root"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias rm="rm -Iv --preserve-root"' >> $HOME/.config/alias4sh/aliasrc

    # System
    echo 'alias whichos="echo $(uname)"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias f="finger"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias j="jobs -l"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias p="ps"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias dfh="df -h"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias duh="du -h"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias d="date"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias c="cal"' >> $HOME/.config/alias4sh/aliasrc

    # Network
    echo 'alias ping="ping -a"' >> $HOME/.config/alias4sh/aliasrc
    if [ "$(uname)" == "Darwin" ]; then
        echo 'alias pings="ping --apple-connect --apple-time"' >> $HOME/.config/alias4sh/aliasrc
        echo 'alias pingt="ping -c 5"' >> $HOME/.config/alias4sh/aliasrc
        echo 'alias ip="ipconfig"' >> $HOME/.config/alias4sh/aliasrc
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo 'alias pingt="ping -c 4"' >> $HOME/.config/alias4sh/aliasrc
        echo 'alias ip addr="ip addr --color"' >> $HOME/.config/alias4sh/aliasrc
    fi
    echo 'alias wget="wget -c"' >> $HOME/.config/alias4sh/aliasrc

    # Utility
    echo 'alias vin="vi "+set nu""' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias nvi="nvim"' >> $HOME/.config/alias4sh/aliasrc
    echo 'alias bc="bc -l"' >> $HOME/.config/alias4sh/aliasrc
    echo 'dif() { diff "$1" "$2" | bat -l diff; }' >> $HOME/.config/alias4sh/aliasrc
    echo 'dfr() { diff -u "$1" "$2" | diffr --line-numbers; }' >> $HOME/.config/alias4sh/aliasrc
    echo 'gsdif() {\n  while [[ $# -gt 0 ]]\n  do\n    git show "${1}" | bat -l diff;\n    shift\n  done\n}' >> $HOME/.config/alias4sh/aliasrc
    echo 'gsdfr() {\n  while [[ $# -gt 0 ]]\n  do\n    git show "${1}" | diffr --line-numbers;\n    shift\n  done\n}' >> $HOME/.config/alias4sh/aliasrc
    
    # Super User
    echo 'if [ $UID -ne 0 ]; then' >> $HOME/.config/alias4sh/aliasrc
    echo '  alias admin="sudo -i"' >> $HOME/.config/alias4sh/aliasrc
    echo '  alias reboot="sudo reboot"' >> $HOME/.config/alias4sh/aliasrc
    echo '  alias shutdown="sudo shutdown"' >> $HOME/.config/alias4sh/aliasrc
    echo '  alias shdnh="sudo shutdown -h now"' >> $HOME/.config/alias4sh/aliasrc
    echo '  alias shdnr="sudo shutdown -r now"' >> $HOME/.config/alias4sh/aliasrc
    echo '  alias svi="sudo vi"' >> $HOME/.config/alias4sh/aliasrc
    echo 'fi' >> $HOME/.config/alias4sh/aliasrc

    echo '\n\n# DISABLED ALIAS' >> $HOME/.config/alias4sh/aliasrc
    echo '#alias curl="curl -w '\'\\'\n'\''"  # ignore output % (=warning) when use zsh' >> $HOME/.config/alias4sh/aliasrc
    echo '#alias vi="vim"    # replace vi -> vim' >> $HOME/.config/alias4sh/aliasrc
    echo '#alias top="htop"  # replace top -> htop' >> $HOME/.config/alias4sh/aliasrc
    if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo '#alias dnf="sudo dnf"          # for redhat-based family' >> $HOME/.config/alias4sh/aliasrc
        echo '#alias yum="sudo yum"          # legacy of redhat-based family' >> $HOME/.config/alias4sh/aliasrc
        echo '#alias apt="sudo apt"          # for debian-based family' >> $HOME/.config/alias4sh/aliasrc
        echo '#alias apt-get="sudo apt-get"  # legacy of debian-based family' >> $HOME/.config/alias4sh/aliasrc
        echo '#alias pacman="sudo pacman"    # for arch-based family' >> $HOME/.config/alias4sh/aliasrc
        echo '#alias zypper="sudo zypper"    # for suse-based family' >> $HOME/.config/alias4sh/aliasrc
        echo '#alias nft="sudo nft"                # firewall management tool: nftables (netfilter table)' >> $HOME/.config/alias4sh/aliasrc
        echo '#alias ufw="sudo ufw"                # firewall management tool: ufw (uncomplicated firewall)' >> $HOME/.config/alias4sh/aliasrc
        echo '#alias firewall="sudo firewall-cmd"  # firewall management tool: firewall' >> $HOME/.config/alias4sh/aliasrc
        echo '#alias iptables="sudo iptables"      # legacy of` nefirewall management tool' >> $HOME/.config/alias4sh/aliasrc
    fi
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