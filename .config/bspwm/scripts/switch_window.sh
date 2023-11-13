WIN_NAME="$(wmctrl -l | sed -r 's/^(\w+\s+)(\w+\s+)(\w+\s+)//' | dmenu -l 100 -nb '#ffffff' -nf '#000000' -sf '#ffffff' -sb '#000000'  -fn 'fira code' -i -p "$(echo ""$(date +'%T %d-%m-%y (%a)')" | "$(cat /sys/class/power_supply/BAT0/uevent | grep 'CAPACITY=' | sed -r 's/.+=//')"bat | "$(free -m | tail -n +2 | head -n 1 | grep -o -E '\w+$')" MB")")"

if [ "$WIN_NAME" ]
then
    wmctrl -a "$WIN_NAME"
fi
