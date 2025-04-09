#!/bin/bash

hexagonal_numbers () {
  #user input 
  echo "Please think of 2 numbers..."
  read -p "Enter the lower number: " a
  read -p "Enter the higher number: " b

  #variables
  oddCount=0
  evenCount=0
  oddSum=0
  evenSum=0

  #Hexigonal Function Calculaton
  hexagonal_number() {
      echo $(( n * (2 * n - 1) ))
  }

  #finding the hexigonal numbers 
  echo "Hexagonal numbers within the range [$a, $b]:"
  n=1
  while true; do
      hex=$(hexagonal_number)
      if [ $hex -gt $b ]; then
          break
      fi

  #finding out if they are even or odd 
      if [ $hex -ge $a ] && [ $hex -le $b ]; then
          if (( hex % 2 == 0 )); then
              echo "$hex (even)"
              ((evenCount++))
              ((evenSum+=hex))
          else
              echo "$hex (odd)"
              ((oddCount++))
              ((oddSum+=hex))
          fi
      fi
      ((n++))
  done


  # keep at bottom :)
  echo -e "\nResults:"
  echo "Total odd hexagonal numbers: $oddCount"
  echo "Total even hexagonal numbers: $evenCount"
  echo "Sum of odd hexagonal numbers: $oddSum"
  echo "Sum of even hexagonal numbers: $evenSum"
}

square_numbers () {
  # Task 2- Square Numbers

  # Find and print all square numbers that appear in odd positions in the
  # sequence of square numbers, starting from a user-specified initial
  # position value. The user specified how many such numbers to print.

  # Additionally, find and print all numbers that can be written as the sum of
  # two consecutive square numbers, starting from the first square number, up
  #to a maximum value specified by the user.

  # Getting user input.

  echo -n "Enter initial position (odd number): "
  read initial_value

  echo -n "How many square numbers should be printed?: "
  read number_count

  echo -n "Enter a number to look for factors: "
  read x

  echo -n "Enter the maximum value for the sum of two squares: "
  read maximum_value

  # Printing square numbers in odd positions.

  echo ""
  echo "Square numbers at odd positions beginning at position $initial_value:"

  # i is the position counter starting at the user-specified position.
  # printed_numbers is keeping track of how many square numbers have been shown.

  i=$initial_value
  printed_numbers=0

  # Creating a loop that will run until the desired amount of square numbers has been printed.

  while [ $printed_numbers -lt $number_count ]; do
    square=$((i * i)) # calculates the square of the number at position i
    echo -n "$i^2 = $square"

    if [ $((x % square)) -eq 0 ]; then # checks if the square number is 
                                            # a factor of x
      echo " (Factor of $x)"
    else  
      echo ""
    fi
    i=$((i + 2)) # increases position of i by 2 to move to the next odd number (i(1) + 2 = 3 etc.)
    printed_numbers=$((printed_numbers + 1))
  done

  # Calculating the sum of two consecutive square numbers.

  echo ""
  echo "Numbers that are the sum of two consecutive square numbers (up to $maximum_value):"

  first_number=1 # the first number in a pair of consecutive square numbers.
  sum_count=0 # total number of sums found.

  # Creating a loop to determine the sum of the square numbers.

  while true; do
    square_1=$((first_number * first_number)) # calculates the square of square_1
    square_2=$(((first_number + 1) * (first_number + 1))) # calculates the square of square_2
    sum=$((square_1 + square_2)) # calculates the sum of both square numbers
    if [ $sum -gt $maximum_value ]; then
      break # loop ends if the sum exceeds the user-defined maximum value
    fi
    echo "$square_1 + $square_2 = $sum"
    sum_count=$((sum_count + 1))
    first_number=$((first_number + 1)) # Add the sum to the ongoing count and move on to the next pair of numbers 
  done

  echo ""
  echo "Total found: $sum_count"
}

quadratic_numbers () {
  # User input
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

  # Variable initialization
  sum=0
  prime_count=0
  first_result=$((var_a*num*num+var_b*num+var_c))

  # Looping through range
  while [[ $num -le $end ]]; do

    # Calculating result and adding it to sum
    result=$((var_a*num*num+var_b*num+var_c))
    sum=$((sum+result))

    # Determining if number is prime
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

    # Output of result and updating prime count
    if [[ $prime == true ]]; then
      echo "n=${num}: ${result} (prime)"
      ((prime_count++))
    else
      echo "n=${num}: ${result}"
    fi

    ((num++))
  done

  # Output of prime count, sum of results and product of first and last result
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

  # User input to see if factor of previous product
  echo -e "\nPlease input a number to determine if it is a factor of ${product}."
  read factor
  # Test and output of whether input is factor of product
  if [[ $((product%factor)) -eq 0 ]]; then
    echo "${product} is divisible by ${factor}"
  else
    echo "${product} is not divisible by ${factor}"
  fi
}

# Prompt for password and variable initialization
echo "Please enter the password."
set_password="w22"
count=1

# Loop to retrieve then test password up to three times,
# then exiting if password still incorrect
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

# Loop to run tasks until user exits
while true; do
  # Prompt user for task selection
  echo -e "\nPlease select from the following options."
  echo "(h/H) Hexagonal Numbers"
  echo "(s/S) Square Numbers"
  echo "(q/Q) Quadratic Numbers"
  read option

  # Run function for selected task
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

  # Prompt user to continue, exiting script if user does not continue
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
