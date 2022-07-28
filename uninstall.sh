echo ' - Removed Alias4sh!'
rm -rf $HOME/.config/alias4sh

ehoc '\Done!'
if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
    echo 'Pleas remove "source ~/.config/alias4sh/aliasrc" in ~/.zprofile \n'
elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
    echo 'Pleas remove "source ~/.config/alias4sh/aliasrc" in ~/.bash_profile \n'
fi