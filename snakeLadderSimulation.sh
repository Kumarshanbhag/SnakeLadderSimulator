#!/bin/bash -x
declare -A player
echo "Welcome To Snake And Ladder Simulator"
NO_PLAY=1
LADDER=2
SNAKE=3
WIN_POSITION=100
START_POSITION=0

function CheckOption() {
while [[ $position -ne $WIN_POSITION ]]
do
((count++))
	case $1 in
		$NO_PLAY)
			position=$position
		;;
		$LADDER)
			position=$(($position+$2))
			if(($position > $WIN_POSITION))
			then
				position=$(($position-$2))
			fi
		;;
		$SNAKE)
			position=$(($position-$2))
			if(($position < $START_POSITION))
			then
				position=0
			fi
		;;
	esac
player[$count]=$position
RandomCalculate 3 6
done
}

function RandomCalculate() {
CheckOption $((RANDOM%$1+1)) $((RANDOM%$2+1))
}

function DisplayDieAndPosition() {
for die in ${!player[@]}
do
	echo "Die $die : ${player[$die]}"
done | sort -k2 -n 
}

position=0
count=0
player[$count]=$position
RandomCalculate 3 6
DisplayDieAndPosition
