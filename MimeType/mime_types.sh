#!/usr/local/bin/bash

declare -A types

read N
read Q

for (( i=0; i<N; i++ )); do
  read EXT MT
  ext=$(echo $EXT | tr '[:upper:]' '[:lower:]')
  types[$ext]=$MT
done

for (( i=0; i<Q; i++ )); do
  read FNAME
  name=$(echo $FNAME | tr '[:upper:]' '[:lower:]')
  [[ $name == *"."* ]] && type=${name##*.} || type=
  echo ${types[$type]:-UNKNOWN}
done
