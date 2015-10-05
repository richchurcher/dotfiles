alias dp1='xrandr --output DP1 --mode 1920x1080 --right-of eDP1'
alias hdmi1='xrandr --output HDMI1 --mode 1920x1080 --right-of DP1'
alias edp1='xrandr --output eDP1 --mode 1366x768 --right-of HDMI1'
alias wifiscan="sudo iwlist wlan0 scanning | egrep 'Cell |Encryption|Quality|Last beacon|ESSID'"
alias volfull="amixer -q -D pulse sset Master 100%"
alias volhalf="amixer -q -D pulse sset Master 50%"
alias mute="amixer -q -D pulse sset Master 0%"

