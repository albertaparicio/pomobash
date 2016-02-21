#!/bin/bash

# Terminal-based Pomodoro Technique chronometer

get_help(){
echo "pomobash (Pomobash) v0.2 ©Copyright (C) 2016 Albert Aparicio

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Pomobash source code available on GitHub
(https://github.com/albertaparicio/pomobash)

-------------------------------------------------------------------
This program can work in one of two modes:
 · Interactive mode
 · Command Line mode

In the Interactive mode, the program asks the user for the program's
parameters, and then runs the pomo sequence.

Interactive mode is activated when the user does not input any
parameters.

In the Command Line mode, the user inputs the parameters in the
command line at the time of running Pomobash, and the program runs
the pomo sequence right away.

Syntax: 
 - Interactive mode: pomobash
 - Command Line mode: pomobash [-n number] [-t pomo-time] [-s short] [-l long]

Parameters:

 -n, --pomo-number	 Number of Pomodoro in each cycle
 -t, --pomo-time	 Time elapsed for each Pomodoro

 -s, --short-break-time	 Duration of the short breaks
 -l, --long-break-time	 Duration of the long breaks

 -h,  --help    	 get help

Time parameters must be input in minutes." 
}

usage()
{
    echo "pomobash (Pomobash) v1.1.1 ©Copyright (C) 2015 Albert Aparicio

Usage: pomobash [-n number] [-t pomo-time] [-s short] [-l long]
"
}

interactive_mode()
{

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

	run_pomo_cycle && exit 0

}

run_pomo_cycle()
{
# Pomodoro in action, in sets of the user input Pomodoros
echo "Pomodoro running...
"
for ((j=0; j< ((POMO_NUM-1));j++))
do
	sleep $POMO_M && notify-send "break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $BREAK_M && notify-send "back to work" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga
done

sleep $POMO_M && notify-send "long break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $LBREAK_M && notify-send "back to work" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga

exit 0
}


POMO_NUM=
POMO_M=
BREAK_M=
LBREAK_M=

[ $# -eq 0 ] && { interactive_mode; exit 0; }

while [ "$1" != "" ]; do
    case $1 in
        -n | --pomo-number )    shift
                                POMO_NUM=$1
                                ;;
        -t | --pomo-time )    	shift
				POMO_M=$1
                                ;;
        -s | --short-break-time )    	shift
				BREAK_M=$1
                                ;;
        -l | --long-break-time )    	shift
				LBREAK_M=$1
                                ;;
        -h | --help )           get_help
                                exit 0
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done


run_pomo_cycle && exit 0


#sleep $POMO_M && notify-send "break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $BREAK_M && notify-send "back to work" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga
#sleep $POMO_M && notify-send "break" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga; sleep $BREAK_M && notify-send "back to work" && mplayer --really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga

