#!/bin/bash

count=0;
skip=100;

while [ 1 ]
do
    if [ $skip -eq 100 ]
    then
	    xmessage "Time to work" -geometry 400x100 -center
    fi
    secs=1500
    while [ $secs -gt -1 ]
    do
	clear
    	sleep 1 &
	printf "Pomodoro (#Work): \t%02d:%02d:%02d\nPomodoros (#%d)" $((secs/3600)) $(( (secs/60)%60)) $((secs%60)) $(( count ))
        secs=$(( $secs - 1 ))
    	wait
    done
    count=$(( $count + 1 ))
    
    xmessage "Time to take a break" -buttons "Take a Break:100,Skip:101" -geometry 400x100 -center
    skip=$?
    # if we choose to take a break
    if [ $skip -eq 100 ]
    then
	    secs=300
	    while [ $secs -gt -1 ]
	    do
		clear
		sleep 1 &
		printf "Pomodoro (#Break): \t%02d:%02d:%02d\nPomodoros (#%d)" $((secs/3600)) $(( (secs/60)%60)) $((secs%60)) $(( count ))
		secs=$(( $secs - 1 ))
		wait
	    done
    fi
done
