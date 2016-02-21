# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

sum() {
  n=$(($1+1))
  echo $(($1*$n/2))
}

# road: the length of the road before the gap.
read road
# gap: the length of the gap.
read gap
# platform: the length of the landing platform.
read platform
speedM=$(($gap+1))
# game loop
jumpSpot=$(($road-1))
safeSpeed=$platform
while true; do

    # speed: the motorbike's speed.
    read speed
    # coordX: the position on the road of the motorbike.
    read coordX

    # Write an action using echo
    
    echo "Debug road:$road" >&2
    echo "Debug gap:$gap" >&2
    echo "Debug platform:$platform" >&2
    echo "Debug speed:$speed" >&2
    echo "Debug coordX:$coordX" >&2
    echo "Debug speedM:$speedM" >&2
    echo "Debug jumpSpot:$jumpSpot" >&2
    coordN=$(($coordX+$speed))
    
    echo "Debug coordN:$coordN" >&2
    
    #if [ $coordN -eq $(($road-$speedM)) ]; then
      #echo "JUMP"
    # if [ $coordX -eq 9 ]; then
    #   echo "SLOW"
    # elif [ $coordX -eq 12 ]; then
    #   echo "WAIT"
    # elif [ $coordX -eq 15 ]; then
    #   echo "JUMP"
    # elif [ $speed -eq $speedM ]; then
    #   echo "WAIT"
    # else 
    #   echo "SPEED"
    # fi
    
    distance=$(sum $speed)
    speedNext=$(($speed+1))
    distanceNext=$(sum $speedNext)

    if [ $coordX -ge $(($road + $gap)) ] || [ $speed -gt $speedM ]; then
      op="SLOW"
    elif [ $coordX -eq $jumpSpot ]; then
      op="JUMP"
    elif [ $speed -eq $safeSpeed ]; then
      op="WAIT"
    elif [ $speed -eq $speedM ]; then
      op="WAIT"
    else
      op="SPEED"
    fi
    
    echo "Debug speed: $speed, distance: $distance, distanceNext: $distanceNext, op: $op" >&2

    echo "$op"
    
    speed=$speedNext
    
    # To debug: echo "Debug messages..." >&2

    #echo "SPEED" # A single line containing one of 4 keywords: SPEED, SLOW, JUMP, WAIT.
done
