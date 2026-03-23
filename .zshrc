# ~/.zshrc

# ---------- BASIC SETTINGS ----------
autoload -U compinit promptinit
compinit
promptinit

# Prompt
PROMPT='%F{blue}%~ %F{red}> '

# ---------- HISTORY ----------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS SHARE_HISTORY INC_APPEND_HISTORY

# ---------- OPTIONS ----------
setopt autocd
setopt correct
setopt extendedglob
setopt nomatch
setopt notify

# ---------- PLUGINS FROM SYSTEM ----------
# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-completions
fpath+=(/usr/share/zsh/plugins/zsh-completions/src)
autoload -U compinit && compinit

# ---------- ALIASES ----------
source ~/.aliases
# ---------- KEYBINDINGS ----------
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

