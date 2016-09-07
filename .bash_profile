# DO NOT MODIFY THIS FILE, MODIFY THE .bashrc FILE INSTEAD

# Get the current install directory (For running scripts)
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
INSTALL_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Use the bashrc as the source of truth
source $INSTALL_DIR/.bashrc
