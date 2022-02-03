set -U fish_greeting

# General key bindings
bind \ef nextd-or-forward-word
bind \eb prevd-or-backward-word

# Set bat as man pager
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# FZF options
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git --exclude node_modules'
set -gx FZF_DEFAULT_OPTS '--height 50% --layout=reverse --border --info=inline --marker="*" --bind "ctrl-y:execute(echo {+} | wl-copy)" --bind "ctrl-a:select-all" --bind "?:toggle-preview"'
set fzf_history_opts --sort --exact --history-size=30000
set fzf_fd_opts --hidden --follow --exclude=.git
set fzf_preview_dir_cmd exa --all --color=always

fzf_configure_bindings --git_status=\e\cs --history=\cr --variables --git_log=\e\cl --directory=\cp

if test -e $HOME/.config/fish/functions/secret.fish
    source $HOME/.config/fish/functions/secret.fish
end

# Aliases
alias c="clear"
alias cat="bat"
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias ll='exa -la --git --icons'
alias logme="script -f /tmp/(date)+\"%d-%b-%y_%H-%M-%S\"_shell.log"
alias ls='exa'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'