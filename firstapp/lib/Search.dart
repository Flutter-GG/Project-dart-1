import 'Books.dart';
import 'dart:io';

class Search {
  static void displayAll(List<Books> books) {
    if (books.isEmpty) {
      print('There are no books in the library.');
    } else {
      print('All books in the library:');
      for (Books book in books) {
        print('${book.title} by ${book.author} - ${book.copies} copies');
      }
    }
  }

  static void searchP(List<Books> books) {
    print('Enter the title of the book to search for:');
    final titleToSearch = stdin.readLineSync()!;
    final bookToFind = books.firstWhere(
      (book) => book.title == titleToSearch,
      orElse: () => Books(title: '', author: '', copies: 0),
    );
    if (bookToFind.title.isNotEmpty) {
      print('Book found:');
      print('${bookToFind.title} by ${bookToFind.author} - ${bookToFind.copies} copies');
    } else {
      print('Book not found.');
    }
  }
}
