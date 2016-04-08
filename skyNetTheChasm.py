mport sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

road = int(raw_input())  # the length of the road before the gap.
gap = int(raw_input())  # the length of the gap.
y = int(raw_input())
minSpeed = gap + 1
jump = road - 1
do = ''
platformStart = road + gap

# game loop
while True:
    speed = int(raw_input())  # the motorbike's speed.
    coord_x = int(raw_input())  # the position on the road of the motorbike.
    
    print >> sys.stderr, "speed: %s" % speed
    print >> sys.stderr, "coord_x: %s" % coord_x
    print >> sys.stderr, "road: %s" % road
    print >> sys.stderr, "gap: %s" % gap
    print >> sys.stderr, "jump: %s" % jump
    print >> sys.stderr, "minSpeed: %s" % minSpeed
    print >> sys.stderr, "platformStart: %s" % platformStart

    if coord_x == jump:
        do = "JUMP"
    elif coord_x >= road + gap:
        do = "SLOW"
    elif speed < minSpeed:
        do = "SPEED"
    elif speed == minSpeed:
        do = "WAIT"
    elif speed > minSpeed:
        do = "SLOW"
        
    # Write an action using print
    # To debug: print >> sys.stderr, "Debug messages..."
    print >> sys.stderr, "do: %s" % do
    # A single line containing one of 4 keywords: SPEED, SLOW, JUMP, WAIT.
    print '%s' % do

