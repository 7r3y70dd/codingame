# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# n: the number of temperatures to analyse
read n
# temps: the n temperatures expressed as integers ranging from -273 to 5526
read temps

# Write an action using echo
# To debug: echo "Debug messages..." >&2

echo "Debug n:$n, temps:$temps" >&2

for temp in $temps; do
  echo "Debug temp:$temp" >&2
  
  if [ -z "$closestToZero" ]; then
    closestToZero=$temp
  elif [ "$(($temp * $temp))" -lt "$(($closestToZero * $closestToZero))" ]; then
    closestToZero=$temp
  elif [ "$(($temp * $temp))" -eq "$(($closestToZero * $closestToZero))" ]; then
    if [ "$temp" -lt "0" ] && [ "$closestToZero" -lt "0" ]; then
      closestToZero=$temp
    else
      closestToZero=$(echo "sqrt($temp * $temp)" | bc)
    fi
  fi
done

if [ "$n" -eq "0" ]; then
  closestToZero=0;
fi

echo "$closestToZero"
