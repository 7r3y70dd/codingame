# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

toDecimal() {
    # printf "%d" "'${1}"
    LC_CTYPE=C printf '%d' "'$1"
}

toBinary() {
    echo "ibase=10;obase=2; ${1}" | bc | awk '{printf "%07d", $0}'
}

read MESSAGE

echo "Debug MESSAGE:$MESSAGE" >&2

for (( i=0; i<${#MESSAGE}; i++ )); do
  character=${MESSAGE:$i:1}
  
  echo "Debug character:$character" >&2
  
  decimalMessage=`toDecimal "$character"`
  binaryMessage=`toBinary ${decimalMessage}`

  echo "Debug decimalMessage: $decimalMessage" >&2
  echo "Debug binaryMessage: $binaryMessage" >&2
  echo "Debug $character:$binaryMessage" >&2
  
  buffer+=${binaryMessage}
done

echo "Debug buffer:$buffer" >&2

counter=0

for letter in `echo ${buffer} | grep -o .`; do
  if [ "${counter}" == "0" ]; then
    counter=$((counter+1))
  elif [ "${letter}" == "${prior}" ]; then
    counter=$((counter+1))
  else
    if [ "${prior}" == "1" ]; then
      answer+="0 "
    else
      answer+="00 "
    fi

    for i in $(seq 1 ${counter}); do
      answer+="0"
    done
      
    echo "Debug answer.1:>$answer<" >&2
    answer+=" "
    counter=1
  fi
    
  prior=${letter}
done

if [ "${prior}" == "1" ]; then
  answer+="0 "
else
  answer+="00 "
fi

for i in $(seq 1 ${counter}); do
  answer+="0"
done

echo "Debug answer.2:>$answer<" >&2

# Write an action using echo
# To debug: echo "Debug messages..." >&2

echo "$answer"
