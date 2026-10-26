set -U fish_greeting ""
set -Ux EDITOR nvim
fish_add_path "$HOME/.local/share/flutter/bin"

zoxide init fish | source

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end

if status is-interactive
    fastfetch
end

starship init fish | source

set -Ux __NV_PRIME_RENDER_OFFLOAD 1
set -Ux __GLX_VENDOR_LIBRARY_NAME nvidia
