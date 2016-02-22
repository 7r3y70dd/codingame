#!/bin/bash

IFS=

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
  read -r ROW
  echo "row:$ROW" >&2
  rows[$i]=$ROW
done

for (( i = 0; i < H; i++ )); do
  answers[$i]=""
done

echo "rows-keys:${!rows[@]}, rows-values:${rows[@]}" >&2

ordA=$(ord "A")
ordZ=$(ord "Z")

for (( i = 0; i < ${#T}; i++ )); do
  c=${T:$i:1}
  ordC=$(ord $c)
  pos=$(((ordC - ordA) * L))
  rowSize=${#rows[0]}
  
  echo "pos:$pos, rowSize=$rowSize" >&2
  
  if (( pos < 0 || pos > rowSize )); then
    pos=$(((ordZ - ordA + 1) * L))
    echo "new pos:$pos" >&2
  fi
  
  echo "c:$c, ord($c):$ordC, rowSize:$rowSize, pos:$pos" >&2
  
  for (( j = 0; j < H; j++ )); do
    answers[$j]+=${rows[$j]:$pos:$L};
  done         
done

echo "answers-keys:${!answers[@]}, answers-values:${answers[@]}" >&2

for k in "${!answers[@]}"; do
  echo "${answers[$k]}" >&2
done

for k in "${!answers[@]}"; do
  answer+="${answers[$k]}"$'\n'
done

echo "answer:" >&2
echo "$answer" >&2

echo "$answer"
