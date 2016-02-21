# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.
# ---
# Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.

# lightX: the X position of the light of power
# lightY: the Y position of the light of power
# initialTX: Thor's starting X position
# initialTY: Thor's starting Y position
read lightX lightY initialTX initialTY

thorX=$initialTX
thorY=$initialTY

# game loop
while true; do
    directionX=""
    directionY=""
    
    echo "Debug thorX:$thorX, thorY:$thorY" >&2
    
    if [ $thorX -gt $lightX ]; then
      directionX="W"
      ((thorX-=1))
    elif [ $thorX -lt $lightX ]; then
      directionX="E"
      ((thorX+=1))
    fi
    
    if [ $thorY -gt $lightY ]; then
      directionY="N"
      ((thorY-=1))
    elif [ $thorY -lt $lightY ]; then
      directionY="S"
      ((thorY+=1))
    fi

    # remainingTurns: The remaining amount of turns Thor can move. Do not remove this line.
    read remainingTurns
    
    # Write an action using echo
    # To debug: echo "Debug messages..." >&2

    #echo "SE" # A single line providing the move to be made: N NE E SE S SW W or NW
    echo $directionY$directionX
done
