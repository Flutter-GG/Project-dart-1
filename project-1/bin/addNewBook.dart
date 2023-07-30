import 'classes.dart';
import 'main.dart';
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

/// increase number of copies of the book
increaseTheCopies({required title}) {
  for (var book in booksList) {
    if (book.title == title) {
      print("The book is already exist you want to increase the copics [y/n]");
      String confirm = stdin.readLineSync()!;
      if (confirm == "y" || confirm == "Y") {
        print("How many copics?");
        int copics = int.parse(stdin.readLineSync()!);
        book.numberOfCopies += copics;
        print("Updated successfully");
      } else if (confirm == "n" || confirm == "N") {
        break;
      }
    }
  }
}
