#!/bin/bash -x
echo "Welcome To Snake And Ladder Simulator"
NO_PLAY=1
LADDER=2
SNAKE=3

function CheckOption() {
case $1 in
	$NO_PLAY)
		position=$position
	;;
	$LADDER)
		position=$(($position+$2))
	;;
	$SNAKE)
		position=$(($position-$2))
	;;
esac
}

function RandomCalculate() {
CheckOption $((RANDOM%$1+1)) $((RANDOM%$2+1))
}

position=0
RandomCalculate 3 6
