set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",xterm-256color:RGB"

set -g prefix C-a
unbind C-b
bind-key C-s send-prefix

unbind %
unbind '"'
bind v split-window -h
bind - split-window -v

unbind r
bind r source-file ~/.tmux.conf

bind -r j resize-pane -D 10
bind -r k resize-pane -U 10
bind -r l resize-pane -R 10
bind -r h resize-pane -L 10

bind -r m resize-pane -Z

# use mouse to resize windows
set -g mouse on

# use vi settings in tmux
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection
unbind -T copy-mode-vi MouseDragEnd1Pane

set -g status-position bottom

# tpm plugin
set -g @plugin 'tmux-plugins/tpm'

# plugins
set -g @plugin 'wfxr/tmux-power'

set -g @plugin 'Nybkox/tmux-kanagawa'
set -g @kanagawa-theme 'dragon'
set -g @kanagawa-ignore-window-colors true
set -g @kanagawa-show-powerline true
set -g @kanagawa-plugins "cpu-usage time"
set -g @kanagawa-military-time true
set -g @kanagawa-time-format "%a %m/%d %H:%M"

# set -g @plugin 'christoomey/vim-tmux-navigator'
# set -g @plugin 'tmux-plugins/tmux-resurrect'
#
# set -g @plugin 'tmux-plugins/tmux-continuum'
# set -g @continuum-restore 'on'
# set -g @continuum-save-internal '15'

# set -g @plugin 'egel/tmux-gruvbox'
# set -g @tmux-gruvbox 'material'


# Better pane switching with vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
  | grep -iqE '^[^TXZ ]+ +(n?vim)'"

bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"

# init TMUX plugin manager
run '~/.tmux/plugins/tpm/tpm'

# set status bar custom
# dark gray - #3a3a3a
# light gray - #4e4e4e
# orange - #ffaa00
# cream - #d4bd93
#  - e0c6
#  - e0c7

# set -g status-right "\
# #[bg=#4e4e4e,fg=#3a3a3a]\
# #[bg=#4e4e4e,fg=#ffaa00] %Y-%m-%d \
# #[bg=#4e4e4e,fg=#3a3a3a]\
# #[bg=#3a3a3a,fg=#4e4e4e]  \
# #[bg=#3a3a3a,fg=#ffaa00]\
# #[bg=#ffaa00,fg=#4e4e4e] %H:%M \
# #[bg=#ffaa00,fg=#4e4e4e]\
# #[bg=#3a3a3a,fg=#4e4e4e]  \
# #[fg=#d4bd93,bg=#3a3a3a]\
# #[bg=#d9bd98,fg=#4e4e4e] #H #[default]"
