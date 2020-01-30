#!/bin/bash 
echo "Welcome To Snake And Ladder Simulator"
NO_PLAY=1
LADDER=2
SNAKE=3
WIN_POSITION=100
START_POSITION=0

function CheckOption() {
while (( $position < $WIN_POSITION ))
do
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
RandomCalculate 3 6
done
}

function RandomCalculate() {
CheckOption $((RANDOM%$1+1)) $((RANDOM%$2+1))
}

position=0
RandomCalculate 3 6
