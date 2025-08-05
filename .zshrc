# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

# nnonne configuration start

# Message of The Day
code_motd() {
  # echo ""
  echo "$(tput setaf 4)CODE LIKE YOU MEAN IT"
  echo ""
  echo "$(tput setaf 7)AI is your ally, not your crutch."
  echo ""
  echo "$(tput setaf 6)    - Guide it like a senior dev: $(tput setaf 7)ask ‘why?’ before copying."
  # echo ""
  echo "$(tput setaf 6)    - Own the code: $(tput setaf 7)Break AI’s output, rewrite it worse, then fix it."
  # echo ""
  echo "$(tput setaf 6)    - Start stupid small: $(tput setaf 7)A button, a log, a tiny win."
  # echo ""
  echo "$(tput setaf 6)    - Guilt is useless: $(tput setaf 7)Pros copy-paste too—but they choose what to steal."
  echo ""
  echo "Today’s challenge:"
  echo ""
  echo "    - $(tput setaf 6)Write one $(tput setaf 7)function $(tput setaf 6)from scratch."
  # echo ""
  echo "    - $(tput setaf 6)Debug one $(tput setaf 7)thing $(tput setaf 6)manually."
  # echo ""
  echo "    - $(tput setaf 6)Ship ‘good enough’ $(tput setaf 7)and $(tput setaf 6)iterate."
  echo ""
  echo "$(tput setaf 4)You’re not cheating—you’re curating."
  echo ""
  echo "Now go build something yours."
  echo "https://chat.deepseek.com/a/chat/s/68b04239-295f-4700-a526-0ed0d608a610"
}

# display motd on opening terminal
code_motd

# modifying clear to clear terminal then display the motd
# clear() {
#   command clear
#   code_motd
# }

# to enable modifying .zshrc from anywhere
nzsh() {
  nvim ~/.zshrc
}

gitpass() {
  cat ~/Codingan/github-recovery/github-gitpushtoken.txt | xclip -selection clipboard
}

# to enable sourcing .zshrc from anywhere
szsh() {
  source ~/.zshrc
  clear
}

stacon() {
    conda activate
}

stocon() {
    conda deactivate
}


# Terminal and editor setting
export TERMINAL="kitty"
export EDITOR="nvim"

# Flutter path
export PATH="/mnt/harddrive/Development/flutter/bin:$PATH"

# Android SDK path
# export PATH="/mnt/hdd/Development/Android/Sdk:$PATH"
export PATH="/mnt/harddrive/Development/Android/Sdk/platform-tools:$PATH"
export PATH="/mnt/harddrive/Development/Android/Sdk/cmdline-tools/latest/bin/:$PATH"
export PATH="/mnt/harddrive/Development/Android/Sdk/emulator:$PATH"

# Java stuff
# export JAVA_HOME="/usr/lib/jvm/java-23-openjdk"
# export PATH="$JAVA_HOME/bin:$PATH"
# export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
# export PATH="$JAVA_HOME/bin:$PATH"
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
export PATH="$JAVA_HOME/bin:$PATH"
# export PATH="/usr/bin/netbeans:$PATH"

# starship setup
eval "$(starship init zsh)"

# df stuff
alias df="duf"

# bat stuff
alias cat="bat"

# mise activation
eval "$(mise activate zsh)"

# eza stuff
alias ls="eza -h --color=always --long --git --icons=always --no-user"

# zoxide stuff
eval "$(zoxide init zsh)"
alias cd="z"

# ncdu stuff 
alias du="ncdu"

# fzf setup
source <(fzf --zsh)
# Example FZF customizations (add these to your .bashrc or .zshrc)
export FZF_DEFAULT_OPTS='
  --color fg:#5d6466,bg:#1e2527
  --color bg+:#ef7d7d,fg+:#2c2f30
  --color hl:#dadada,hl+:#26292a,gutter:#1e2527
  --color pointer:#373d49,info:#606672
  --border
  --color border:#1e2527
  --height 13'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height 40% --layout=reverse --border --ansi --prompt='fzf> ' --pointer='➜'"

# Example for previewing files with 'bat' (install bat if you don't have it: sudo apt install bat)
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview 'bat --color=always --line-range :100 {}'"

# Customize Ctrl+T to use 'fd' (requires fd-find: sudo apt install fd-find)
export FZF_CTRL_T_COMMAND="fd --type f --max-depth 2 --hidden --glob --follow --exclude .git"

# Customize Alt+C to use 'fd' for directories
export FZF_ALT_C_COMMAND="fd --type d --max-depth 2 --hidden --glob --follow --exclude .git"

# FZF commands
# pj() {
#   local dir
#   dir=$(find ~/Codingan/ -maxdepth 2 -type d 2>/dev/null | sed 's|^/home/.*/Codingan/||' | fzf --exact --height 40% --reverse --preview 'ls -l --color=always ~/Codingan/{}' --prompt="My Projects > ") && cd ~/Codingan/"$dir" && clear
# }


pj() {
  local dir
  dir=$(fd --max-depth 2 --type d --base-directory ~/Codingan 2>/dev/null | sed 's|^/home/.*/Codingan/||' | fzf --exact --height 40% --reverse --preview 'ls -l --color=always ~/Codingan/{}' --prompt="My Projects > ") && cd ~/Codingan/"$dir" && clear
}



# Chrome for flutter dev
export CHROME_EXECUTABLE="/usr/bin/brave-browser"

# kitty layouting
codemode() {
  selected_folders=$(find ~/Codingan/ -maxdepth 3 -type d -not -path '*/.*' | sed 's|^/home/.*/Codingan/||' | fzf --multi --exact --preview 'ls -l --color=always ~/Codingan/{}' --prompt="Select folders to open in tabs: ")

  if [[ -n "$selected_folders" ]]; then
    echo "$selected_folders" | while read -r folder; do
      kitty @ launch --keep-focus --cwd="~/Codingan/$folder" --type=tab --title="$(basename "$folder")"
    done
  fi

  kitty @ close-tab --self
}

# Romaji input
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=fcitx

# pathing
export PATH=$HOME/.local/bin:$PATH

# dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
