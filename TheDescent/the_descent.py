import sys
import math

while True:
    maxMountain = -1
    maxHeight = -1
    
    for i in xrange(8):
        mountain_h = int(raw_input())
        
        print >> sys.stderr,'i: %s' % i
        print >> sys.stderr,'mountain_h: %s' % mountain_h
        
        if mountain_h > maxHeight:
            maxMountain = i
            maxHeight = mountain_h     
        
        print >> sys.stderr,'maxMountain: %s' % maxMountain
        
    print >> sys.stderr,'maxMountain: %s' % maxMountain

    print maxMountain
