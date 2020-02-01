#!/bin/bash -x
declare -A game
echo "Welcome To Snake And Ladder Simulator"
NO_PLAY=1
LADDER=2
SNAKE=3
WIN_POSITION=100
START_POSITION=0

function CheckOption() {
while [[ $position -ne $WIN_POSITION ]]
do
position=${game[$3]}
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
game[$3]=$position
CheckWin $3
done
}

function RandomCalculate() {
CheckOption $((RANDOM%$1+1)) $((RANDOM%$2+1)) $3
}

function CheckWin() {
	if((${game[$1]}==$WIN_POSITION))
	then
		echo "$1 won"
		echo "Die Rolled $count Times"
	else
		SwitchPlayer
	fi
}

function SwitchPlayer {
	if(($((count%2))==0))
	then
		RandomCalculate 3 6 'player1'
	else
		RandomCalculate 3 6 'player2'
	fi
}

count=0
game[player1]=0
game[player2]=0
SwitchPlayer
RandomCalculate 3 6
