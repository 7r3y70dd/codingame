#!/bin/bash

declare -A types

toLower() {
  echo $1 | tr '[:upper:]' '[:lower:]'
}

read N
read Q

for (( i=0; i<N; i++ )); do
  read EXT MT
  ext=`toLower $EXT`
  types[$ext]=$MT
done

for (( i=0; i<Q; i++ )); do
  read FNAME
  name=`toLower $FNAME`
  [[ $name == *"."* ]] && type=${name##*.} || type=
  echo ${types[$type]:-UNKNOWN}
done
