# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="awesomepanda"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    colored-man-pages
)

##### USER CONFIGURATION #####

bindkey "^y" autosuggest-accept

setopt globdots


##### sources #####

source $ZSH/oh-my-zsh.sh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


##### evals #####

eval "$(/opt/homebrew/bin/mise activate zsh)"
eval "$(zoxide init zsh)"


##### aliases #####

alias n="nvim ."
alias cd="z"

# copied from omarchy
alias ls="eza -lh --group-directories-first --icons=auto"
alias lsa="ls -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias lta="lt -a"


##### exports ######

export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export FPATH="$HOME/.zfunc:$FPATH"
autoload -Uz ytdl

# pnpm
export PNPM_HOME="/Users/john/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
