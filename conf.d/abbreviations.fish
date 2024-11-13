# eza
abbr --add ls 'eza --color=always --group-directories-first --icons'
abbr --add la 'eza -a --color=always --group-directories-first --icons'
abbr --add ll 'eza -l --color=always --group-directories-first --icons'
abbr --add lt 'eza -T --color=always --group-directories-first --icons --ignore-glob="node_modules|venv"'
abbr --add ldir 'eza -d --color=always --group-directories-first --icons'

# git
abbr --add gs 'git status'
abbr --add ga 'git add'
abbr --add ga. 'git add .'
abbr --add gc 'git commit'
abbr --add gf 'git fetch'
abbr --add gps 'git push'
abbr --add gpl 'git pull'
abbr --add gd 'git diff'
abbr --add gr 'git restore'
abbr --add gl "git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%an%C(reset)%C(bold yellow)%d%C(reset) %C(dim white)- %s%C(reset)' --all"
abbr --add gswc 'git switch -c'

# fish
abbr --add sfish 'source ~/.config/fish/**/*.fish'

# tmux
abbr --add tm 'tmux'
abbr --add tma 'tmux a'
abbr --add tmks 'tmux kill-server'
abbr --add tms 'tmux list-sessions'
