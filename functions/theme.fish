function theme
    if type -q "wezterm"
        set -gx current_theme (printf "gruvbox\ncatppuccin" | fzf-tmux -p)
        echo $current_theme > ~/.config/wezterm/current_theme && echo "Current theme set to $current_theme"
    else
        echo "Wezterm is not installed"
    end
end
