#!/bin/bash

declare -A types

read N
read Q

for (( i=0; i<N; i++ )); do
  read EXT MT
  ext=${EXT,,}
  [ ${types[$ext]-$ext} ] && types[$ext]=$MT
done

for (( i=0; i<Q; i++ )); do
  read FNAME
  name=${FNAME,,}
  [[ $name == *"."* ]] && [[ $name != *"." ]] && type=${types[${name##*.}]-"UNKNOWN"} || type="UNKNOWN"
  echo $type
done
