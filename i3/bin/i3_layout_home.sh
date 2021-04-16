#!/bin/sh
xrandr --output DP-1-3 --mode 1920x1200 --pos 0x0 --rotate normal \
       --output eDP-1 --primary --mode 1920x1080 --pos 0x1200 --rotate normal \
       --output DP-1-1 --mode 1920x1080 --pos 1920x120 --rotate normal \
       --output DP-1-2 --off \
       --output HDMI-2 --off \
       --output HDMI-1 --off \
       --output DP-3 --off \
       --output DP-2 --off \
       --output DP-1 --off

# Update workspace locations
lead="# MONITORS"
end="# MONITORS END"
i3_config_path="$HOME/.i3/config"
TEXT=\
'set $laptopMonitor eDP-1\
set $firstMonitor DP-1-3\
set $secondMonitor DP-1-1\
\
workspace $ws1 output $firstMonitor\
workspace $ws2 output $firstMonitor\
workspace $ws4 output $firstMonitor\
workspace $ws5 output $firstMonitor\
workspace $ws7 output $firstMonitor\
workspace $ws8 output $firstMonitor\
\
workspace $ws3 output $secondMonitor\
workspace $ws6 output $secondMonitor\
workspace $ws9 output $secondMonitor\
\
workspace $ws10 output $laptopMonitor'

sed -i -e "/^${lead}/,/^${end}/c\
${lead}\\
${TEXT}\\
${end}" ${i3_config_path} 

i3-msg restart
