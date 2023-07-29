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
          book.display();
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

getDistinctTitles() {
  Set titlesLocal = {};
  // use Set to store distinct titles
  for (var book in copyBooksList) {
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
