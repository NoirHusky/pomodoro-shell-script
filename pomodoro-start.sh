#!/bin/bash
while [ 1 ]
do
	xmessage "Time to work"
    secs=1500
    while [ $secs -gt -1 ]
    do
		clear
    	sleep 1 &
    	printf "Pomodoro (#Work): \t%02d:%02d:%02d" $((secs/3600)) $(( (secs/60)%60)) $((secs%60))
        secs=$(( $secs - 1 ))
    	wait
    done
    
    xmessage "Time to take a break"    
    secs=300
    while [ $secs -gt -1 ]
    do
		clear
    	sleep 1 &
    	printf "Pomodoro (#Break): \t%02d:%02d:%02d" $((secs/3600)) $(( (secs/60)%60)) $((secs%60))
        secs=$(( $secs - 1 ))
    	wait
    done
done
