import 'dart:ffi';
import 'dart:io';

import '../models/data.dart';

class info {
  late String? bookTitle;
  late String? authorName;
  late String? briefDescription;
  late int? publicationDate;
  late String? category;
  late int? availableCopies;
  late int? price;

  info(
      {required this.bookTitle,
      required this.authorName,
      required this.briefDescription,
      required this.publicationDate,
      required this.category,
      required this.availableCopies,
      required this.price});
  displayData() {
    print(
        "Book Name:$bookTitle Author: $authorName Brief Description: $briefDescription Publication Date: $publicationDate Category : $category Avaliable copies : $availableCopies Price: $price");
  }
}

class booksLibrary extends info {
  booksLibrary(
      {required super.bookTitle,
      required super.authorName,
      required super.briefDescription,
      required super.publicationDate,
      required super.category,
      required super.availableCopies,
      required super.price});
  //DONE
  queryBooks() {
    try {
      print(
          "enter the book  title, author or category that you are looking for");
      String booktitle = stdin.readLineSync()!;
      for (var element in myData) {
        info book = (info(
          bookTitle: element["bookTitle"],
          authorName: element["authorName"],
          briefDescription: element["briefDescription"],
          publicationDate: element["publicationDate"],
          category: element["category"],
          availableCopies: element["availableCopies"],
          price: element["price"],
        ));
        if (booktitle == book.bookTitle ||
            booktitle == book.authorName ||
            booktitle == book.category) {
          print(book.bookTitle);
          print(book.availableCopies);
        }
      }
    } catch (error) {
      print("Sorry there is no book with  th given information");
    }
  }

//DONE
  booksCategory() {
    List mystery = ["The Blue Elephant"];
    List fiction = [
      "The Handmaid's Tale",
      "The Invisible Man",
      "Memory of the Body",
      "The Alchemist ",
      " Nineteen Minutes",
      "Pride and Prejudice",
      "1984",
      "   To Kill a Mockingbird"
    ];
    List nonFiction = ["A Brief History of Time"];
    List science = ["The Handmaid's Tale", "A Brief History of Time", "1984"];
    List romance = ["Memory of the Body", "Pride and Prejudice"];
    List shortStories = ["The Invisible Man"];
    List dystopian = ["The Handmaid's Tale", "1984"];
    List selfHelp = ["The Alchemist"];
    List drama = ["Nineteen Minutes", "To Kill a Mockingbird"];
    print("Enter the name category you want!");
    String? bookCategory = stdin.readLineSync();
    bookCategory!.toLowerCase();
    if (bookCategory == "fiction") {
      print(fiction);
    } else if (bookCategory == "mystery") {
      print(mystery);
    } else if (bookCategory == "non fiction") {
      print(nonFiction);
    } else if (bookCategory == "science") {
      print(science);
    } else if (bookCategory == "romance") {
      print(romance);
    } else if (bookCategory == "short stories") {
      print(shortStories);
    } else if (bookCategory == "dystopian") {
      print(dystopian);
    } else if (bookCategory == "self help") {
      print(selfHelp);
    } else if (bookCategory == "drama") {
      print(drama);
    } else {
      print("Sorry we do not have any book at this category");
    }
  }

  updateBooks() {
    late var wantToEdit;
    late var newBookTitle;
    print("Please enter the book title that you want to modify");
    wantToEdit = stdin.readLineSync();
    print("Now enter the new book title");
    newBookTitle = stdin.readLineSync();
    print("Now enter the new book Author");
    var newAuthor = stdin.readLineSync();
    print(" enter the new price");
    int newPrice = int.parse(stdin.readLineSync()!);
    var item =
        myData.firstWhere((element) => element["bookTitle"] == wantToEdit);

    if (wantToEdit == item['bookTitle']) {
      item['bookTitle'] = newBookTitle;
      item['price'] = newPrice;
      item['authorName'] = newAuthor;
      print("data have been changed ");
    }
  }

//DONE
  deleteBook() {
    try {
      print("please enter Book title");
      String booktitle = stdin.readLineSync()!;

      myData.removeWhere((element) => element["bookTitle"] == booktitle);
      print("the book have been deleted ");
      //print(myData);
    } catch (error) {
      print(error);
    }
  }

//DONE
  buyingBook() {
    try {
      print("Write the book that you want to buy !");
      String buy = stdin.readLineSync()!;
      var purches = myData.firstWhere((element) => element["bookTitle"] == buy);
      if (purches["availableCopies"] == 0) {
        print("Sorry we do not have any copies with this book");
      } else {
        if (purches != null) {
          purches["availableCopies"] = purches["availableCopies"] - 1;
          print('Thank you for your buying here is your the invoice');
          print("--Your purchesd book :$purches--");
        }
      }
    } catch (error) {
      print(error);
    }
  }

//DONE
  displayBooks() {
    try {
      List<info> listItem = [];
      for (var element in myData) {
        listItem.add(info(
          bookTitle: element["bookTitle"],
          authorName: element["authorName"],
          briefDescription: element["briefDescription"],
          publicationDate: element["publicationDate"],
          category: element["category"],
          availableCopies: element["availableCopies"],
          price: element["price"],
        ));
      }

      for (var item in listItem) {
        print("------------");
        item.displayData();
      }
    } catch (error) {
      print(error);
    }
  }

//DONE
  addNewBook() {
    try {
      print("please enter Book title");
      String bookTitle = stdin.readLineSync()!;
      print("please enter the author ");
      String authorName = (stdin.readLineSync()!);
      print("please enter  a brief description");
      String briefDescription = stdin.readLineSync()!;
      print("please enter publication date");
      int publicationDate = int.parse(stdin.readLineSync()!);
      print("please enter category sepreated with - ");
      String? category = stdin.readLineSync()!;

      print("please enter the avaliable copies");
      int availableCopies = int.parse(stdin.readLineSync()!);
      print("please enter the price");
      int price = int.parse(stdin.readLineSync()!);
      final userMap = {
        "bookTitle": bookTitle,
        "authorName": authorName,
        "briefDescription": briefDescription,
        "publicationDate": publicationDate,
        "category": category,
        "availableCopies": availableCopies,
        "price": price
      };
      myData.add(userMap);
    } catch (error) {
      print("error");
    }
  }
}
