import 'dart:io';
import 'editingLibraryClass.dart';
import 'getSearchClass.dart';
import 'getViewClass.dart';
import 'purchasesClass.dart';

switchCases() {
  try {
    do {
      print('\n ------------------------');
      print('| welcome to the library |');
      print(' ------------------------');
      print(
          "\nPlease select:\n\n 1: To 'view the library'\n 2: To 'search in the library'\n 3: To 'edit the library'\n 4: To 'buy a book'\n 5: To 'show what you bought'\n\n Q: to exit\n\n");
      String? userInput = stdin.readLineSync();

      switch (userInput) {
        case '1':
          GetView viewData = GetView();
          print('\n ---------------------');
          print('| Viewing the library |');
          print(' ---------------------');
          print(
              "\n Please select\n\n 1: To view 'available copies'\n 2: To view 'categories'\n 3: To view all 'books'\n\nQ: to exit\n\n");
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
              break;
          }
          break;
        case '2':
          GetSearch searching = GetSearch();
          searching.getSearchByQuery();
          break;
        case '3':
          EditingLibrary editLibrary = EditingLibrary();

          print('\nAre you from the staff? Y/N\n');
          String? isStaff = stdin.readLineSync();
          if (isStaff == 'y' || isStaff == 'Y') {
            print(
                "\n 1: To 'add new book'\n 2: To 'delete a book'\n 3: To 'edit a book'\n\n Q: to exit\n\n");
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
                break;
            }
          }
          break;
        case '4':
          Purchases purchase = Purchases();
          purchase.makePurchase();
          break;
        case '5':
          Purchases viewPurchases = Purchases();
          viewPurchases.getInvoice();
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
