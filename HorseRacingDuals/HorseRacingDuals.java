import java.util.*;
import java.io.*;
import java.math.*;
import java.lang.Math;
/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();
        List<Integer> values = new ArrayList();
        
        for (int i = 0; i < N; i++) {
            int pi = in.nextInt();
            values.add (pi);
        }
        Collections.sort(values);
        
        int diff = Integer.MAX_VALUE;
        int prior = -1;
        
        System.err.println("N: " + N);
        
        for (int value:values) {
            if (prior >= 0 && Math.abs(value - prior) < diff) {
                diff = Math.abs(value - prior);
            } 
            prior = value;
            System.err.println("diff: " + diff + ", prior: " + prior);
        }
        
        //System.err.println("diff: " + diff + ", prior: " + prior);
        // Write an action using System.out.println()
        // To debug: System.err.println("Debug messages...");

        System.out.println(diff);
    } 
}
