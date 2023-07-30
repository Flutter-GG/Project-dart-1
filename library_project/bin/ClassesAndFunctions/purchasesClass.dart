import 'dart:io';

import '../Data/libraryData.dart';
import 'libraryClass.dart';

class Purchases extends Library {
  //? done
  /* this class is for makeing purchases, if the user want to but a book with 0
  copies it wont allow the user to do it, also recieve the invoice of
  the purchase */
  static List invoice = [];

  makePurchase() {
    /* this method will make you buy a book */
    try {
      List updatedInvoice = List.from(invoice);

      print("\n What book do you want to buy\n Q: to exit\n\n");
      for (var bookIndex = 0; bookIndex < theLibrary.length; bookIndex++) {
        if (theLibrary[bookIndex]['avalibale copies'] == 0) {
          print(
              "\n $bookIndex: ${theLibrary[bookIndex]['title']}, is sold out\n___________________________________________________\n");
        } else {
          if (theLibrary[bookIndex]['avalibale copies'] == 1) {
            print(
                " $bookIndex: ${theLibrary[bookIndex]['title']},  \n '${theLibrary[bookIndex]['avalibale copies']}' copy\n___________________________________________________\n");
          } else {
            print(
                " $bookIndex: ${theLibrary[bookIndex]['title']},  \n '${theLibrary[bookIndex]['avalibale copies']}' copies\n___________________________________________________\n");
          }
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

          /* this is new, if the user buy the same book twice the number of bought copies will increase */
          int existingBookIndex = -1;
          for (var index = 0; index < updatedInvoice.length; index++) {
            if (updatedInvoice[index]['title'] == selectedBook['title'] &&
                updatedInvoice[index]['author'] == selectedBook['author']) {
              existingBookIndex = index;
              break;
            }
          }

          if (existingBookIndex != -1) {
            int newNumberOfCopies = updatedInvoice[existingBookIndex]
                    ['numberOfCopies'] +
                numberOfCopies;
            double newTotalPrice = selectedBook['price'] * newNumberOfCopies;

            updatedInvoice[existingBookIndex]['numberOfCopies'] =
                newNumberOfCopies;
            updatedInvoice[existingBookIndex]['totalPrice'] = newTotalPrice;
          } else {
            updatedInvoice.add({
              'title': selectedBook['title'],
              'author': selectedBook['author'],
              'numberOfCopies': numberOfCopies,
              'totalPrice': totalPrice,
            });
          }

          var remainingCopies =
              selectedBook['avalibale copies'] - numberOfCopies;
          print(
              "\n You purchased '$numberOfCopies' copy/copies of '${selectedBook['title']}'.\n Total Price: ${totalPrice.toStringAsFixed(2)}\$\n The remaining copies: '$remainingCopies'\n___________________________________________________\n");

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
    /* and this will give you an invoice of what you bought */
    if (invoice.isEmpty) {
      print("\nYou haven't made any purchases yet.");
      return;
    }

    double totalAmount = 0.0;

    for (var purchase in invoice) {
      print(
          "\nTitle: ${purchase['title']}\nNumber of Copies: ${purchase['numberOfCopies']}\nTotal Price: ${purchase['totalPrice'].toStringAsFixed(2)}\$\n___________________________________________________\n");
      totalAmount += purchase['totalPrice'];
    }

    print("\nTotal Amount Spent: ${totalAmount.toStringAsFixed(2)}\$");
  }
}
// import 'dart:io';
// import '../Data/libraryData.dart';
// import 'libraryClass.dart';

// class Purchases extends Library {
//   static List invoice = [];

//   makePurchase() {
//     try {
//       List updatedInvoice = List.from(invoice);

//       print("\n What book do you want to buy\n Q: to exit\n\n");
//       for (var bookIndex = 0; bookIndex < theLibrary.length; bookIndex++) {
//         if (theLibrary[bookIndex]['avalibale copies'] == 0) {
//           print(
//               "\n $bookIndex: ${theLibrary[bookIndex]['title']}, is sold out\n___________________________________________________\n");
//         } else {
//           if (theLibrary[bookIndex]['avalibale copies'] == 1) {
//             print(
//                 " $bookIndex: ${theLibrary[bookIndex]['title']},  \n '${theLibrary[bookIndex]['avalibale copies']}' copy\n___________________________________________________\n");
//           } else {
//             print(
//                 " $bookIndex: ${theLibrary[bookIndex]['title']},  \n '${theLibrary[bookIndex]['avalibale copies']}' copies\n___________________________________________________\n");
//           }
//         }
//       }

//       print(
//           "\nEnter the number of the book you want to buy \n\n Q: to exit\n\n");
//       String userInput = stdin.readLineSync() ?? "";

//       if (userInput.toLowerCase() == 'q') {
//         print("No purchase made.");
//         return;
//       }

//       int bookNumber = int.tryParse(userInput) ?? -1;
//       if (bookNumber >= 0 && bookNumber < theLibrary.length) {
//         Map selectedBook = theLibrary[bookNumber];
//         print("Selected Book: ${selectedBook['title']}");

//         print("\nEnter the number of copies you want to purchase:");
//         int numberOfCopies = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

//         if (numberOfCopies > 0 &&
//             numberOfCopies <= selectedBook['avalibale copies']) {
//           double totalPrice = selectedBook['price'] * numberOfCopies;

//           // Check if the book already exists in the invoice
//           int existingBookIndex = -1;
//           for (var i = 0; i < updatedInvoice.length; i++) {
//             if (updatedInvoice[i]['title'] == selectedBook['title'] &&
//                 updatedInvoice[i]['author'] == selectedBook['author']) {
//               existingBookIndex = i;
//               break;
//             }
//           }

//           if (existingBookIndex != -1) {
//             int newNumberOfCopies = updatedInvoice[existingBookIndex]
//                     ['numberOfCopies'] +
//                 numberOfCopies;
//             double newTotalPrice = selectedBook['price'] * newNumberOfCopies;

//             updatedInvoice[existingBookIndex]['numberOfCopies'] =
//                 newNumberOfCopies;
//             updatedInvoice[existingBookIndex]['totalPrice'] = newTotalPrice;
//           } else {
//             updatedInvoice.add({
//               'title': selectedBook['title'],
//               'author': selectedBook['author'],
//               'numberOfCopies': numberOfCopies,
//               'totalPrice': totalPrice,
//             });
//           }

//           var remainingCopies =
//               selectedBook['avalibale copies'] - numberOfCopies;
//           print(
//               "\n You purchased '$numberOfCopies' copy/copies of '${selectedBook['title']}'.\n Total Price: ${totalPrice.toStringAsFixed(2)}\$\n The remaining copies: '$remainingCopies'\n___________________________________________________\n");

//           selectedBook['avalibale copies'] = remainingCopies;
//           invoice = updatedInvoice;
//         } else if (selectedBook['avalibale copies'] == 0) {
//           print("The book '${selectedBook['title']}' is sold out.");
//         } else {
//           print("Invalid number of copies. Please enter a valid quantity.");
//         }
//       } else {
//         print("Invalid book number. Please enter a valid book number.");
//       }
//     } catch (error) {
//       print("Error: $error");
//     }
//   }

//   getInvoice() {
//     /* and this will give you an invoice of what you bought */
//     if (invoice.isEmpty) {
//       print("\nYou haven't made any purchases yet.");
//       return;
//     }

//     double totalAmount = 0.0;

//     for (var purchase in invoice) {
//       print(
//           "\nTitle: ${purchase['title']}\nNumber of Copies: ${purchase['numberOfCopies']}\nTotal Price: ${purchase['totalPrice'].toStringAsFixed(2)}\$\n___________________________________________________\n");
//       totalAmount += purchase['totalPrice'];
//     }

//     print("\nTotal Amount Spent: ${totalAmount.toStringAsFixed(2)}\$");
//   }
// }
