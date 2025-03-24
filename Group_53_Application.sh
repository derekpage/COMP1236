#!/bin/bash

hexagonal_numbers () {
  echo "Insert code here."
}

square_numbers () {
  echo "Insert code here."
}

quadratic_numbers () {
  echo -e "\nFor the equation an\u00B2 + bn + c"
  echo "Please input an a value"
  read var_a
  echo "Please input a b value"
  read var_b
  echo "Please input a c value"
  read var_c
  echo "Please input the start of the range"
  read num
  echo "Please input the end of the range"
  read end
  while [[ $end -lt $num ]]; do
    echo "End of range should be greater than ${num}"
    echo "Please input the end of the range"
    read end
  done

  echo -e "\nFor the equation (${var_a})n\u00B2 + (${var_b})n + (${var_c})c"
  sum=0
  prime_count=0
  first_result=$((var_a*num*num+var_b*num+var_c))
  while [[ $num -le $end ]]; do

    result=$((var_a*num*num+var_b*num+var_c))
    sum=$((sum+result))

    if [[ result -lt 2 ]]; then
      prime=false
    else
      prime=true
      count=2
      half_result=$((result/2))
      while [[ $count -le $half_result ]]; do
        if [[ $((result%count)) -eq 0 ]]; then
          prime=false
          break
        fi
        ((count++))
      done
    fi

    if [[ $prime == true ]]; then
      echo "n=${num}: ${result} (prime)"
      ((prime_count++))
    else
      echo "n=${num}: ${result}"
    fi

    ((num++))
  done

  echo
  case $prime_count in
    0)
      echo "There are no prime numbers."
      ;;
    1)
      echo "There is 1 prime number."
      ;;
    *)
      echo "There are ${prime_count} prime numbers."
      ;;
  esac
  echo "The sum of all results is ${sum}."
  product=$((first_result*result))
  echo "The product of the first and last result is ${product}."
  echo -e "\nPlease input a number to determine if it is a factor of ${product}."
  read factor
  if [[ $((product%factor)) -eq 0 ]]; then
    echo "${product} is divisible by ${factor}"
  else
    echo "${product} is not divisible by ${factor}"
  fi
}

echo "Please enter the password."
set_password="w22"
count=1
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
