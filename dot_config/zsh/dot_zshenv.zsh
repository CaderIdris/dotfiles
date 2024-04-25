export HISTFILE="$HOME/.local/share/zsh/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000
setopt INC_APPEND_HISTORY

export EDITOR='nvim'

export PATH="$PATH:$HOME/.local/bin:$HOME/.opam/default/bin/"

export PIPX_HOME=/opt/pipx
export PIPX_BIN_DIR=/usr/local/bin

export AZURE_CONFIG_DIR="$HOME/.az/Empirisys"

export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8
export LANG=en_GB.UTF-8

export OPENAI_API_KEY=$(pass show keys/openai/idris_playground)

export AUTO_NOTIFY_ICON_SUCCESS="$HOME/.config/zsh/icons/celebrate.png"
export AUTO_NOTIFY_ICON_FAILURE="$HOME/.config/zsh/icons/clown.png"
export AUTO_NOTIFY_TITLE="%command"
export AUTO_NOTIFY_BODY="Time taken: %elapsed seconds\nExit code: %exit_code"

AUTO_NOTIFY_IGNORE+=("vifm")
AUTO_NOTIFY_IGNORE+=("zathura")
AUTO_NOTIFY_IGNORE+=("chezmoi")

