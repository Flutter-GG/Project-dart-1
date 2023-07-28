import 'dart:io';
import 'package:first_project/first_project.dart' as first_project;
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
        print("object");
        break;

      case "2":
        addNewBook();
        break;

      case "3":
        print("3 in progress");
        break;

      case "4":
        print(" 4 in progress");
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
    String? bookTitle = stdin.readLineSync()!;
    print("please inter author name:");
    String? authorName = stdin.readLineSync()!;
    print("please inter brief Description about the book:");
    String? briefDescription = stdin.readLineSync()!;
    print("please inter publication date:");
    String? publicationDate = stdin.readLineSync()!;
    print("please inter book category:");
    String? category = stdin.readLineSync()!;
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
    myData.add(bookMap);
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
  late String? price;

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
