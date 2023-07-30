import 'classes.dart';
import 'main.dart';
import 'data.dart';
import 'dart:io';

edit() {
  do {
    try {
      Map newDataBook;
      bool flag = false;
      print("Enter the title of the book you want to edit: (e for exit)");
      String userInput = stdin.readLineSync()!;

      if (userInput == "e" || userInput == "E") {
        break;
      } else if (userInput == "") {
        // make sure that user will not enter empty data
        print("please enter valid title to edit");
      }

      for (var book in booksList) {
        if (book.title == userInput) {
          // if the book exists then call method editeBook from class Book
          flag = true;
          print("Enter new title");
          String title = stdin.readLineSync()!;
          newDataBook = queryFromUser();
          book.editBook(
              newTitle: title,
              newAuthor: newDataBook["author"],
              newCategory: newDataBook["category"],
              newDescription: newDataBook["description"],
              newPublicationYear: newDataBook["publicationYear"],
              newPrice: newDataBook["price"],
              newNumberOfCopies: newDataBook["numberOfCopies"]);
          print("Updated successfully");
        }
      }
      if (flag == false && userInput != "") {
        print("Sorry the book you looking for does not exist");
      }
    } on FormatException {
      print("please enter valid number");
    } catch (error) {
      print("please make sure you entered correct data");
    }
  } while (true);
}
