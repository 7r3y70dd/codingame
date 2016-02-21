#!/bin/bash

declare -a types

toLower() {
  echo $1 | tr '[:upper:]' '[:lower:]'
}

getType() {
  v=types__${1}
  echo ${!v:-UNKNOWN}
}

toType() {
  name=`toLower $1`
  [[ $name == *"."* ]] && type=$(echo ${name##*.}) || type=
  mime=types[$type]
  echo `getType $type "${types[@]}"`
}

read N
read Q

for (( i=0; i<N; i++ )); do
    read EXT MT
    ext=`toLower $EXT`
    printf -v "types__${ext}" %s "$MT"
done

for (( i=0; i<Q; i++ )); do
    read FNAME
    echo `toType $FNAME`
done

