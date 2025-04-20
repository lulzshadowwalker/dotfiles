# Init Oh My Posh (make sure it's installed via brew)
if type -q oh-my-posh
    oh-my-posh init fish --config $HOME/dev/mytheme.omp.json | source
end

# Editor
set -gx EDITOR nvim

# PATH modifications (only add unique + necessary ones)
set -gx PATH /opt/homebrew/opt/postgresql@16/bin $PATH
set -gx PATH /opt/homebrew/Cellar/zplug/2.4.2/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/sbin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH /System/Cryptexes/App/usr/bin $PATH
set -gx PATH /usr/bin $PATH
set -gx PATH /bin $PATH
set -gx PATH /usr/sbin $PATH
set -gx PATH /sbin $PATH
set -gx PATH /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin $PATH
set -gx PATH /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin $PATH
set -gx PATH /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin $PATH
set -gx PATH /Library/Apple/usr/bin $PATH
set -gx PATH $HOME/.pub-cache/bin $PATH
set -gx PATH $HOME/dev/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/go/bin $PATH
set -gx PATH $HOME/flutter/bin $PATH
set -gx PATH /usr/local/go/bin $PATH
set -gx PATH $HOME/.console-ninja/.bin $PATH
set -gx PATH "$HOME/Library/Application Support/Herd/bin" $PATH

# Herd PHP ini paths
set -gx HERD_PHP_84_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/84/"
set -gx HERD_PHP_83_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/83/"
set -gx HERD_PHP_82_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/82/"
set -gx HERD_PHP_81_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/81/"
set -gx HERD_PHP_74_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/74/"

# Abbreviations
abbr rc 'nvim ~/.config/fish/config.fish'
abbr so 'source ~/.config/fish/config.fish'
abbr art 'php artisan'
abbr fresh 'php artisan migrate:fresh --seed'
abbr vim 'nvim'
abbr tinker 'php artisan tinker'
abbr love '$HOME/dev/bin/love.app/Contents/MacOS/love'
abbr cat 'bat'
abbr v 'broot -h'

# Goose commands with env vars
function migrate
    env GOOSE_DBSTRING="postgresql://..." GOOSE_DRIVER=postgres GOOSE_MIGRATION_DIR=./internal/psql/migration/ goose $argv
end

function seed
    env GOOSE_DBSTRING="postgresql://..." GOOSE_DRIVER=postgres GOOSE_MIGRATION_DIR=./internal/psql/seeder/ goose $argv
end

starship init fish | source

set -g fish_color_autosuggestion brgrey
set -g fish_color_command blue
set -g fish_color_keyword green
