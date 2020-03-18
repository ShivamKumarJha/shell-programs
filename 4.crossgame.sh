#!/bin/bash

winneris() {
	if [ "$turn" -eq 1 ]; then
		printf "User won.\n"
	else
		printf "Computer won.\n"
	fi
}

#function to continually re draw the board after a move is made
drawBoard(){
	for ((i=1;i<=num_rows;i++)) do
		for ((j=1;j<=num_columns;j++)) do
		printf "|"
		if [ ${matrix[$i,$j]} -eq 0 ]; then # default initilized as 0
			printf " "
		elif [ ${matrix[$i,$j]} -eq 1 ]; then # user
			printf "O"
		elif [ ${matrix[$i,$j]} -eq 2 ]; then # computer
			printf "X"
		fi
		done
		printf "|"
	printf "\n"
	done
}

#check if move is legal
fillCheck(){
	if [ "$X" -le "$num_rows" ] && [ "$X" -gt 0 ]; then
		if [ "$Y" -le "$num_columns" ] && [ "$Y" -gt 0 ]; then
			if [ ${matrix[$X,$Y]} -eq 0 ]; then
				matrix[$X,$Y]=1
				tieCheck=$((tieCheck+1))
				check=1
			else
				printf "Position $X $Y is already taken! Retry\n"
				check=0		
			fi
		else
			printf "Invalid column number entered, please enter a position from 1-3.\n"
			check=0
		fi
	else
		printf "Invalid row number entered, please enter a position from 1-3.\n"
		check=0
	fi
}
#check the board for a winner
winCheck(){
	#check rows
	for ((i=1;i<=num_rows;i++)) do
		if [ ${matrix[$i,1]} -eq "$turn" ] && [ ${matrix[$i,2]} -eq "$turn" ] && [ ${matrix[$i,3]} -eq "$turn" ]; then
			WIN=1
            winneris
			return
		fi

	done

	#check columns
	for ((i=1;i<=num_columns;i++)) do
		if [ ${matrix[1,$i]} -eq "$turn" ] && [ ${matrix[2,$i]} -eq "$turn" ] && [ ${matrix[3,$i]} -eq "$turn" ]; then
			WIN=1
			winneris
			return
		fi

	done

	#check diagnals
	if [ ${matrix[1,1]} -eq "$turn" ] && [ ${matrix[2,2]} -eq "$turn" ] && [ ${matrix[3,3]} -eq "$turn" ]; then
		winneris
		WIN=1
		return
	elif [ ${matrix[1,3]} -eq "$turn" ] && [ ${matrix[2,2]} -eq "$turn" ] && [ ${matrix[3,1]} -eq "$turn" ]; then
		winneris
		WIN=1
		return
	fi
	
	#check for a tie
	if [ "$tieCheck" -eq 9 ]; then
		WIN=1
		printf "Tie Game\n"
		return
	fi
	
}

#opponent finds a random empty square and fills it
opponentTurn(){
	while [  "$turn" -eq 1 ]; do
		oppX=$((RANDOM%3+1))
		oppY=$((RANDOM%3+1))
		if [ ${matrix[$oppX,$oppY]} -eq 0 ]; then
			matrix[$oppX,$oppY]=2
			tieCheck=$((tieCheck+1))
			turn=2
		fi
	done
	
}

#declaration of a 3x3 array to act as the game board
declare -A matrix
num_rows=3
num_columns=3
WIN=0 #keep 0 until win
check=0 #keep 0 until legal move is made by player
turn=1 #keep track of whose turn it is
tieCheck=0 #keep track of the number of moves made so far in case of a tie

for ((i=1;i<=num_rows;i++)) do
    for ((j=1;j<=num_columns;j++)) do
        matrix[$i,$j]=0
    done
done

drawBoard

#main game loop
while [  $WIN = 0 ]; do
	printf "Enter your space as 'row column' e.g. 1 1\n"
	read X Y
	fillCheck
	if [ "$check" -eq 1 ]; then
		winCheck
		drawBoard
		if [ $WIN = 0 ]; then
			opponentTurn
			winCheck
			turn=1
			drawBoard
		fi
	else
		printf "Try again.\n"
	fi
	check=0
done