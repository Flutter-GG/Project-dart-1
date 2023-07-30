import 'dart:io';

import '../view_models/functions_view_model.dart';

pageDesigen() {
  booksLibrary books = booksLibrary(
      bookTitle: "",
      authorName: "",
      briefDescription: "",
      publicationDate: null,
      category: "",
      availableCopies: null,
      price: null);
  var count = 0;
  while (count < 10) {
    print("please select from menu:");
    print(
        "1: add new book ,2: display Books, 3: delete Book 4:Buying a book 5:query Book 6: Categories 7: Modifyt Q: quite");
    String selected = stdin.readLineSync()!;

    switch (selected.toUpperCase()) {
      case "1":
        books.addNewBook();
        break;

      case "2":
        books.displayBooks();
        break;
      case "3":
        books.deleteBook();
        break;
      case "4":
        books.buyingBook();
        break;
      case "5":
        books.queryBooks();
        break;
      case "6":
        books.booksCategory();
        break;
      case "7":
        books.updateBooks();

        break;

      case "Q":
        exit(0);

      default:
        print("Invaild Entry");
    }
    count++;
  }
}
