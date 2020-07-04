# Dual monitor setup with a 21:9 LG Monitor and the built-in screen of the laptop
xrandr --output eDP-1-1 --mode 1366x768 --rate 60.00 --output HDMI-0 --mode 2560x1080 --rate 60.00 --primary --right-of eDP-1-1

xrandr --output eDP-1-1 --brightness 0.5

# Just putting a wallpaper
feh --bg-fill ~/Pictures/wallpapers/wallpaper.jpg &

killall -q polybar
# Launch bar1 and bar2 (using polybar-theme-12)
polybar main -c ~/.config/polybar/config.ini &

# For transparency
compton

