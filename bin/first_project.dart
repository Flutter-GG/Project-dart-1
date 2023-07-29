import 'dart:io';
import 'package:first_project/book_data.dart';

void main(List<String> arguments) {
  var count = 0;
  while (count < 10) {
    print("Welcome to Wejdan Library!");
    print("please select from menu:");
    print(
        "1: View the available books, 2: Add new book, 3: Delete book, 4: Make book purchases, Q: quite.");
    String selected = stdin.readLineSync()!;

    switch (selected) {
      case "1":
        displayAvailableBook();
        break;

      case "2":
        addNewBook();
        break;

      case "3":
        deleteBook();
        break;

      case "4":
        print("$myData[0]['briefDescription']");
        break;

      case "Q" || "q":
        exit(0);

      default:
        print("Wrong choese!");
    }
    count++;
  }
}

addNewBook() {
  try {
    print("please inter book title:");
    String bookTitle = stdin.readLineSync()!;
    print("please inter author name:");
    String authorName = stdin.readLineSync()!;
    print("please inter brief Description about the book:");
    String briefDescription = stdin.readLineSync()!;
    print("please inter publication date:");
    String publicationDate = stdin.readLineSync()!;
    print("please inter book category:");
    String category = stdin.readLineSync()!;
    print("please inter available copies of the book:");
    int availableCopies = int.parse(stdin.readLineSync()!);
    print("please inter the book price:");
    int price = int.parse(stdin.readLineSync()!);

    final bookMap = {
      "bookTitle": bookTitle,
      "authorName": authorName,
      "briefDescription": briefDescription,
      "publicationDate": publicationDate,
      "category": category,
      "availableCopies": availableCopies,
      "price": price
    };
    myData.insert(0, bookMap);
    print("The book has been added successfully!");
  } catch (error) {
    print("error");
  }
}

deleteBook() {
  try {
    print("please inter book title:");
    String bookTitle = stdin.readLineSync()!;
    for (int i = 0; i <= myData.length - 1; i++) {
      if (myData[i]['bookTitle'] == bookTitle) {
        myData.removeWhere((item) => item["bookTitle"] == bookTitle);
        print("The book has been deleted successfully!");
      } else if (i == myData.length - 1) {
        print(
            "The book does not exist! please check the spelling and try again.");
      }
    }
  } catch (error) {
    print("error");
  }
}

class Book {
  late String? bookTitle;
  late String? authorName;
  late String? briefDescription;
  late String? publicationDate;
  late String? category;
  late int? availableCopies;
  late int? price;

  Book(
      {this.bookTitle,
      this.authorName,
      this.briefDescription,
      this.publicationDate,
      this.category,
      this.availableCopies,
      this.price});
  displayData() {
    print(
        "Book Title:$bookTitle Author Name: $authorName Brief Description: $briefDescription Publication Date: $publicationDate Category: $category Available Copies: $availableCopies Price: $price");
  }
}

displayAvailableBook() {
  List<Book> listItem = [];
  for (var element in myData) {
    listItem.add(Book(
      bookTitle: element["bookTitle"],
      authorName: element["authorName"],
      briefDescription: element["briefDescription"],
      publicationDate: element["publicationDate"],
      category: element["category"],
      availableCopies: element["availableCopies"],
      price: element["price"],
    ));
  }
  int number = 1;
  for (var item in listItem) {
    print("------$number------");
    number++;
    item.displayData();
  }
}
