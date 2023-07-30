import 'Books.dart';
import 'dart:io';
class Purchase{
  
  static void purchase(List<Books> books) {
    print('Enter the title of the book to purchase:');
    final titleToPurchase = stdin.readLineSync()!;
    final bookToPurchase = books.firstWhere(
      (book) => book.title == titleToPurchase,
      orElse: () => Books(title: '', author: '', copies: 0),
    );
    if (bookToPurchase.title.isNotEmpty) {
      print('How many copies do you want to purchase?');
      final copiesToPurchase = int.parse(stdin.readLineSync()!);
      if (copiesToPurchase <= bookToPurchase.copies) {
        bookToPurchase.copies -= copiesToPurchase;
        print('Purchase successful.');
      } else {
        print('Purchase failed: not enough copies in stock.');
      }
    } else {
      print('Book not found.');
    }
    
  }

}