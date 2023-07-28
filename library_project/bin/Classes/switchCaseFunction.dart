import 'dart:io';
import './libraryClass.dart';

switchCases() {
  final purchases =
      Purchases(); // Create a single instance of the Purchases class.

  try {
    do {
      print(
          "\nPlease select:\n\n1- To view the library\n2- To search in the library\n3- To edit the library\n4- To buy a book\n5- To show what you buy\n(press 'q' to exit):");
      String? userInput = stdin.readLineSync();

      switch (userInput) {
        case '1':
          print(
              "\n1- To view 'available copies'\n2- To view 'categories'\n3- To view all 'books'\n(press 'q' to exit):");
          String? userInput = stdin.readLineSync();
          switch (userInput) {
            case '1':
              View().viewAvailableCopies();
              break;
            case '2':
              View().viewCategories();
              break;
            case '3':
              View().viewBooks();
              break;
            case 'q' || 'Q':
              return;
          }
          break;
        case '2':
          Search().searchByQuery();
          break;
        case '3':
          print('\nAre you from staff? Y/N\n');
          String? isStaff = stdin.readLineSync();
          if (isStaff == 'y' || isStaff == 'Y') {
            print(
                "\n1- To add new book\n2- To delete a book\n3- To edit a book\n(press 'q' to exit):");
            String? userInput = stdin.readLineSync();
            switch (userInput) {
              case '1':
                Edits().addNewBook();
                break;
              case '2':
                Edits().deleteBook();
                break;
              case '3':
                Edits().modifyBookData();
                break;
              case 'q' || 'Q':
                return;
            }
          }
          break;
        case '4':
          purchases.makePurchase();
          break;
        case '5':
          purchases.viewPurchases();
          break;

        case 'q' || 'Q':
          return;
        default:
          print("Invalid input. Please try again.");
      }
    } while (true);
  } catch (error) {
    print('Error: $error');
  }
}
