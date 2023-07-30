import 'classes.dart';
import 'addEditDelFuns.dart';
import 'purchaseFun.dart';
import 'queryBooks.dart';
import 'displayCategory.dart';
import 'data.dart';
import 'dart:io';

List<Book> booksList = loadDateToList();
List copyBooksData = booksData.toList();
Set titles = getDistinctTitles();
Library libarayName = Library(name: "Jarir");
void main() {
  print("---------------------");
  print("| Welcome To ${libarayName.name} |");
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
getDistinctTitles() {
  Set titlesLocal = {};
  // use Set to store distinct titles
  for (var book in copyBooksData) {
    titlesLocal.add(book["title"]);
  }

  return titlesLocal;
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
// to reduce repetition in the code
/// this function to ask user to enter all required data from user
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
