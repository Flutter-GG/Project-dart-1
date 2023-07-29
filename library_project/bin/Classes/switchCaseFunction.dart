import 'dart:io';
import './libraryClass.dart';

switchCases() {
  try {
    do {
      print(
          "\nPlease select:\n\n1- To view the library\n2- To search in the library\n3- To edit the library\n4- To buy a book\n5- To show what you buy\n(press 'q' to exit):");
      String? userInput = stdin.readLineSync();

      switch (userInput) {
        case '1':
          getView viewData = getView();
          print(
              "\n1- To view 'available copies'\n2- To view 'categories'\n3- To view all 'books'\n(press 'q' to exit):");
          String? userInput = stdin.readLineSync();
          switch (userInput) {
            case '1':
              viewData.getAvailableCopies();
              break;
            case '2':
              viewData.getCategories();
              break;
            case '3':
              viewData.getBooks();
              break;
            case 'q' || 'Q':
              return;
          }
          break;
        case '2':
          getSearch searching = getSearch();
          print(searching.getSearchByQuery());
          break;
        case '3':
          EditingLibrary editLibrary = EditingLibrary();

          print('\nAre you from staff? Y/N\n');
          String? isStaff = stdin.readLineSync();
          if (isStaff == 'y' || isStaff == 'Y') {
            print(
                "\n1- To add new book\n2- To delete a book\n3- To edit a book\n(or press 'q' to exit):");
            String? userInput = stdin.readLineSync();
            switch (userInput) {
              case '1':
                editLibrary.addNewBook();
                break;
              case '2':
                editLibrary.deleteBook();
                break;
              case '3':
                editLibrary.modifyBookData();
                break;
              case 'q' || 'Q':
                return;
            }
          }
          break;
        case '4':
          Purchases purchase = Purchases();
          purchase.makePurchase();
          break;
        case '5':
          Purchases viewPurchases = Purchases();
          viewPurchases.getPurchases();
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
