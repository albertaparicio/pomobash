#!/bin/bash

# Terminal-based Pomodoro Technique chronometer

# Number of pomodoros in each cycle
echo "Introduce desired Pomo count: "
read POMO_NUM

# Pomodoro time (in minutes)
#POMO=25
echo "Introduce desired Pomodoro time (in minutes): "
read POMO_TIME
#POMO_M=$(( $POMO_TIME*60 ))
POMO_M=$POMO_TIME

# In-between-pomo time (in minutes)
#BREAK=5
echo "Introduce desired short break time (in minutes): "
read BREAK
#BREAK_M=$(( $BREAK*60 ))
BREAK_M=$BREAK

# Long break time (in minutes)
#LBREAK=15
echo "Introduce desired long break time (in minutes): "
read LBREAK
#LBREAK_M=$(( $LBREAK*60 ))
LBREAK_M=$LBREAK

# Pomodoro in action, in sets of the user input Pomodoros
echo "Pomodoro running...
"
for ((j=0; j< ((POMO_NUM-1));j++))
do
	sleep $POMO_M && notify-send "break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $BREAK_M && notify-send "back to work" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga
done

#sleep $POMO_M && notify-send "break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $BREAK_M && notify-send "back to work" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga
#sleep $POMO_M && notify-send "break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $BREAK_M && notify-send "back to work" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga
sleep $POMO_M && notify-send "long break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $LBREAK_M && notify-send "back to work" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga
