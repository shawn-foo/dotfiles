# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below. if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
if [[ -r "${XDG_CACHE_HOME:-$Home/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]];
then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.tmuxifier/bin:$PATH"

# set the directary for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

#download zinit if it is not there yet
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# source thingy and load zinit
source "${ZINIT_HOME}/zinit.zsh"

# add in powerlevel 10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# add other zinit plugins. 
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# add  in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# keybinding vim
#zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
bindkey -v
bindkey -M vicmd 'k' history-search-backward
bindkey -M vicmd 'j' history-search-forward

#history
HISTFILE=$HOME/.zhistory
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_ignore_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
LS_COLORS=$(dircolors -b)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# for completion with color
alias ls='ls --color'
# aliases
alias nvim='nvim'
alias c='clear'
alias cat="bat"
alias eza="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias build=~/build.sh
alias run=~/run.sh
alias cp=~/cp.sh
alias skibidi="tmuxifier load-session skibidi"
alias rustycrab="tmuxifier load-session game"
alias greed="python /home/foojw/Documents/shawn/apps/greed/greed.py"
alias gay="npx supabase gen types --lang=typescript --local > database.types.ts"
alias die="tmux kill-server"
alias testtest="echo '$1'"

# shell intergrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval $(thefuck --alias)
eval "$(tmuxifier init -)"

setxkbmap -option 'caps:escape_shifted_capslock'


# Path to your scripts folder
SCRIPTS_DIR="$HOME/scripts"

# Ensure the scripts folder exists
if [[ -d "$SCRIPTS_DIR" ]]; then
  for script in "$SCRIPTS_DIR"/*; do
    # Check if it's a file and executable
    if [[ -f "$script" && -x "$script" ]]; then
      # Extract the filename without the extension
      alias_name=$(basename "$script" | sed 's/\.[^.]*$//')
      # Create an alias for the script
      alias "$alias_name"="$script"
    fi
  done
fi

# Created by `pipx` on 2025-01-17 07:12:39
export PATH="$PATH:/home/foojw/.local/bin"
