import java.util.*;
import java.io.*;
import java.math.*;

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 * ---
 * Hint: You can use the debug stream to print initialTX and initialTY, if Thor seems not follow your orders.
 **/
class Player {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int lightX = in.nextInt(); // the X position of the light of power
        int lightY = in.nextInt(); // the Y position of the light of power
        int initialTX = in.nextInt(); // Thor's starting X position
        int initialTY = in.nextInt(); // Thor's starting Y position
        String dir = null;
        int thorX = initialTX;
        int thorY = initialTY;
        
        // game loop
        while (true) {
            int remainingTurns = in.nextInt(); // The remaining amount of turns Thor can move. Do not remove this line.
        
          if (thorY > lightY) {
            dir = "N" ;
          } 
          if (thorY < lightY) {
             dir = "S" ;
          }
          if (thorX < lightX) {
             dir = "E" ;
          }
          if (thorX > lightX) {
              dir = "W" ;
          }
          if (thorX > lightX && thorY < lightY) {
              dir = "SW" ;
          }
          if (thorX > lightX && thorY > lightY) {
              dir = "NW" ;
          }
          if (thorX > lightX && thorY > lightY) {
              dir = "NE" ;
          }
          if (thorX < lightX && thorY < lightY) {
              dir = "SE" ;
          }
          if (dir == "N") {
            thorY -= 1 ;
          }
          if (dir == "NW") {
            thorY -= 1 ;
          }
          if(dir == "NE") {
            thorY -= 1 ;
          }
          if (dir == "S") {
            thorY += 1 ;
          }
          if (dir == "SW") {
            thorY += 1 ;
          }
          if(dir == "SE") {
            thorY += 1 ;
          }
          if (dir == "W") {
            thorX -= 1 ;
          }
          if (dir == "NW") {
            thorX -= 1 ;
          }
          if (dir == "SW") {
            thorX -= 1 ;
          }
          if (dir == "E") {
            thorY += 1 ;
          }
          if (dir == "SE") {
            thorX += 1 ;
          }
          if (dir == "NE") {
            thorY += 1 ;
          }
            // Write an action using System.out.println()
            // To debug: System.err.println("Debug messages...");
            
System.err.println("initialTX: " + initialTX);
System.err.println("lightX: " + lightX);
System.err.println("initialTY: " + initialTY);
System.err.println("lightY: " + lightY);
System.err.println("thorY: " + thorY);
System.err.println("thorX: " + thorX);

            // A single line providing the move to be made: N NE E SE S SW W or NW
            System.out.println(dir);
        }
    }
}
