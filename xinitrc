xset +fp /home/mitch/usr/fonts
xrdb load /home/mitch/etc/Xresources

xmodmap ${HOME}/etc/Xmodmap
xset m 0 0
xbacklight -set 90

rm ${HOME}/.xinitrc
cd ${HOME}

tasks="xbanish clip bar bash sleep lemonbar compton"
pkill -9 $tasks -- > /dev/null 2>&1

compton --config ${HOME}/etc/config/compton.conf \
    > /dev/null 2>&1 &

feh="feh --bg-fill --no-fehbg ${HOME}/var/tmp/wall"
mpvbg="mpvbg ${HOME}/var/tmp/wall"
case "$(basename $(file -b -i -L ${HOME}/var/tmp/wall))" in

    png|jpg|jpeg) $feh ;;
    gif|webm|mp4|mkv) $mpvbg

esac > /dev/null 2>&1 &

clip --daemon &

xbanish &

bar > /dev/null 2>&1 &

while true ; do
    dwm
done > /dev/null 2>&1
