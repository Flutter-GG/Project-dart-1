import 'main.dart';
import 'dart:io';

/// display books if the title or author or category are exists
queryBooks() {
  do {
    try {
      print("Enter the title or the author or category: (e for exit)");
      String userInput = stdin.readLineSync()!;
      bool isExist = false;

      if (userInput == "e" || userInput == "E") {
        break;
      }

      for (var book in booksList) {
        if (book.title == userInput ||
            book.author == userInput ||
            book.category == userInput) {
          print("--------------------");
          book.display(); // call display from Book class
          print("--------------------");
          isExist = true;
        }
      }
      if (isExist == false) {
        print("Sorry, the book you query does not exist");
      }
    } catch (error) {
      print("please make sure you entered correct data");
    }
  } while (true);
}
