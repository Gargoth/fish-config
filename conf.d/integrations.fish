# App Shell Integrations
if type -q starship
    starship init fish | source
end

if type -q zoxide
    zoxide init fish | source
end

if type -q fzf
    fish_user_key_bindings
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
