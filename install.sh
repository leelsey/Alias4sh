aliasrcPath=$HOME"/.config/alias4sh/aliasrc"

logo() {
    echo "#             _ _           _  _       _ \n#       /\\   | (_)         | || |     | | \n#      /  \\  | |_  __ _ ___| || |_ ___| |__ \n#     / /\\ \\ | | |/ _\` / __|__   _/ __| '_ \\ \n#    / ____ \\| | | (_| \\__ \\  | | \\__ \\ | | | \n#   /_/    \\_\\_|_|\\__,_|___/  |_| |___/_| |_| \n#\n"
}

begin() {
    mkdir -p $HOME/.config/alias4sh
    touch $aliasrcPath && chmod 600 $aliasrcPath
    logo >> $aliasrcPath
}

main() {
    begin

    echo "\n# EXTENDED COMMAND" >> $aliasrcPath
    echo "\n# Enviroment" >> $aliasrcPath
    echo "shrl () { command exec -l \$SHELL ; }" >> $aliasrcPath
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo "if [ -f $HOME/.zprofile ] || [ -f $HOME/.zprofile ]; then" >> $aliasrcPath
        echo "    zshrl () { command source ~/.zprofile && source ~/.zshrc ; }" >> $aliasrcPath
        echo "elif [ -f $HOME/.zshrc ]; then" >> $aliasrcPath
        echo "    zshrl () { command source ~/.zshrc ; }" >> $aliasrcPath
        echo "elif [ -f $HOME/.zprofile ]; then" >> $aliasrcPath
        echo "    zshrl () { command source ~/.zprofile ; }" >> $aliasrcPath
        echo "fi" >> $aliasrcPath
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo "if [ -f $HOME/.zprofile ] || [ -f $HOME/.zprofile ]; then" >> $aliasrcPath
        echo "    bashrl () { command source ~/.bash_profile && source ~/.bashrc ; }" >> $aliasrcPath
        echo "elif [ -f $HOME/.zshrc ]; then" >> $aliasrcPath
        echo "    bashrl () { command source ~/.bashrc ; }" >> $aliasrcPath
        echo "elif [ -f $HOME/.zprofile ]; then" >> $aliasrcPath
        echo "    bashrl () { command source ~/.bash_profile ; }" >> $aliasrcPath
        echo "fi" >> $aliasrcPath
    fi
    echo "if [ $UID -ne 0 ]; then" >> $aliasrcPath
    echo "  admin () { command sudo -i ; } " >> $aliasrcPath
    echo "fi" >> $aliasrcPath

    echo "\n# Default Option" >> $aliasrcPath
    echo "chmod () { command chmod -v --preserve-root \"\$@\" ; }" >> $aliasrcPath
    echo "chown () { command chown -v --preserve-root \"\$@\" ; }" >> $aliasrcPath
    echo "chgrp () { command chgrp -v --preserve-root \"\$@\" ; }" >> $aliasrcPath
    echo "rm () { command rm -Iv --preserve-root \"\$@\" ; } " >> $aliasrcPath
    echo "mv () { command mv -iv \"\$@\" ; } " >> $aliasrcPath 
    echo "cp () { command cp -iv \"\$@\" ; } " >> $aliasrcPath 
    echo "ln () { command ln -iv \"\$@\" ; } " >> $aliasrcPath 
    echo "rmdir () { command rmdir -v \"\$@\" ; } " >> $aliasrcPath
    echo "mkdir () { command mkdir -v \"\$@\" ; } " >> $aliasrcPath
    echo "pings () { ping -a \"\$@\" ; }" >> $aliasrcPath
    echo "pingt () { ping -a -c 5 \"\$@\" ; }" >> $aliasrcPath
    if [ "$(uname)" == "Darwin" ]; then
        echo "pinga () { ping -a --apple-connect --apple-time \"\$@\" ; }" >> $aliasrcPath
        echo "ip () { command ipconfig \$@ ; }" >> $aliasrcPath
        
    fi

    echo "\n# Colourising" >> $aliasrcPath
    echo "ls () { command ls --color=auto \$@ ; }" >> $aliasrcPath
    echo "dir () { command dir --color=auto \$@ ; }" >> $aliasrcPath
    echo "vdir () { command vdir --color=auto \$@ ; }" >> $aliasrcPath
    echo "grep () { command grep --color=auto \$@ ; }" >> $aliasrcPath
    echo "egrep () { command egrep --color=auto \$@ ; }" >> $aliasrcPath
    echo "fgrep () { command fgrep --color=auto \$@ ; }" >> $aliasrcPath
    echo "xzegrep () { command xzegrep --color=auto \$@ ; }" >> $aliasrcPath
    echo "xzfgrep () { command xzfgrep --color=auto \$@ ; }" >> $aliasrcPath
    echo "xzgrep () { command xzgrep --color=auto \$@ ; }" >> $aliasrcPath
    echo "zegrep () { command zegrep --color=auto \$@ ; }" >> $aliasrcPath
    echo "zfgrep () { command zfgrep --color=auto \$@ ; }" >> $aliasrcPath
    echo "zgrep () { command zgrep --color=auto \$@ ; }" >> $aliasrcPath
    echo "tree () { command tree -C \$@ ; }" >> $aliasrcPath
    if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo "alias ip addr='ip addr --color'" >> $aliasrcPath
    fi

    echo "\n# Advanced Command" >> $aliasrcPath
    echo "whichos () { command echo $(uname) ; }" >> $aliasrcPath
    echo "l () { ls -CF \"\$@\" ; }" >> $aliasrcPath
    echo "l. () { ls -CFd .* \"\$@\" ; }" >> $aliasrcPath
    echo "ll () { ls -l \"\$@\" ; }" >> $aliasrcPath
    echo "ll. () { ls -ld .* \"\$@\" ; }" >> $aliasrcPath
    echo "la () { ls -A \"\$@\" ; }" >> $aliasrcPath
    echo "lal () { ls -Al \"\$@\" ; }" >> $aliasrcPath 
    echo "lla () { ls -al \"\$@\" ; }" >> $aliasrcPath
    echo "lst () { ls -alhF \"\$@\" ; }" >> $aliasrcPath 
    echo "lsd () { ls -A --group-directories-first \"\$@\" ; }" >> $aliasrcPath
    echo "lad () { ls -Al --group-directories-first \"\$@\" ; }" >> $aliasrcPath
    echo "lld () { ls -al --group-directories-first \"\$@\" ; }" >> $aliasrcPath
    echo "lsz () { ls -alh \$@ | grep -v \"^[d|b|c|l|p|s|-]\" \"\$@\" ; }" >> $aliasrcPath
    echo "ltr () { ls -lR \"\$@\" ; }" >> $aliasrcPath
    echo "dird () { dir -al --group-directories-first \"\$@\" ; }" >> $aliasrcPath
    echo "dfh () { df -h \"\$@\" ; }" >> $aliasrcPath
    echo "duh () { du -h \"\$@\" ; }" >> $aliasrcPath
    echo "find. () { find . \"\$@\" ; }" >> $aliasrcPath
    echo "findh () { find ~ \"\$@\" ; }" >> $aliasrcPath
    echo "findr () { find / \"\$@\" ; }" >> $aliasrcPath
    echo "cls () { clear ; }" >> $aliasrcPath
    echo "his () { history \"\$@\" ; }" >> $aliasrcPath
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo "hisp () { history -p ; }" >> $aliasrcPath
        echo "hisc () { echo -n > ~/.zsh_history && history -p  && exec $SHELL -l; }" >> $aliasrcPath
        echo "hisca () { echo -n > ~/.zsh_history && history -p && rm -f ~/.bash_history; rm -f ~/.node_repl_history; rm -f ~/.python_history; exec $SHELL -l; }" >> $aliasrcPath
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo "hisc () { history -c ; }" >> $aliasrcPath
    fi
    echo "shdn () { sudo shutdown \"\$@\" ; } " >> $aliasrcPath
    echo "shdnh () { sudo shutdown -h now ; } " >> $aliasrcPath
    echo "shdnr () { sudo shutdown -r now ; } " >> $aliasrcPath
    # echo "vi () { command vim \"\$@\" ; }" >> $aliasrcPath
    echo "vin () { vim \"+set nu\" ; }" >> $aliasrcPath
    echo "svi () { sudo vim \"\$@\" ; }" >> $aliasrcPath
    echo "svim () { sudo vim \"\$@\" ; }" >> $aliasrcPath
    echo "nvi () { nvim \"\$@\" ; }" >> $aliasrcPath
    echo "snvi () { sudo nvim \"\$@\" ; }" >> $aliasrcPath
    echo "snvim () { sudo nvim \"\$@\" ; }" >> $aliasrcPath
    echo "emcs () { emacs \"\$@\" ; }" >> $aliasrcPath
    echo "semcs () { sudo emacs \"\$@\" ; }" >> $aliasrcPath
    echo "semacs () { sudo emacs \"\$@\" ; }" >> $aliasrcPath
    echo "dif() { diff \$1 \$2 | bat -l diff ; }" >> $aliasrcPath
    echo "dfr() { diff -u \$1 \$2 | diffr --line-numbers; }" >> $aliasrcPath
    echo "gsdif() { while [[ \$# -gt 0 ]] ; do ; git show \"\${1}\" | bat -l diff ; shift ; done ; }" >> $aliasrcPath
    echo "gsdfr() { while [[ \$# -gt 0 ]] ; do ; git show \"\${1}\" | diffr --line-numbers ; shift ; done ; }" >> $aliasrcPath
    # echo "gsdif() {\n  while [[ $# -gt 0 ]]\n  do\n    git show "${1}" | bat -l diff;\n    shift\n  done\n}" >> $aliasrcPath
    # echo "gsdfr() {\n  while [[ $# -gt 0 ]]\n  do\n    git show "${1}" | diffr --line-numbers;\n    shift\n  done\n}" >> $aliasrcPath

    echo "\n\n# ALIAS FOR COMMAND" >> $aliasrcPath
    echo "alias da='date'" >> $aliasrcPath
    echo "alias ca='cal'" >> $aliasrcPath
    echo "alias c='clear'" >> $aliasrcPath
    echo "alias f='finger'" >> $aliasrcPath
    echo "alias j='jobs -l'" >> $aliasrcPath
    echo "alias bc='bc -l'" >> $aliasrcPath
    echo "alias reboot='sudo reboot'" >> $aliasrcPath
    echo "alias shutdown='sudo shutdown'" >> $aliasrcPath

    echo "\n\n# DISABLED COMMAND" >> $aliasrcPath
    echo "#alias vi='vim'             # replace vi -> vim" >> $aliasrcPath
    echo "#alias top='htop'           # replace top -> htop" >> $aliasrcPath
    echo "#alias wget='wget -c'       # continue download default" >> $aliasrcPath
    echo "#alias curl='curl -w \"\\\n\"'  # ignore output % (=warning) when use zsh" >> $aliasrcPath
    if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo "#alias dnf='sudo dnf'          # for redhat-based family" >> $aliasrcPath
        echo "#alias yum='sudo yum'          # legacy of redhat-based family" >> $aliasrcPath
        echo "#alias apt='sudo apt'          # for debian-based family" >> $aliasrcPath
        echo "#alias apt-get='sudo apt-get'  # legacy of debian-based family" >> $aliasrcPath
        echo "#alias pacman='sudo pacman'    # for arch-based family" >> $aliasrcPath
        echo "#alias zypper='sudo zypper'    # for suse-based family" >> $aliasrcPath
        echo "#alias nft='sudo nft'                # firewall management tool: nftables (netfilter table)" >> $aliasrcPath
        echo "#alias ufw='sudo ufw'                # firewall management tool: ufw (uncomplicated firewall)" >> $aliasrcPath
        echo "#alias firewall='sudo firewall-cmd'  # firewall management tool: firewall" >> $aliasrcPath
        echo "#alias iptables='sudo iptables'      # legacy of nefirewall management tool" >> $aliasrcPath
    fi
}
shrc() {
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo " - Add on .zprofile file..."
        echo "\n# Alias4sh" >> $HOME/.zprofile
        echo "source ~/.config/alias4sh/aliasrc \n" >> $HOME/.zprofile
        echo "\nDone! \n • Try \"source ~/.zprofile\" or restart Terminal to load the aliases.\n"
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo " - Add on .bash_profile file..."
        echo "\n# Alias4sh" >> $HOME/.bash_profile
        echo "source ~/.config/alias4sh/aliasrc \n" >> $HOME/.bash_profile
        echo "\nDone! \n • Try \"source ~/.bash_profile\" or Terminal to load the aliases.\n"
    fi
    # exec -l $SHELL ;
}
logo
echo " - Check shell type and OS!"
if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ] || [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    if [ "$(uname)" == "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        if [ -f "$aliasrcPath" ]; then
            echo " - Reinstalled Alias4sh!"
            rm -f $aliasrcPath
            main
            echo "\nDone! \n • Restart your shell or restart Terminal to load the aliases to your shell‘s profile."
            echo " • If not work, check "source ~/.config/alias4sh/aliasrc" code in your shell resoure file (.zprofile or .bash_profile). \n"
        else
            echo " - Install Alias4sh, wait a moment..."
            main
            shrc
        fi
    else
        echo "\nSorry, not support OS. Only supoort macOS and Linux.\n"
    fi
else
    echo "\nSorry, not support Shell. Only support Zsh and Bash. If \n"
fi
