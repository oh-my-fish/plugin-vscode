# SYNOPSIS
#   code [file ...]       edit the given files
#   code [directory ...]  open the given directories
#

function code -d "Visual Studio Code"
  echo "The `vscode` Oh My Fish plugin is deprecated!
Since Visual Studio Code 1.0 the command `code` is natively available.
You can safely `omf remove vscode` to use the native command.
See https://code.visualstudio.com/docs/editor/setup for more information."

  set -lx VSCODE_CWD $PWD
  
  if begin; which code > /dev/null 2>&1; and test -x (which code); end
    command code $argv
  else if test -d "/Applications/Visual Studio Code.app"
    open -n -b "com.microsoft.VSCode" --args $argv
  else if test -d "$HOME/.local/share/umake/ide/visual-studio-code"
    command ~/.local/share/umake/ide/visual-studio-code/Code $argv
  else
    echo "No Visual Studio Code installation found" >&2
    return 1
  end
end
