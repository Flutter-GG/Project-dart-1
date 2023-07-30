import 'dart:io';
import 'package:firstapp/Purchase.dart';
import 'Search.dart';
import 'Books.dart';
import 'Data1.dart';

// final books2 = <Books>[];
void main() {
  while (true) {
    print('Enter 1 to add a book.');
    print('Enter 2 to delete a book by title.');
    print('Enter 3 to see All books availabli');
    print('Enter 4 to search on partcular book');
    print('Enter 5 to purchase a book.');
    print('Enter 6 to edite books');
    print('Enter 0 to exit.');
    final choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 0:
        exit(0);
        break;
      case 1:
        final book = Books.display();
        books.add(book);
        print('Book added successfully:');
        print('Title: ${book.title}');
        print('Author: ${book.author}');
        print('Copies: ${book.copies}');
        break;
      case 2:
        Books.delete(books);
        break;

      // default:
      //   print('Invalid choice. Please try again.');
      //   print('-------------------------------------');
      case 3:
        Search.displayAll(books);
        break;
      case 4:
        Search.searchP(books);
        // Data1.getBooks();
        break;

      case 5:
        Purchase.purchase(books);
        break;
      case 6:
        Books.edit(books);

        break;
    }
  }
}
