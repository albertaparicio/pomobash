#!/bin/bash

# Terminal-based Pomodoro Technique chronometer

# Pomodoro time (in minutes)
#POMO=25
echo "Introduce desired Pomodoro time: "
read POMO
POMO_M=$(( $POMO*60 ))

# In-between-pomo time (in minutes)
#BREAK=5
echo "Introduce desired short break time: "
read BREAK
BREAK_M=$(( $BREAK*60 ))

# Long break time (in minutes)
#LBREAK=15
echo "Introduce desired long break time: "
read LBREAK
LBREAK_M=$(( $LBREAK*60 ))

# Pomodoro in action, in sets of 4 Pomodoros
echo "Pomodoro running...
"
sleep $POMO_M && notify-send "break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $BREAK_M && notify-send "back to work" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga
sleep $POMO_M && notify-send "break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $BREAK_M && notify-send "back to work" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga
sleep $POMO_M && notify-send "break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $BREAK_M && notify-send "back to work" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga
sleep $POMO_M && notify-send "break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $LBREAK_M && notify-send "back to work"
