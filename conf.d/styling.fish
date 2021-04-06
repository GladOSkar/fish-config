#!/usr/bin/env fish

set fish_greeting

if status is-interactive
	tabs 4
end


set -g fish_color_command BF5
set -g fish_color_quote FD5
set -g fish_color_redirection FFF
set -g fish_color_end E7F
set -g fish_color_error F33
set -g fish_color_operator E7F
set -g fish_color_escape FC4
set -g fish_color_param FFF
set -g fish_color_autosuggestion 6AF
set -g fish_color_match 6FF
set -g fish_color_comment 888
set -g fish_color_selection 888 --bold --background=444
set -g fish_color_search_match 888 --background=444

set -g fish_pager_color_description FD5 yellow
set -g fish_pager_color_prefix white --bold
set -g fish_pager_color_progress brwhite --background=07F

# I think not needed but we'll see?
#set -g fish_color_normal normal
#set -g fish_color_valid_path --underline
#set -g fish_color_history_current --bold
#set -g fish_pager_color_completion normal



function _tide_item_emoji
	echo '🐑'
end


set -g tide_left_prompt_items 'context'  'pwd'  'git'  'newline'  'emoji'  'prompt_char'
set -g tide_right_prompt_items  'status'  'cmd_duration'  'jobs'


set -g tide_context_bg_color 555
set -g tide_context_always_display true
set -g tide_context_default_color FD5

set -g tide_pwd_bg_color 6AF
set -g tide_pwd_color_dirs 555
set -g tide_pwd_color_anchors 555

set -g tide_git_bg_color BF5
set -g tide_git_branch_color 555

set -g tide_prompt_char_icon ''

set -g tide_emoji_bg_color 555


set -g tide_status_success_bg_color 555
set -g tide_status_success_color BF5
set -g tide_status_failure_bg_color 555
set -g tide_status_failure_color F54
set -g tide_status_always_display true

set -g tide_cmd_duration_bg_color FD5

set -g tide_jobs_bg_color 555
set -g tide_jobs_color 6FF
