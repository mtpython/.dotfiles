DOTFILES=$HOME/.dotfiles

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    [[ ! -f ~/.alias.zsh ]] || source ~/.alias.zsh
    [[ ! -f ~/.sp.zsh ]] || source ~/.sp.zsh
    [[ ! -f ~/.functions.zsh ]] || source ~/.functions.zsh
fi
