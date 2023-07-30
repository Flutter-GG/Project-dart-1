import 'bookClass.dart';
import 'project_1.dart';
import 'data.dart';
import 'dart:io';

// to reduce repetition in the code
/// asking user to enter all required data from user
queryFromUser({String? title}) {
  //print("please enter book title");
  //String title = stdin.readLineSync()!;
  print("please enter book author");
  String author = stdin.readLineSync()!;
  print("please enter book category");
  String category = stdin.readLineSync()!;
  print("please enter book description");
  String? description = stdin.readLineSync();
  print("please enter publication year");
  String? pubYear = stdin.readLineSync();
  print("please enter book price");
  int price = int.parse(stdin.readLineSync()!);
  print("please enter number of copies available");
  int numberOfCopies = int.parse(stdin.readLineSync()!);

  final newBook = {
    "title": title,
    "author": author,
    "category": category,
    "description": description,
    "publicationYear": pubYear,
    "price": price,
    "numberOfCopies": numberOfCopies
  };

  return newBook;
}

/// Lode data from 'data.dart' file to list using objects and then return the list
loadDateToList() {
  List<Book> booksListLocal = [];

  for (var item in booksData) {
    Book book = Book(
        title: item["title"],
        author: item["author"],
        category: item["category"],
        description: item["description"],
        publicationYear: item["publicationYear"],
        price: item["price"],
        numberOfCopies: item["numberOfCopies"]);
    booksListLocal.add(book);
  }

  return booksListLocal;
}

getDistinctTitles() {
  Set titlesLocal = {};
  // use Set to store distinct titles
  for (var book in copyBooksData) {
    titlesLocal.add(book["title"]);
  }

  return titlesLocal;
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
