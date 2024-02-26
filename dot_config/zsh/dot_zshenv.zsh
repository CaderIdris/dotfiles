export HISTFILE="$HOME/.local/share/zsh/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000
setopt INC_APPEND_HISTORY

export EDITOR='nvim'

export PATH="$PATH:$HOME/.local/bin"

export PIPX_HOME=/opt/pipx
export PIPX_BIN_DIR=/usr/local/bin

export AZURE_CONFIG_DIR="$HOME/.az/Empirisys"

export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8
export LANG=en_GB.UTF-8

AUTO_NOTIFY_IGNORE+=("vifm")
AUTO_NOTIFY_IGNORE+=("zathura")
AUTO_NOTIFY_IGNORE+=("chezmoi")
