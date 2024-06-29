#!/bin/bash
ayu_black='#01060e'
ayu_bg='#0a0e14'
ayu_blue='#53bdfa'
ayu_yellow='#f9af4f'
ayu_red='#ea6c73'
ayu_white='#c7c7c7'
ayu_green='#91b362'
ayu_visual_grey="#607080"
ayu_comment_grey="#5c6773"
ayu_purple="#d2a6ff"
ayu_magenta='#fae994'
ayu_cyan='#90e1c6'
ayu_mirage_bg="#1f2430"
ayu_orange="#ff8f40"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -g "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -g "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$ayu_white"
set "message-bg" "$ayu_black"

set "message-command-fg" "$ayu_white"
set "message-command-bg" "$ayu_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$ayu_black"
setw "window-status-bg" "$ayu_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$ayu_black"
setw "window-status-activity-fg" "$ayu_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$ayu_comment_grey"
set "window-active-style" "fg=$ayu_white"

set "pane-border-fg" "$ayu_white"
set "pane-border-bg" "$ayu_black"
set "pane-active-border-fg" "$ayu_green"
set "pane-active-border-bg" "$ayu_black"

set "display-panes-active-colour" "$ayu_yellow"
set "display-panes-colour" "$ayu_blue"

bar_bg_color="$ayu_mirage_bg"
set "status-bg" "$bar_bg_color"
set "status-fg" "$ayu_white"

set "@prefix_highlight_fg" "$ayu_black"
set "@prefix_highlight_bg" "$ayu_green"
set "@prefix_highlight_copy_mode_attr" "fg=$ayu_black,bg=$ayu_green"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@ayu_widgets")
time_format=$(get "@ayu_time_format" "%R")
date_format=$(get "@ayu_date_format" "%d.%m.%Y")

status_right_color="$ayu_orange"
status_right_fg="$ayu_black"
set "status-right" "#[fg=$status_right_color,bg=$bar_bg_color,nobold,nounderscore,noitalics]#[fg=$status_right_fg,bg=$status_right_color,bold] #h "

session_bg="$ayu_blue"
session_fg="$ayu_mirage_bg"
session_icon=""

status_left=""
set "status-left" "#[fg=$session_fg,bg=$session_bg,bold] $session_icon  #S #{prefix_highlight}#[fg=$session_bg,bg=$bar_bg_color,nobold,nounderscore,noitalics]"


inactive_window_fg="$ayu_comment_grey"
set "window-status-format" "#[fg=$bar_bg_color,bg=$bar_bg_color,nobold,nounderscore,noitalics]#[fg=$inactive_window_fg,bg=$bar_bg_color] #I 󰿟 #W #[fg=$bar_bg_color,bg=$bar_bg_color,nobold,nounderscore,noitalics]"

current_window_bg="$ayu_mirage_bg"
current_window_fg="$ayu_purple"
set "window-status-current-format" "#[fg=$current_window_bg,bg=$bar_bg_color,nobold,nounderscore,noitalics]#[fg=$current_window_fg,bg=$current_window_bg,nobold] #I   #W #[fg=$current_window_bg,bg=$bar_bg_color,nobold,nounderscore,noitalics]"
