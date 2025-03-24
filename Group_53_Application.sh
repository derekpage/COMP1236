#!/bin/bash

hexagonal_numbers () {
  echo "Insert code here."
}

square_numbers () {
  echo "Insert code here."
}

quadratic_numbers () {
  echo "Insert code here."
}

echo "Please enter the password."
count=1
set_password="w22"
while true; do
  read -s input_password
  if [[ $input_password == $set_password ]]; then
    break
  fi
  case $count in
    1)
      echo -e "\nIncorrect password. Please enter the password."
      ;;
    2)
      echo -e "\nIncorrect password. you have 1 attempt left. Please enter the password."
      ;;
    *)
      echo -e "\nToo many Incorrect attempts. Exiting script."
      exit 1
      ;;
  esac
  ((count++))
done

while true; do
  echo -e "\nPlease select from the following options."
  echo "(h/H) Hexagonal Numbers"
  echo "(s/S) Square Numbers"
  echo "(q/Q) Quadratic Numbers"
  read option
  case $option in
    h | H)
      echo -e "\nYou've chosen Hexagonal Numbers"
      hexagonal_numbers
      ;;
    s | S)
      echo -e "\nYou've chosen Square Numbers"
      square_numbers
      ;;
    q | Q)
      echo -e "\nYou've chosen Quadratic Numbers"
      quadratic_numbers
      ;;
    *)
      echo -e "\nOption not recognized."
      continue
      ;;
  esac
  echo -e "\nWould you like to continue with another task? (y/n)"
  read exit
  case $exit in
    y | Y)
      ;;
    *)
      echo -e "\nExiting script."
      exit 1
      ;;
  esac
done
