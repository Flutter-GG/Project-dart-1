import 'dart:io';
import 'data.dart';
import 'functions.dart';
import 'purchase.dart';

void main(List<String> arguments) {
  var count = 0;
  while (count < 10) {
    print("please select what do you want from menu:");
    print(
        "1: Add new book   2: View available Books   3: search a book   4: Delete a book   5:book availability   6:buy a book   7:Exit");
    String selected = stdin.readLineSync()!;
    switch (selected) {
      case "1":
        addNewBooks();
        break;

      case "2":
        displayBooks();
        break;

      case "3":
        searching();
        break;

      case "4":
        deleteItem();
        break;

      case "5":
        getAvailableCopies();
        break;

      case "6":
        buyABook();
        break;

      case "7":
        exit(0);

      default:
        print("There is no input value");
    }
    count++;
  }
}

//class
class BookLibary {
  late int bookId;
  late String bookName;
  late String authorName;
  late int price;
  late int bookCopies;

  BookLibary({
    required this.bookId,
    required this.bookName,
    required this.authorName,
    required this.price,
    required this.bookCopies,
  });

  displayData() {
    print(
        "bookId: $bookId bookName:$bookName   authorName: $authorName   price:$price   bookCopies: $bookCopies");
  }
}

//method 1 (display)
displayBooks() {
  List<BookLibary> listItem = [];
  for (var element in myData) {
    listItem.add(BookLibary(
        bookId: element['bookId'],
        bookName: element["bookName"],
        authorName: element["authorName"],
        price: element["price"],
        bookCopies: element["bookCopies"]));
  }
  for (var item in listItem) {
    print("---------------------");
    item.displayData();
  }
}
