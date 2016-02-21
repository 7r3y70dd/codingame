#!/bin/bash

read L
read H
read T

T=${T^^}

echo "L:$L, H:$H, T:$T" >&2

ord() {
  LC_CTYPE=C printf '%d' "'$1"
}

declare -a rows
declare -a answers

for (( i = 0; i < H; i++ )); do
  read ROW
  rows[$i]=$ROW
done

for (( i = 0; i < H; i++ )); do
  answers[$i]=""
done

echo "rows-keys:${!rows[@]}, rows-values:${rows[@]}" >&2

ordA=$(ord "A")

for (( i = 0; i < ${#T}; i++ )); do
  c=${T:$i:1}
  ordC=$(ord $c)
  pos=$(((ordC - ordA) * L))
  rowSize=${#rows[0]}
  
  if (( pos < 0 || pos > rowSize )); then
    pos=$((rowSize - L));
  fi
  
  echo "c:$c, ord($c):$ordC, rowSize:$rowSize, pos:$pos" >&2
  
  for (( j = 0; j < H; j++ )); do
    answers[$j]+=${rows[$j]:$pos:$L};
  done         
done

echo "answers-keys:${!answers[@]}, answers-values:${answers[@]}" >&2
echo "answers[0]:${answers[0]}" >&2
echo "answers[1]:${answers[1]}" >&2
echo "answers[2]:${answers[2]}" >&2
echo "answers[3]:${answers[3]}" >&2
echo "answers[4]:${answers[4]}" >&2

for k in "${!answers[@]}"; do
  answer+="${answers[$k]}"$'\n'
done

echo "answer:$answer" >&2

echo $answer
