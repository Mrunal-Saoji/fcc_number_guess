#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only  -c"

echo -e "Enter your username:"
read USERNAME

if [[ $USERNAME ]]
then
  ID=$($PSQL "select id from users where username='$USERNAME';")
  if [[ $ID ]]
  then
    DATA=$($PSQL "(select count(id) as game_played , min(guess_count) as best_game from game_history where user_id=$ID);")
    echo $DATA
    echo "$DATA" | while read GAME_PLAYED BAR BEST_GAME; do
      echo -e "Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
    done
    
  else
    $($PSQL "insert into users(username) values('$USERNAME');")
    ID=$($PSQL "select id from users where username='$USERNAME';")
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  fi

  SECRET_NUMBER=$((RANDOM % 1000 + 1))
  echo $SECRET_NUMBER
  echo -e "Guess the secret number between 1 and 1000:"
  read GUESS

  COUNTER=1
  re='^[0-9]+$'

  while [[ $GUESS != $SECRET_NUMBER ]]
  do
    ((COUNTER++))
    if ! [[ $GUESS =~ $re ]]
    then
      echo -e "That is not an integer, guess again:"
      read GUESS
    elif [[ $GUESS > $SECRET_NUMBER ]]
    then 
      echo -e "It's lower than that, guess again:"
      
      read GUESS
    elif [[ $GUESS < $SECRET_NUMBER ]]
    then 
      echo -e "It's higher than that, guess again:"
      read GUESS
    fi
  done
  echo -e "You guessed it in $COUNTER tries. The secret number was $SECRET_NUMBER. Nice job!"
  RECORD=$($PSQL "INSERT INTO game_history(user_id,guess_count) VALUES($ID,$COUNTER);")

fi