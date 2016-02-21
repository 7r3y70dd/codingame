# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# surfaceN: the number of points used to draw the surface of Mars.
read surfaceN
for (( i=0; i<surfaceN; i++ )); do
    # landX: X coordinate of a surface point. (0 to 6999)
    # landY: Y coordinate of a surface point. By linking all the points together in a sequential fashion, you form the surface of Mars.
    read landX landY
done

maxVSpeed=-40

# game loop
while true; do
    # hSpeed: the horizontal speed (in m/s), can be negative.
    # vSpeed: the vertical speed (in m/s), can be negative.
    # fuel: the quantity of remaining fuel in liters.
    # rotate: the rotation angle in degrees (-90 to 90).
    # power: the thrust power (0 to 4).
    read X Y hSpeed vSpeed fuel rotate power

    # Write an action using echo
    # To debug: echo "Debug messages..." >&2
    echo "Debug surfaceN:$surfaceN, x:$X, y:$Y, hSpeed:$hSpeed, vSpeed:$vSpeed, fuel:$fuel, rotate:$rotate, power:$power" >&2
    
    #echo "0 3" # 2 integers: rotate power. rotate is the desired rotation angle (should be 0 for level 1), power is the desired thrust power (0 to 4).
    thrust=0
    
    #if (($vSpeed-1 < $maxVSpeed)); then
     # thrust=4
    #fi
     if [ $Y -lt 2240 ]; then
         if [ $vSpeed -lt -40 ]; then
           thrust=4
         elif [ $vSpeed -lt -35 ]; then
           thrust=3
         elif [ $vSpeed -lt -25 ]; then
           thrust=2
         elif [ $vSpeed -lt -15 ]; then
           thrust=1
         fi
     fi
    
    echo "0 $thrust"
done
