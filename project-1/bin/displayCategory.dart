import 'project_1.dart';
import 'dart:io';

/// Display distinct category
displayCategorys() {
  Set categorySet = {};
  bool flag = false;

  // use Set to print distinct category
  for (var book in booksList) {
    categorySet.add(book.category);
  }
  for (var category in categorySet) {
    print(category);
  }
  do {
    try {
      print("Choes one of the category to display books related (e for exit)");
      String userCategory = stdin.readLineSync()!;

      if (userCategory == "e" || userCategory == "E") {
        break;
      }
      for (var book in booksList) {
        if (book.category == userCategory) {
          flag = true;
          print("--------------------");
          book.display();
          print("--------------------");
        }
      }
      if (flag == false) {
        print("Sorry the category you looking for does not exist");
      }
    } catch (error) {
      print("please make sure you entered correct data");
    }
  } while (true);
}
