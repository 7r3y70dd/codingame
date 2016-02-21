#!/bin/bash

x() {
    x=$(echo "($4 + $2) / 2" | tr -s ',' '.' | bc -l)
    y=$(echo "c($x)" | bc -l)
    z=$(echo "$1 - $3" | tr -s ',' '.' | bc -l)
    
    echo "$z * $y" | bc -l
}

y() {
    echo "$2 - $1" | tr -s ',' '.' | bc -l
}

distance () {
    echo "sqrt($1^2 + $2^2) * 6371" | tr -s ',' '.' | bc -l
}

read longitude
read latitude
read numberOfDefibulators

echo "debug latitude:$latitude longitude:$longitude numberOfDefibulators:$numberOfDefibulators" >&2

for (( i=0; i < $numberOfDefibulators; i++ )); do
  read defibulators[$i]
done

echo "debug defibulators:$defibulators[@]" >&2

closestDefibulator=
closestDefibulatorDistance=-1

for defibulator in "${defibulators[@]}"; do
  echo "debug defibulator:$defibulator" >&2
  long=$(echo $defibulator | cut -d\; -f5)
  lat=$(echo $defibulator | cut -d\; -f6)
  name=$(echo $defibulator | cut -d\; -f2)
  
  echo "debug defibulator:$defibulator lat:$lat long:$long name:$name" >&2
  
  x=`x $longitude $latitude $long $lat`
  y=`y $latitude $lat`
  distance=`distance $x $y`
  
  echo "debug x:$x y:$y distance:$distance" >&2
  echo "debug distance:$distance closestDefibulatorDistance:$closestDefibulatorDistance" >&2
  
  if [ $(echo "$closestDefibulatorDistance == -1" | bc) -eq 1 ] \
    || [ $(echo "$distance < $closestDefibulatorDistance" | bc) -eq 1 ]; then
     echo "debug new closest: $name" >&2
    
     closestDefibulator=$name
     closestDefibulatorDistance=$distance
   fi
done

echo "debug closestDefibulator:$closestDefibulator" >&2

echo "$closestDefibulator"
