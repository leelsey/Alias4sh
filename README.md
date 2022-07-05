# Alias4sh

### Easily use shell through alias

## Support enviroment
- macOS
    - zsh
- Linux
    - bash
    - zsh

## Alias list
### Common
|Aliased cmd|Original cmd|
|---|---|
|shrl|exec $SHELL|
|his|history|
|grep|grep --color=auto|
|egrep|egrep --color=auto|
|fgrep|fgrep --color=auto|
|diff|diff --color=auto|
|ls|ls --color=auto|
|l|ls -CF|
|ll|ls -l|
|la|ls -A|
|lla|ls -al|
|lld|ls -al --group-directories-first|
|lst|ls -al | grep -v '^[d|b|c|l|p|s|-]'|
|lr|ls -lR|
|tree|tree -Csu|
|dir|dir --color=auto|
|dird|dir -al --group-directories-first|
|vdir|vdir --color=auto|
|cls|clear|
|dfh|df -h|
|duh|du -h|
|p|cd ..|
|f|finger|
|j|jobs -l|
|d|date|
|c|cal|
|curl|curl -w '\n'|
### For macOS
|Aliased cmd|Original cmd|
|---|---|
|ip|ipconfig|
### For Linux
|Aliased cmd|Original cmd|
|---|---|
|ip addr|ip addr --color|
### Zsh
|Aliased cmd|Original cmd|
|---|---|
|zshrl|source ~/.zshrc|
|hisp|history -p|
|hisc|echo -n > ~/.zsh_history && history -p  && exec $SHELL -l|
|hiscl|rm -f ~/.bash_history && rm -f ~/.node_repl_history && rm -f ~/.python_history|
### Bash
|Aliased cmd|Original cmd|
|---|---|
|bashrl|source ~/.bashrc|
|hisc|history -c|
### Disabled
|Aliased cmd|Original cmd|
|---|---|
|rm|rm -i|
|cp|cp -i|
|mv|mv -i|
|mkdir|mkdir -p|
|rmdir|rmdir -p|