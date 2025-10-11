typeset -A ZI
ZI[BIN_DIR]="${HOME}/.zi/bin"
source "${ZI[BIN_DIR]}/zi.zsh"

autoload -Uz _zi
(( ${+_comps})) && _comps[zi]=_zi


zi ice blockf

zi light zsh-users/zsh-completions
zi light zsh-users/zsh-autosuggestions

zi light zsh-users/zsh-syntax-highlighting
zi light zdharma-continuum/fast-syntax-highlighting
zi light marlonrichert/zsh-autocomplete

zi snippet OMZP::git
zi snippet OMZP::ubuntu
zi snippet OMZP::battery
zi snippet OMZP::colorize
zi snippet OMZP::colored-man-pages
zi snippet OMZP::starship
zi snippet OMZP::thefuck
zi snippet OMZP::systemd
zi snippet OMZP::vscode

#zi ice as"command" from"gh-r" \
#  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
#  atpull"%atclone" src"init.zsh"
#zi light starship/starship

. "$HOME/.local/bin/env"

eval $(thefuck --alias)
