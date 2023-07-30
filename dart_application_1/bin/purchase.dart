import 'dart:io';
import 'dart_application_1.dart';
import 'data.dart';

//function make purchase
buyABook() {
  print("What book do you want to buy?");
  for (var pointer = 0; pointer < myData.length; pointer++) {
    if (myData.isEmpty) {
      print("$pointer: ${myData[pointer]['bookName']}, is sold out\n");
    } else {
      print(
          "$pointer: ${myData[pointer]['bookName']}, '${myData[pointer]['bookCopies']}',copies\n");
    }
  }
  print("Enter the book ID you want to buy?");
  String userInput = stdin.readLineSync() ?? "";
  int bookNumber = int.tryParse(userInput) ?? -1;

  if (bookNumber < 1 || bookNumber > myData.length) {
    print("Invalid book number.");
    return;
  }

  int BookIndex = bookNumber - 1;
  Map booksSelected = myData[BookIndex];
  BookLibary b = BookLibary(
      bookId: booksSelected['bookId'],
      bookName: booksSelected['bookName'],
      authorName: booksSelected['authorName'],
      price: booksSelected['price'],
      bookCopies: booksSelected['bookCopies']);
  print("Enter the number of copies you want to purchase:");
  String? inputCopy = stdin.readLineSync();
  int numOfCopies = int.tryParse(inputCopy ?? '') ?? 0;

  if (numOfCopies <= 0) {
    print("Invalid number of copies.");
    return;
  }

  if (booksSelected['bookCopies'] < numOfCopies) {
    print("There are not enough copies");
    return;
  }

  var totalPrice = booksSelected['price'] * numOfCopies;

  print("Purchase Invoice:");
  print("bookName: ${booksSelected['bookName']}");
  print("authorName: ${booksSelected['authorName']}");
  print("Number of Copies Purchased: $numOfCopies");
  print("Total Price: \$${totalPrice.toStringAsFixed(2)}");

  booksSelected['bookCopies'] -= numOfCopies;

  myData.add({
    'bookName': booksSelected['bookName'],
    'authorName': booksSelected['authorName'],
    'numberOfCopies': numOfCopies,
    'totalPrice': totalPrice,
  });
}

//function for displayPurchases()
void displayPurchases() {
  if (myData.isEmpty) {
    print('No purchases made yet.');
    return;
  }

  var totalAmount = 0.0;

  for (var purchase in myData) {
    print('bookName: ${purchase['bookName']}');
    print('authorName: ${purchase['authorName']}');
    print('numberOfCopies: ${purchase['numberOfCopies']}');
    print('totalPrice: \$${purchase['totalPrice'].toStringAsFixed(2)}\n');
    totalAmount += purchase['totalPrice'];
  }

  print('Total Amount Spent: \$${totalAmount.toStringAsFixed(2)}');
}
