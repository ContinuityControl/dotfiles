# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
if hash rvm-prompt 2>/dev/null; then
  local rvm_ruby='%{$fg[red]%}‹$(rvm-prompt s i v p g)›%{$reset_color%}'
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'
if type nvm >/dev/null 2>&1; then
  local node_version_prompt=' %{$fg[green]%}‹node-$(nvm current 2>/dev/null)›%{$reset_color%} '
elif type node >/dev/null 2>&1; then
  local node_version_prompt=' %{$fg[green]%}‹node-$(node --version)›%{$reset_color%} '
else
  local node_version_prompt=''
fi

PROMPT="╭ ${user_host} ${current_dir} ${rvm_ruby}${node_version_prompt}${git_branch} \$BUNDLE_GEMFILE
╰ %B$%b "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
