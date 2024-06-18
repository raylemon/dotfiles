source /home/cedric/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle dnf
antigen bundle colorize
antigen bundle colored-man-pages

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zdharma-continuum/fast-syntax-highlighting

antigen apply

eval "$(starship init zsh)"
