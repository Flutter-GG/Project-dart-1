import 'bookClass.dart';
import 'addEditDelFuns.dart';
import 'basicFuns.dart';
import 'purchaseFun.dart';
import 'data.dart';
import 'dart:io';

List<Book> booksList = loadDateToList();
List copyBooksData = booksData.toList();
Set titles = getDistinctTitles();
void main() {
  print("---------------------");
  print("| Welcome To Library |");
  print("---------------------");
  do {
    print("\n Please select from menu:");
    print(
        " 1: Display all book categories \n 2: Query Books \n 3: Add New Book \n 4: Delete Book \n 5: Editing \n 6: Purchase \n 7: Inquire about number of purchased \n 8: quite");
    String selected = stdin.readLineSync()!;

    switch (selected) {
      case "1":
        displayCategorys();
        break;
      case "2":
        queryBooks();
        break;
      case "3":
        addNewBook();
        break;
      case "4":
        deleteBook();
        break;
      case "5":
        edit();
        break;
      case "6":
        purchase();
        break;
      case "7":
        print("Number of purchased is ${Book.counterForAllPurchase}");
        break;
      case "8":
        exit(0);

      default:
        print("please select from the above menu (only by numbers)");
    }
  } while (true);
}
