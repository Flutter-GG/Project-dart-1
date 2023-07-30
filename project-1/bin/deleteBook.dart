import 'classes.dart';
import 'main.dart';
import 'data.dart';
import 'dart:io';

/// Delete existing book from booksList
deleteBook() {
  List<Book> toRemove = [];
  bool flag = false;
  do {
    try {
      print("Enter the title of the book you want to delete: (e for exit)");
      String userInput = stdin.readLineSync()!;

      if (userInput == "e" || userInput == "E") {
        break;
      } else if (userInput == "") {
        // make sure that user will not enter empty data
        print("please enter valid title to delete");
      }

      for (var book in booksList) {
        if (book.title == userInput) {
          // if the book exists then add it to temporary list
          flag = true;
          toRemove.add(book);
        }
      }
      for (var book in toRemove) {
        if (booksList.contains(book)) {
          // make sure that the book from temporary list exists in booksList
          booksList.remove(book); // then delete it from booksList
          print("Deleted successfully");
        }
      }
      if (flag == false && userInput != "") {
        print("Sorry the book you looking for does not exist");
      }
    } catch (error) {
      print("please make sure you entered correct data");
    }
  } while (true);
}

