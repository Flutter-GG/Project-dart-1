import 'bookClass.dart';
import 'project_1.dart';
import 'basicFuns.dart';
import 'data.dart';
import 'dart:io';

/// Check if the book exist then add new book to books data or increase number of copies
addNewBook() {
  Map newBook;

  do {
    try {
      print("Enter the title of the book you want to add: (e for exit)");
      String userInput = stdin.readLineSync()!;

      if (userInput == "e" || userInput == "E") {
        break;
      } else if (userInput == "") {
        // make sure that user will not enter empty data
        print("please enter valid title to delete");
      } else if (titles.contains(userInput)) {
        // if the book exists then call increaseTheCopies
        increaseTheCopies(title: userInput);
      } else if (!titles.contains(userInput)) {
        newBook =
            queryFromUser(title: userInput); // Get all required data from user
        booksData.add(newBook);
        print("Added successfully");
      }
    } on FormatException {
      print("please enter valid number");
    } catch (error) {
      print("please make sure you entered correct data");
    }
  } while (true);
}

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
