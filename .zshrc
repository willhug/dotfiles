# Smart AutoCompletion
autoload -Uz compinit
compinit

echo $( dirname "${BASH_SOURCE[0]}" ) 
echo $( cd "$( dirname "${(%):-%N}" )" && pwd )
file="${(%):-%N}"

echo $file

# Load shared shell setup
source shared_shell_setup
