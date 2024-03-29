aliasPath=$HOME"/.config/alias4sh/alias4.sh"

logo() {
    echo "#             _ _           _  _       _ \n#       /\\   | (_)         | || |     | | \n#      /  \\  | |_  __ _ ___| || |_ ___| |__ \n#     / /\\ \\ | | |/ _\` / __|__   _/ __| '_ \\ \n#    / ____ \\| | | (_| \\__ \\  | | \\__ \\ | | | \n#   /_/    \\_\\_|_|\\__,_|___/  |_| |___/_| |_| \n#\n"
}

begin() {
    mkdir -p $HOME/.config/alias4sh
    touch $aliasPath && chmod 600 $aliasPath
    logo >> $aliasPath
}

main() {
    begin

    # Funtional command part
    echo "\n# EXTENDED COMMAND" >> $aliasPath

    # About Shell and evironment
    echo "\n# Enviroment" >> $aliasPath
    echo "if [ $UID -ne 0 ]; then" >> $aliasPath
    echo "  admin () { command sudo -i ; } " >> $aliasPath
    echo "fi" >> $aliasPath
    echo "shrl () { echo \"reloaded shell\" && exec -l $SHELL ; }" >> $aliasPath
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo "zshrl () {" >> $aliasPath
        echo "  if [ -f $HOME/.zprofile ] || [ -f $HOME/.zprofile ]; then" >> $aliasPath
        echo "    source $HOME/.zprofile && source $HOME/.zshrc ;" >> $aliasPath
        echo "    echo \"reloaded zprofile and zshrc\" ;" >> $aliasPath
        echo "  elif [ -f $HOME/.zshrc ]; then" >> $aliasPath
        echo "    command source $HOME/.zshrc ;" >> $aliasPath
        echo "    echo \"reloaded zshrc\" ;" >> $aliasPath
        echo "  elif [ -f $HOME/.zprofile ]; then" >> $aliasPath
        echo "    command source $HOME/.zprofile ;" >> $aliasPath
        echo "    echo \"reloaded zprofile\" ;" >> $aliasPath
        echo "  else" >> $aliasPath
        echo "    echo \"shrl: No environment file found\"" >> $aliasPath
        echo "  fi" >> $aliasPath
        echo "}" >> $aliasPath
        echo "vizshenv () { vi $HOME/.zshenv ; }" >> $aliasPath
        echo "vizprofile () { vi $HOME/.zprofile ; }" >> $aliasPath
        echo "vizshrc () { vi $HOME/.zshrc ; }" >> $aliasPath
        echo "vizlogin () { vi $HOME/.zlogin ; }" >> $aliasPath
        echo "vizlogout () { vi $HOME/.zlogout ; }" >> $aliasPath
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo "bashrl () {" >> $aliasPath
        echo "  if [ -f $HOME/.bash_profile ] || [ -f $HOME/.bashrc ]; then" >> $aliasPath
        echo "    source $HOME/.bash_profile && source $HOME/.bashrc ;" >> $aliasPath
        echo "    echo \"reloaded bash_profile and bashrc\" ;" >> $aliasPath
        echo "  elif [ -f $HOME/.bashrc ]; then" >> $aliasPath
        echo "    command source $HOME/.bashrc ;" >> $aliasPath
        echo "    echo \"reloaded bashrc\" ;" >> $aliasPath
        echo "  elif [ -f $HOME/.bash_profile ]; then" >> $aliasPath
        echo "    command source $HOME/.bash_profile ;" >> $aliasPath
        echo "    echo \"reloaded bash_profile\" ;" >> $aliasPath
        echo "  else" >> $aliasPath
        echo "    echo \"shrl: no environment file found\"" >> $aliasPath
        echo "  fi" >> $aliasPath
        echo "}" >> $aliasPath
        echo "vibashenv () { vi $HOME/.bash_env ; }" >> $aliasPath
        echo "vibashprofile () { vi $HOME/.bash_profile ; }" >> $aliasPath
        echo "vibashrc () { vi $HOME/.bashrc ; }" >> $aliasPath
        echo "vibashlogin () { vi $HOME/.bash_login ; }" >> $aliasPath
        echo "vibalogout () { vi $HOME/.bash_logout ; }" >> $aliasPath
    fi

    # About default commands options
    echo "\n# Default Option" >> $aliasPath
    echo "rm () { command rm -I \"\$@\" ; } " >> $aliasPath
    echo "mv () { command mv -i \"\$@\" ; } " >> $aliasPath
    echo "cp () { command cp -i \"\$@\" ; } " >> $aliasPath
    echo "ln () { command ln -i \"\$@\" ; } " >> $aliasPath
    # echo "rmdir () { command rmdir -v \"\$@\" ; } " >> $aliasPath
    # echo "mkdir () { command mkdir -v \"\$@\" ; } " >> $aliasPath
    # echo "chmod () { command chmod --preserve-root \"\$@\" ; }" >> $aliasPath
    # echo "chown () { command chown --preserve-root \"\$@\" ; }" >> $aliasPath
    # echo "chgrp () { command chgrp --preserve-root \"\$@\" ; }" >> $aliasPath
    # echo "vi () { command vim \"\$@\" ; }" >> $aliasPath

    # About colourising for output
    echo "\n# Colourising" >> $aliasPath
    echo "ls () { command ls --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "dir () { command dir --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "vdir () { command vdir --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "grep () { command grep --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "egrep () { command egrep --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "fgrep () { command fgrep --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "xzegrep () { command xzegrep --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "xzfgrep () { command xzfgrep --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "xzgrep () { command xzgrep --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "zegrep () { command zegrep --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "zfgrep () { command zfgrep --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "zgrep () { command zgrep --color=auto \"\$@\" ;  }" >> $aliasPath
    echo "tree () { command tree -C \"\$@\" ;  }" >> $aliasPath
    if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo "alias ip addr='ip addr --color'" >> $aliasPath
    fi

    # About useful new command
    echo "\n# Advanced Command" >> $aliasPath
    echo "whichos () { command echo $(uname) ; }" >> $aliasPath
    echo "l () { ls -CF \"\$@\" ; }" >> $aliasPath
    echo "l. () { ls -CFd .* \"\$@\" ; }" >> $aliasPath
    echo "ll () { ls -l \"\$@\" ; }" >> $aliasPath
    echo "ll. () { ls -ld .* \"\$@\" ; }" >> $aliasPath
    echo "la () { ls -A \"\$@\" ; }" >> $aliasPath
    echo "lal () { ls -Al \"\$@\" ; }" >> $aliasPath
    echo "lla () { ls -al \"\$@\" ; }" >> $aliasPath
    echo "lst () { ls -alhF \"\$@\" ; }" >> $aliasPath
    echo "lsd () { ls -A --group-directories-first \"\$@\" ; }" >> $aliasPath
    echo "lad () { ls -Al --group-directories-first \"\$@\" ; }" >> $aliasPath
    echo "lld () { ls -al --group-directories-first \"\$@\" ; }" >> $aliasPath
    echo "lsz () { ls -alh \$@ | grep -v \"^[d|b|c|l|p|s|-]\" \"\$@\" ; }" >> $aliasPath
    echo "ltr () { ls -lR \"\$@\" ; }" >> $aliasPath
    echo "dird () { dir -al --group-directories-first \"\$@\" ; }" >> $aliasPath
    echo "dfh () { df -h \"\$@\" ; }" >> $aliasPath
    echo "duh () { du -h \"\$@\" ; }" >> $aliasPath
    echo "find. () { find . \"\$@\" ; }" >> $aliasPath
    echo "findh () { find ~ \"\$@\" ; }" >> $aliasPath
    echo "findr () { find / \"\$@\" ; }" >> $aliasPath
    echo "cls () { clear ; }" >> $aliasPath
    echo "his () { history \"\$@\" ; }" >> $aliasPath
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo "hisp () { history -p ; }" >> $aliasPath
        echo "hisc () { echo -n > ~/.zsh_history && history -p  && exec $SHELL -l; }" >> $aliasPath
        echo "hisca () { echo -n > ~/.zsh_history && history -p && rm -f ~/.bash_history; rm -f ~/.node_repl_history; rm -f ~/.python_history; exec $SHELL -l; }" >> $aliasPath
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo "hisc () { history -c ; }" >> $aliasPath
    fi
    echo "shdn () { sudo shutdown \"\$@\" ; } " >> $aliasPath
    echo "shdnh () { sudo shutdown -h now ; } " >> $aliasPath
    echo "shdnr () { sudo shutdown -r now ; } " >> $aliasPath
    echo "vin () { vim \"+set nu\" \"\$@\" ; }" >> $aliasPath
    echo "svi () { sudo vi \"\$@\" ; }" >> $aliasPath
    echo "svim () { sudo vim \"\$@\" ; }" >> $aliasPath
    echo "nvi () { nvim \"\$@\" ; }" >> $aliasPath
    echo "snvi () { sudo nvim \"\$@\" ; }" >> $aliasPath
    echo "snvim () { sudo nvim \"\$@\" ; }" >> $aliasPath
    echo "emcs () { emacs \"\$@\" ; }" >> $aliasPath
    echo "semcs () { sudo emacs \"\$@\" ; }" >> $aliasPath
    echo "semacs () { sudo emacs \"\$@\" ; }" >> $aliasPath
    echo "pings () { ping -a \"\$@\" ; }" >> $aliasPath
    echo "pingt () { ping -a -c 5 \"\$@\" ; }" >> $aliasPath
    if [ "$(uname)" == "Darwin" ]; then
        echo "pinga () { ping -a --apple-connect --apple-time \"\$@\" ; }" >> $aliasPath
        echo "ip () { command ipconfig \"\$@\" ;  }" >> $aliasPath
        echo "macrl () { killall SystemUIServer ; killall Dock ; killall Finder ; echo \"reloaded macOS GUI\"}" >> $aliasPath
        echo "resmac () {" >> $aliasPath
        echo "  defaults delete com.apple.dock ;" >> $aliasPath
        echo "  defaults write com.apple.dock ResetLaunchPad -bool true ;" >> $aliasPath
        echo "  killall Dock ; echo \"reseted dock and launchpad\" ;" >> $aliasPath
        echo "}" >> $aliasPath
        echo "resdock () {" >> $aliasPath
        echo "  defaults delete com.apple.dock ;" >> $aliasPath
        echo "  killall Dock ; echo \"reseted dock\" ;" >> $aliasPath
        echo "}" >> $aliasPath
        echo "reslaunchpad () {" >> $aliasPath
        echo "  defaults write com.apple.dock ResetLaunchPad -bool true ;" >> $aliasPath
        echo "  killall Dock ; echo \"reseted launchpad\" ;" >> $aliasPath
        echo "}" >> $aliasPath
        echo "macslp () {" >> $aliasPath
        echo "  if [ \"\$#\" -eq 1 ]; then" >> $aliasPath
        echo "    if [[ \$1 =~ on ]]; then" >> $aliasPath
        echo "      sudo pmset -c disablesleep 0 ;" >> $aliasPath
        echo "    elif [[ \$1 =~ off ]]; then" >> $aliasPath
        echo "      sudo pmset -c disablesleep 1 ;" >> $aliasPath
        echo "    else" >> $aliasPath
        echo "      echo \"usage: macslp on/off \" ;" >> $aliasPath        
        echo "    fi" >> $aliasPath
        echo "  else" >> $aliasPath
        echo "    echo \"usage: macslp on/off \" ;" >> $aliasPath
        echo "  fi" >> $aliasPath
        echo "}" >> $aliasPath
        echo "icloud () { cd '$HOME/Library/Mobile Documents/com~apple~CloudDocs' ;}" >> $aliasPath
        echo "iCloud () { cd '$HOME/Library/Mobile Documents/com~apple ~CloudDocs' ;}" >> $aliasPath
    fi
    echo "dropbox () { cd '$HOME/Dropbox' ;}" >> $aliasPath
    echo "Dropbox () { cd '$HOME/Dropbox' ;}" >> $aliasPath
    echo "dif () { diff \$1 \$2 | bat -l diff ; }" >> $aliasPath
    echo "dfr () { diff -u \$1 \$2 | diffr --line-numbers; }" >> $aliasPath
    echo "gsdif () { while [[ \$# -gt 0 ]] ; do ; git show \"\${1}\" | bat -l diff ; shift ; done ; }" >> $aliasPath
    echo "gsdfr () { while [[ \$# -gt 0 ]] ; do ; git show \"\${1}\" | diffr --line-numbers ; shift ; done ; }" >> $aliasPath
    if [ "$(uname)" == "Darwin" ]; then 
        echo "if ! { [ -f $HOME/.p/p ] && [ -f /opt/homebrew/bin/javactl] && [ -f /usr/local/bin/p]; }; then" >> $aliasPath
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo "if ! { [ -f $HOME/.p/p ] && [ -f /usr/bin/p]; }; then" >> $aliasPath
    fi
    echo "  p () {" >> $aliasPath
    echo "    if [ \$# -eq 0 ]; then" >> $aliasPath
    echo "      cd ..;" >> $aliasPath
    echo "    elif [ \$# -eq 1 ]; then" >> $aliasPath
    echo "      if [[ \$1 =~ '^[0-9]+$' ]]; then" >> $aliasPath
    echo "        if [[ \$1 == 0 ]]; then" >> $aliasPath
    echo "          pwd ;" >> $aliasPath
    echo "        else" >> $aliasPath
    echo "          printf -v cdpFull '%*s' \$1 ;" >> $aliasPath
    echo "          cd \"\${cdpFull// /\"../\"}\" ;" >> $aliasPath
    echo "        fi" >> $aliasPath
    echo "      elif [[ \$1 =~ '^[p]+$' ]]; then" >> $aliasPath
    echo "        pwd ;" >> $aliasPath
    echo "      elif [[ \$1 =~ '^[b]+$' ]] || [[ \$1 == - ]]; then" >> $aliasPath
    echo "        cd - ;" >> $aliasPath
    echo "      elif [[ \$1 =~ '^[r]+$' ]] || [[ \$1 == / ]]; then" >> $aliasPath
    echo "        cd / ;" >> $aliasPath
    echo "      elif [[ \$1 =~ '^[h]+$' ]] || [[ \$1 == ~ ]]; then" >> $aliasPath
    echo "        cd ~ ;" >> $aliasPath
    echo "      elif [[ \$1 == des ]] || [[ \$1 == Des ]]; then" >> $aliasPath
    echo "        cd ~/Desktop ;" >> $aliasPath
    echo "      elif [[ \$1 == doc ]] || [[ \$1 == Doc ]]; then" >> $aliasPath
    echo "        cd ~/Documents ;" >> $aliasPath
    echo "      elif [[ \$1 == dow ]] || [[ \$1 == Dow ]]; then" >> $aliasPath
    echo "        cd ~/Downloads ;" >> $aliasPath
    echo "      elif [[ \$1 == mov ]] || [[ \$1 == Mov ]]; then" >> $aliasPath
    echo "        cd ~/Movies ;" >> $aliasPath
    echo "      elif [[ \$1 == mus ]] || [[ \$1 == Mus ]]; then" >> $aliasPath
    echo "        cd ~/Music ;" >> $aliasPath
    echo "      elif [[ \$1 == pic ]] || [[ \$1 == Pic ]]; then" >> $aliasPath
    echo "        cd ~/Pictures ;" >> $aliasPath
    echo "      elif [[ \$1 == vid ]] || [[ \$1 == Vid ]]; then" >> $aliasPath
    echo "        cd ~/Videos ;" >> $aliasPath
    echo "      elif [[ \$1 == --help ]] || [[ \$1 == -help ]]; then" >> $aliasPath
    echo "        echo \"p: go to parent directory\"" >> $aliasPath
    echo "        echo \"p [number]: go to parent [number]th directory\"" >> $aliasPath
    echo "        echo \"p p: output current directory\"" >> $aliasPath
    echo "        echo \"p h: go to home directory\"" >> $aliasPath
    echo "        echo \"p r: go to root directory\"" >> $aliasPath
    echo "        echo \"p b: go to previous directory\"" >> $aliasPath
    echo "        echo \"p des: go to desktop directory\"" >> $aliasPath
    echo "        echo \"p doc: go to documents directory\"" >> $aliasPath
    echo "        echo \"p dow: go to downloads directory\"" >> $aliasPath
    echo "        echo \"p mov: go to movies directory\"" >> $aliasPath
    echo "        echo \"p mus: go to music directory\"" >> $aliasPath
    echo "        echo \"p pic: go to pictures directory\"" >> $aliasPath
    echo "        echo \"p vid: go to videos directory\"" >> $aliasPath
    echo "      else" >> $aliasPath
    echo "        echo \"p: wrong usage\" ;" >> $aliasPath
    echo "      fi" >> $aliasPath
    echo "    else" >> $aliasPath
    echo "      echo \"p: wrong usage\" ;" >> $aliasPath
    echo "    fi" >> $aliasPath
    echo "  }" >> $aliasPath
    echo "  cdp () { p ; }" >> $aliasPath
    echo "  cdh () { cd ~ ; }" >> $aliasPath
    echo "  cdr () { cd / ; }" >> $aliasPath
    echo "fi" >> $aliasPath
    if [ "$(uname)" == "Darwin" ]; then 
        echo "if ! { [ -f $HOME/.javactl/javactl ] && [ -f /opt/homebrew/bin/javactl] && [ -f /usr/local/bin/javactl]; }; then" >> $aliasPath
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo "if ! { [ -f $HOME/.javactl/javactl ] && [ -f /usr/bin/javactl]; }; then" >> $aliasPath
    fi
    echo "  javahome () {" >> $aliasPath
    echo "    if [ \"\$#\" -eq 0 ]; then" >> $aliasPath
    echo "      /usr/libexec/java_home -V ;" >> $aliasPath
    echo "    elif [ \"\$#\" -eq 1 ]; then" >> $aliasPath
    echo "      unset JAVA_HOME ;" >> $aliasPath
    echo "      export JAVA_HOME=\$(/usr/libexec/java_home -v \"\$1\") ;" >> $aliasPath
    echo "      java -version ;" >> $aliasPath
    echo "    else" >> $aliasPath
    echo "      echo \"javahome: wrong usage\"" >> $aliasPath
    echo "    fi" >> $aliasPath
    echo "  }" >> $aliasPath
    echo "fi" >> $aliasPath
    if [ "$(uname)" == "Darwin" ]; then 
        echo "if ! { [ -f $HOME/.chicn/chicn ] && [ -f /opt/homebrew/bin/chicn] && [ -f /usr/local/bin/chicn]; }; then" >> $aliasPath
        echo "  chicn () {" >> $aliasPath
        echo "    if [ \$# -eq 2 ]; then" >> $aliasPath
        echo "      if [[ \"\$1\" =~ ^https?:// ]]; then" >> $aliasPath
        echo "        curl -sLo /tmp/ic \"\$1\" ;" >> $aliasPath
        echo "        1=/tmp/iconchange" >> $aliasPath
        echo "      fi" >> $aliasPath
        echo "      if ! [ -f \$1 ]; then" >> $aliasPath
        echo "        echo \"chicn: cannot stat '\$1': No such file\"" >> $aliasPath
        echo "      elif ! [ -d \$2 ]; then" >> $aliasPath
        echo "        echo \"chicn: cannot stat '\$2': No such directory\"" >> $aliasPath
        echo "      else" >> $aliasPath
        echo "        sudo rm -rf \"\$2\"\$'/Icon\\\r'" >> $aliasPath
        echo "        sips -i \"\$1\" > /dev/null" >> $aliasPath
        echo "        DeRez -only icns \"\$1\" > /tmp/icnch.rsrc" >> $aliasPath
        echo "        sudo Rez -append /tmp/icnch.rsrc -o \"\$2\"\$'/Icon\\\r'" >> $aliasPath
        echo "        sudo SetFile -a C \"\$2\"" >> $aliasPath
        echo "        sudo SetFile -a V \"\$2\"\$'/Icon\\\r'" >> $aliasPath
        echo "      fi" >> $aliasPath
        echo "      rm -rf /tmp/icnch /tmp/icnch.rsrc" >> $aliasPath
        echo "   else" >> $aliasPath
        echo "     echo \"chicn: wrong usage\"" >> $aliasPath
        echo "   fi" >> $aliasPath
        echo "  }" >> $aliasPath
        echo "fi" >> $aliasPath
    fi
    echo "dockerun () {" >> $aliasPath
    echo "  if ! docker info > /dev/null 2>&1; then" >> $aliasPath
    echo "    echo \"dockerun false: Docker isn't running\"" >> $aliasPath
    echo "  else" >> $aliasPath
    echo "    echo \"dockerun true: Docker is running\"" >> $aliasPath
    echo "  fi" >> $aliasPath
    echo "}" >> $aliasPath
    # Alias command part
    echo "\n\n# ALIAS FOR COMMAND" >> $aliasPath
    echo "alias da='date'" >> $aliasPath
    echo "alias ca='cal'" >> $aliasPath
    echo "alias c='clear'" >> $aliasPath
    echo "alias f='finger'" >> $aliasPath
    echo "alias j='jobs -l'" >> $aliasPath
    echo "alias bc='bc -l'" >> $aliasPath
    echo "alias reboot='sudo reboot'" >> $aliasPath
    echo "alias shutdown='sudo shutdown'" >> $aliasPath

    # Disabed alias command part
    echo "\n\n# DISABLED COMMAND" >> $aliasPath
    echo "#alias vi='vim'             # replace vi -> vim" >> $aliasPath
    echo "#alias top='htop'           # replace top -> htop" >> $aliasPath
    echo "#alias wget='wget -c'       # continue download default" >> $aliasPath
    echo "#alias curl='curl -w \"\\\n\"'  # ignore output % (=warning) when use zsh" >> $aliasPath
    if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo "#alias dnf='sudo dnf'          # for redhat-based family" >> $aliasPath
        echo "#alias yum='sudo yum'          # legacy of redhat-based family" >> $aliasPath
        echo "#alias apt='sudo apt'          # for debian-based family" >> $aliasPath
        echo "#alias apt-get='sudo apt-get'  # legacy of debian-based family" >> $aliasPath
        echo "#alias pacman='sudo pacman'    # for arch-based family" >> $aliasPath
        echo "#alias zypper='sudo zypper'    # for suse-based family" >> $aliasPath
        echo "#alias nft='sudo nft'                # firewall management tool: nftables (netfilter table)" >> $aliasPath
        echo "#alias ufw='sudo ufw'                # firewall management tool: ufw (uncomplicated firewall)" >> $aliasPath
        echo "#alias firewall='sudo firewall-cmd'  # firewall management tool: firewall" >> $aliasPath
        echo "#alias iptables='sudo iptables'      # legacy of nefirewall management tool" >> $aliasPath
    fi
}

end() {
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo " - Add on .zprofile file..."
        echo "\n# Alias4sh" >> $HOME/.zprofile
        echo "source $aliasPath\n" >> $HOME/.zprofile
        echo "\nDone! \n • Try \"source ~/.zprofile\" or restart Terminal to load the aliases.\n"
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo " - Add on .bash_profile file..."
        echo "\n# Alias4sh" >> $HOME/.bash_profile
        echo "source $aliasPath\n" >> $HOME/.bash_profile
        echo "\nDone! \n • Try \"source ~/.bash_profile\" or Terminal to load the aliases.\n"
    fi
}

logo
echo " - Check shell type and OS!"
if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ] || [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    if [ "$(uname)" == "Darwin" ] || [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        if ! [ -f "$aliasPath" ]; then
            echo " - Install Alias4sh, wait a moment..."
            main
            end
        elif [ -f "$aliasPath" ]; then
            echo " - Reinstalled Alias4sh!"
            rm -f $aliasPath
            main
            echo "\nDone! \n • Restart your shell or restart Terminal to load the aliases to your shell‘s profile."
            echo " • If not work, check \"source ~/.config/alias4sh/alias.sh\" code in your shell resoure file (.zprofile or .bash_profile). \n"
        else
            echo " • Someting wrong. Please check persmission or file path."
        fi
    else
        echo "\nSorry, not support OS. Only supoort macOS and Linux.\n"
    fi
else
    echo "\nSorry, not support Shell. Only support Zsh and Bash. If \n"
fi
