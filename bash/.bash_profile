#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

. "$HOME/.local/bin/env"
# Add .NET Core SDK tools
export PATH="$PATH:/home/georg/.dotnet/tools"
