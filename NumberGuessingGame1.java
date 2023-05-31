import java.util.Random;
import java.util.Scanner;

import javax.lang.model.util.ElementScanner14;

public class NumberGuessingGame1 {

   public static void main(String[] args) {

         Random rand = new Random();

         Scanner scanner = new Scanner(System.in);
         int randomNumber = rand.nextInt(100) +  1;
         
        // System.out.println("Random numger is "+ randomNumber);

         int tryCount = 0;
         while(true){
         System.out.println("Enter your guess from (1-100):");

         int playreGuess = scanner.nextInt(); 
         tryCount++;
         if(playreGuess == randomNumber) {
            System.out.println("HOORAY YOU WON!!!!!");
            System.out.println("It took you " + tryCount + " tries");
            break;
         }
         else if (randomNumber> playreGuess) {
            System.out.println("Nope!! The number is higher. Guess again");
         }
         else{
            System.out.println("Nope!! The number is lower .Guess again");
         }
        }
        scanner.close();
         
   } 
    
}


