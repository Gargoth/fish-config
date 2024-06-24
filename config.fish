# Bootstrap fish plugins
if not type -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
end

if not type -q nvm
    fisher install jorgebucaran/nvm.fish
end

# OS-specific configuration
switch (uname)
    case Linux
        # WSL
        abbr --add pc 'cd /mnt/c/Users/Gargo'
        abbr --add here 'explorer.exe .'
        abbr --add open wslview
    case Darwin
        # MacOs
        abbr --add tailscale '/Applications/Tailscale.app/Contents/MacOS/Tailscale'
        abbr --add sshpc 'ssh -t gargo@gargoth-acer \'ssh gargoth@localhost -p 2022\''
        alias python="python3.11"     # To get around janky pip installs
    case '*'
end

# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT 1

# Set to vi mode
fish_vi_key_bindings

# Set environment variables
set -x EDITOR nvim
set -x CLICOLOR 1
set -x HOME ~

# Functions
function dfzf
    cd (dirname (fzf-tmux -p))
end

function v
    set -l file (fd --type f --hidden -E "{.git,node_modules}" | fzf-tmux -p)
    if test $file
        nvim $file
    else
        echo "No file selected."
    end
end

function config
    if test $argv
        cd ~/.config/$argv
    else
        cd (ls -d ~/.config/*/ | fzf-tmux -p)
    end
end

function repos
    if test $argv
        cd ~/repos/$argv
    else
        cd (ls -d ~/repos/*/ | fzf-tmux -p)
    end
end

function c
    gcc $argv
    ./a.out
end

function cpp
    clang++ $argv
    ./a.out
end

function gh-starred
    gh api user/starred --template '{{range .}}{{.full_name|color "yellow"}} ({{timeago .updated_at}}){{"\n"}}{{end}}'
end

function gsw
    git branch | fzf-tmux -p | xargs git switch
end

function gch
    git branch -r | fzf-tmux -p | xargs git checkout
end

# Abbreviations
abbr --add ls 'eza --color=always --group-directories-first --icons'
abbr --add la 'eza -a --color=always --group-directories-first --icons'
abbr --add ll 'eza -l --color=always --group-directories-first --icons'
abbr --add lt 'eza -T --color=always --group-directories-first --icons --ignore-glob="node_modules|venv"'
abbr --add ldir 'eza -d --color=always --group-directories-first --icons'
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
abbr --add sfish 'source ~/.config/fish/config.fish'
abbr --add .. 'cd ..'
abbr --add ... 'cd ...'
abbr --add .... 'cd ....'


# App Shell Integrations
if type -q starship
    starship init fish | source
end

if type -q zoxide
    zoxide init fish | source
end

if type -q fzf
    fzf --fish | source
end

if type -q gh
  gh completion -s fish | source
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# direnv
if type -q direnv
    direnv hook fish | source
end
