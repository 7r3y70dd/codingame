import sys
import math
import logging

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.
# ---
# Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.

# light_x: the X position of the light of power
# light_y: the Y position of the light of power
# initial_tx: Thor's starting X position
# initial_ty: Thor's starting Y position
light_x, light_y, initial_tx, initial_ty = [int(i) for i in input().split()]

logging.basicConfig(stream=sys.stderr, level=logging.DEBUG)
logging.info('light_x: %d, light_y: %d, initial_tx: %d, initial_ty: %d', int(light_x), int(light_y), int(initial_tx), int(initial_ty))

#print('light_x:%' %s light_x, file=sys.stderr)

# game loop
MIN = 0 - 1
MAX_X = 40 - 1
MAX_Y = 18 - 1
thor_x = initial_tx
thor_y = initial_ty

while True:
    remaining_turns = int(input())  # The remaining amount of turns Thor can move. Do not remove this line.
    direction=""

    if thor_y < light_y and thor_y < MAX_Y:
        direction = 'S'
        thor_y += 1
    elif thor_y > light_y and thor_y > MIN:
        direction = 'N'
        thor_y -= 1
        
    if thor_x < light_x and thor_x < MAX_X:
        direction += 'E'
        thor_x += 1
    elif thor_x > light_x and thor_x > MIN:
        direction += 'W'
        thor_x -= 1

    logging.debug('thor: (%d,%d), light: (%d,%d), direction: %s',
        thor_x, thor_y, light_x, light_y, direction)
    
    # Write an action using print
    # To debug: print("Debug messages...", file=sys.stderr)

    # A single line providing the move to be made: N NE E SE S SW W or NW
    print(direction)
