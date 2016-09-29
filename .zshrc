# Smart AutoCompletion
autoload -Uz compinit
compinit

# Get the current install directory (For running scripts)
SOURCE="${(%):-%N}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
export DOTFILES_INSTALL_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Increase the history size
HISTSIZE=130000 SAVEHIST=130000

# Load shared shell setup
source $DOTFILES_INSTALL_DIR/shared_shell_setup

# Load the zsh prompt setup

source $DOTFILES_INSTALL_DIR/zsh_prompt

# Load local settings
if [ -e "$HOME/.zsh_local" ]
then
  source $HOME/.zsh_local
fi
