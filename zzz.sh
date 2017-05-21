#!/bin/bash

cat <<'END'
  ________  ________  ________     
 |\_____  \|\_____  \|\_____  \    
  \|___/  /|\|___/  /|\|___/  /|   
     /  / /    /  / /    /  / /   
    /  /_/__  /  /_/__  /  /_/__  
   |\________\\________\\________\
    \|_______|\|_______|\|_______|

        Ambien for macOS
        
        2017 Eric Meeks
        www.efm.io

Sleeps your Mac display, but not your Mac.
Equivalent to Control–Shift–Eject.

END

ZZZ=`which zzz`

PS3="Enter 1, 2, 3 or 4: "
options=("Sleep display now" "Install Zzz" "Uninstall Zzz" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Sleep display now")
            pmset displaysleepnow
            break
            ;;
        "Install Zzz")
            [ ! -f /usr/local/bin/zzz ] && echo "pmset displaysleepnow; clear" > /usr/local/bin/zzz; chmod +x /usr/local/bin/zzz; echo "Install complete. Run zzz to sleep your display"; break || echo "Zzz already installed"
            break
            ;;
        "Uninstall Zzz")
            [ -x $ZZZ ] && rm $ZZZ; echo "Uninstall complete."; break || echo "Zzz not currently installed"
            break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done