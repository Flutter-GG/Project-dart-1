import 'dart:io';

import '../Data/libraryData.dart';
import 'libraryClass.dart';

class Purchases extends Library {
  //? done
  /* this class is for makeing purchases, if the user want to but a book with 0 
  copies it wont allow the user to do it, also recieve the invoice of 
  the purchase */
  static List invoice = []; //

  makePurchase() {
    /* this method will */
    try {
      List updatedInvoice = List.from(invoice);

      print("\nWhat book do you want to buy\n\n Q: to exit\n\n");
      for (var bookIndex = 1; bookIndex < theLibrary.length; bookIndex++) {
        if (theLibrary[bookIndex]['avalibale copies'] == 0) {
          print(
              "\n$bookIndex: ${theLibrary[bookIndex]['title']}, is sold out\n");
        } else {
          print(
              "$bookIndex: ${theLibrary[bookIndex]['title']}, '${theLibrary[bookIndex]['avalibale copies']}' copy/copies\n");
        }
      }

      print(
          "\nEnter the number of the book you want to buy \n\n Q: to exit\n\n");
      String userInput = stdin.readLineSync() ?? "";

      if (userInput.toLowerCase() == 'q') {
        print("No purchase made.");
        return;
      }

      int bookNumber = int.tryParse(userInput) ?? -1;
      if (bookNumber >= 0 && bookNumber < theLibrary.length) {
        Map selectedBook = theLibrary[bookNumber];
        print("Selected Book: ${selectedBook['title']}");

        print("\nEnter the number of copies you want to purchase:");
        int numberOfCopies = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

        if (numberOfCopies > 0 &&
            numberOfCopies <= selectedBook['avalibale copies']) {
          double totalPrice = selectedBook['price'] * numberOfCopies;

          updatedInvoice.add({
            'title': selectedBook['title'],
            'author': selectedBook['author'],
            'numberOfCopies': numberOfCopies,
            'totalPrice': totalPrice,
          });

          print(
              "\nYou purchased '$numberOfCopies' copy/copies of '${selectedBook['title']}'.\nTotal Price: ${totalPrice.toStringAsFixed(2)}\$");
          var remainingCopies =
              selectedBook['avalibale copies'] - numberOfCopies;

          print("\nThe remaining copies '$remainingCopies'");

          selectedBook['avalibale copies'] = remainingCopies;
          invoice = updatedInvoice;
        } else if (selectedBook['avalibale copies'] == 0) {
          print("The book '${selectedBook['title']}' is sold out.");
        } else {
          print("Invalid number of copies. Please enter a valid quantity.");
        }
      } else {
        print("Invalid book number. Please enter a valid book number.");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  getInvoice() {
    if (invoice.isEmpty) {
      print("\nYou haven't made any purchases yet.");
      return;
    }

    double totalAmount = 0.0;

    print("\nYour Purchases:");
    for (var purchase in invoice) {
      print(
          "\nTitle: ${purchase['title']}\nAuthor: ${purchase['author']}\nNumber of Copies: ${purchase['numberOfCopies']}\nTotal Price: ${purchase['totalPrice'].toStringAsFixed(2)}\$\n");
      totalAmount += purchase['totalPrice'];
    }

    print("\nTotal Amount Spent: ${totalAmount.toStringAsFixed(2)}\$");
  }
}
