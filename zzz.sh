#!/bin/bash
# zzz
# https://git.efmeeks.net/zzz
# ███████████████████████████████████
# ███████████████████████████████████
# ████ ▄▄▄▄▄ █ ██▀▀█▀▄▄█ ▄▄▄▄▄ ██████
# ████ █   █ █  ▀█ ▀▀█▄█ █   █ ██████
# ████ █▄▄▄█ █▀  █▄█▀▄ █ █▄▄▄█ ██████
# ████▄▄▄▄▄▄▄█▄█ ▀▄█▄█▄█▄▄▄▄▄▄▄██████
# ████▄▄▀▀  ▄███▄█▄▄  ███▄▀ ▄ ▄██████
# ████ █▀█▀▀▄ ▄ ▄█▀▄█ ▄▄  █  ████████
# ████   ▀█▀▄▄▀█▀▄▀▄ ▀  ▄▄▀▀ ████████
# ██████▀▀▄ ▄█▀▄  ▄ ▄ █▄▀ █▄▀█▀██████
# ████▄▄▄▄▄▄▄█ ▀ █▄ ▀█ ▄▄▄ ▀▄▄▄██████
# ████ ▄▄▄▄▄ █▀███▀█▀█ █▄█ █ ▀███████
# ████ █   █ █▄ ▀▄▀▄▄█ ▄  ▄▀▄  ██████
# ████ █▄▄▄█ █▀▄▀ ▄ ▄▀█▄  █▄▀ ███████
# ████▄▄▄▄▄▄▄█▄▄▄█▄▄█▄██████▄▄▄██████
# ███████████████████████████████████
# ███████████████████████████████████

help() {
  cat << eof

  zzz

  Usage
    zzz [option] command
  
  Options
    [p]ath PATH   | Set $ipath for install command (default: /usr/local/bin)
  
  Commands
    [h]elp        | Show help message
    [s]leep       | Sleep display (default)
    [i]nstall     | Make \`zzz\` a command in your \$PATH
    [u]ninstall   | Remove \`zzz\`

eof
exit
}

setpath() {
  [ -d "$1" ] && local ipath="$1"
  install
}

zzz() {
  pmset displaysleepnow
  clear
  exit
}

install() {
  if [ -n "$(which zzz)" ]; then
    echo "zzz is already installed at $(which zzz)"
  else
    [ -z "$ipath" ] && ipath="/usr/local/bin"
    curl -sL file.efmeeks.net/zzz/zzz.sh -o "$ipath/zzz"
    chmod +x "$ipath/zzz"
    [ -z "$(which zzz)" ] && echo "Make sure $ipath is in your \$PATH" || echo "zzz installed"
  fi
  exit
}

uninstall() {
  upath="$(which zzz)"
  if [ -z "$upath" ]; then
    echo "Can't seem to find zzz in your \$PATH"
    exit
  else
    echo "Remove $upath? [y/N]"
    while read sure; do
      [ "$sure" == "y" -o "$sure" == "yes" -o -z "$sure" ] && rm "$upath" && echo "zzz uninstalled"
      exit
    done
  fi
  exit
}

[ "$(uname)" != "Darwin" ] && echo "Sorry, this tool is Mac-only." && exit
[ "$1" == "h" -o "$1" == "help" ] && help
[ "$1" == "p" -o "$1" == "path" ] && setpath "${@:2}"
[ "$1" == "i" -o "$1" == "install" ] && install
[ "$1" == "u" -o "$1" == "uninstall" ] && uninstall
[ "$1" == "s" -o "$1" == "sleep" ] && zzz || zzz
