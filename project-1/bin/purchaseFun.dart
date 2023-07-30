import 'classes.dart';
import 'main.dart';
import 'dart:io';

purchase() {
  do {
    try {
      print("Enter the title of the book you want to purchase: (e for exit)");
      String userInput = stdin.readLineSync()!;
      bool flag = false;

      ///counter for current purchase
      int counterForCurrent = 0;

      if (userInput == "e" || userInput == "E") {
        break;
      }
      for (var book in booksList) {
        if (book.title == userInput) {
          flag = true;
          book.display();
          print("Is the book above the one you are looking for? [y/n]");
          String confirm = stdin.readLineSync()!;
          if (confirm == "y" || confirm == "Y") {
            print("How many?");
            int quantity = int.parse(stdin.readLineSync()!);
            if (quantity <= 0) {
              print("please enter valid number");
            } else if (quantity <= book.numberOfCopies) {
              print(book.purchaseBook(quantity));
              Book.counterForAllPurchase += quantity;
              counterForCurrent += quantity;
              book.invoice(counterForCurrent);
            } else if (quantity > book.numberOfCopies) {
               if (book.numberOfCopies <= 0) {
                print("The book has been sold");
              } else {
                print("There is only ${book.numberOfCopies}");
               }
            }
            break;
          } else if (confirm == "n" || confirm == "N") {
            print("Sorry");
          }
        }
      }
      if (flag == false) {
        print("Sorry the book you looking for does not exist");
      }
    } catch (error) {
      print(error);
    }
  } while (true);
}
