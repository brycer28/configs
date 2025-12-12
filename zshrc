# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Powerlevel10k theme
ZSH_THEME="bureau"

# Plugins
plugins=(
  git
  brew
  zsh-nvm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Gruvbox Colors
autoload -U colors && colors

GRUVBOX_DARK_BG="#3c3836"
GRUVBOX_LIGHT_BG="#ebdbb2"
GRUVBOX_ACCENT_BG="#b8bb26"
GRUVBOX_ACCENT_FG="#a89984"
GRUVBOX_RED_SOFT="#fb4934"
GRUVBOX_RED_HARD="#cc241d"
GRUVBOX_ORANGE_SOFT="#fe8019"
GRUVBOX_ORANGE_HARD="#d65d0e"
GRUVBOX_YELLOW_SOFT="#fabd2f"
GRUVBOX_YELLOW_HARD="#d79921"
GRUVBOX_GREEN_SOFT="#fb4934"
GRUVBOX_GREEN_HARD="#fb4934"
GRUVBOX_AQUA_SOFT="#8ec07c"
GRUVBOX_AQUA_HARD="#689d6a"
GRUVBOX_BLUE_SOFT="#83a598"
GRUVBOX_BLUE_HARD="#458588"
GRUVBOX_PURPLE_SOFT="#d3869b"
GRUVBOX_PURPLE_HARD="#b16286"
GRUVBOX_GRAY_SOFT="#a89984"
GRUVBOX_GRAY_HARD="#928374"

export GRUVBOX_TERM_BG=$GRUVBOX_DARK_BG
export GRUVBOX_TERM_FG=$GRUVBOX_LIGHT_BG

# Completion colors
zstyle ':completion:*' list-colors ${(s.:.)GRUVBOX_DARK_BG}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Autosuggestions colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$GRUVBOX_GRAY_HARD"
ZSH_AUTOSUGGEST_STRIKETHROUGH_HIGHLIGHT_STYLE="fg=$GRUVBOX_LIGHT_BG"
ZSH_AUTOSUGGEST_BACKGROUND_COLOR=$GRUVBOX_DARK_BG
COMPLETION_WAITING_DOTS="true"

# Source Oh My Zsh
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  source $ZSH/oh-my-zsh.sh
else
  echo "Warning: Oh My Zsh not found at $ZSH"
fi

# Load zsh-syntax-highlighting AFTER Oh My Zsh
if [ -f "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

  # Set custom highlight styles
  typeset -A ZSH_HIGHLIGHT_STYLES
  ZSH_HIGHLIGHT_STYLES[globbing]="fg=${GRUVBOX_BLUE_SOFT}"
  ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=${GRUVBOX_RED_HARD},bold"
  ZSH_HIGHLIGHT_STYLES[path]="fg=${GRUVBOX_BLUE_SOFT}"
  ZSH_HIGHLIGHT_STYLES[command]="fg=${GRUVBOX_ORANGE_SOFT}"
fi

# NVM
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_AUTO_USE=true
export NVM_NO_USE=true
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Homebrew paths
export PATH="/opt/homebrew/Cellar/pkgconf/2.5.1/bin:/opt/homebrew/opt/mysql-client/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/mysql-client/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql-client/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client/lib/pkgconfig"

# tmux helper function
tmux() {
  if [ "$1" = "d" ]; then
    command tmux detach
  else
    command tmux "$@"
  fi
}

# Angular CLI autocompletion
if command -v ng >/dev/null 2>&1; then
  source <(ng completion)
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
