# zzz

`zzz` is a command line tool to blank your Mac display without putting the machine to sleep. It is the cli equivalent of [Control–Shift–Eject](https://support.apple.com/en-us/HT201236). ***macOS only***.

> **Why not just use ⌃⇧⏏ ?**
> 
> If you can physically press the keys, then by all means do that. However, `zzz` is intended for applications where the user is not within reach of the physical machine e.g. remote ssh.

## Try

`curl -sL file.efmeeks.net/zzz/zzz.sh | bash`

## Get
`bash <(curl -sL file.efmeeks.net/zzz/zzz.sh) install`

## Usage
```text
  Usage
    zzz [option] command
  
  Options
    [p]ath PATH   | Set $ipath for install command (default: /usr/local/bin)
  
  Commands
    [h]elp        | Show help message
    [s]leep       | Sleep display (default)
    [i]nstall     | Make \`zzz\` a command in your \$PATH
    [u]ninstall   | Remove \`zzz\`


```