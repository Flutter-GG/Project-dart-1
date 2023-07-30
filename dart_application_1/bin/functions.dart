import 'dart:io';
import 'data.dart';

//function 1 to add new book

addNewBooks() {
  try {
    print("please Enter book ID");
    int bookId = int.parse(stdin.readLineSync()!);
    print("please Enter the name of the book");
    String bookName = stdin.readLineSync() ?? "unknown";
    print("Please Enter the name of the author of the book ");
    String authorName = stdin.readLineSync() ?? "unknown";
    print("please inter book price");
    int price = int.parse(stdin.readLineSync()!);
    print("please Enter the number of copies of the book");
    int bookCopies = int.parse(stdin.readLineSync()!);

    final userMap = {
      "bookId": bookId,
      "bookName": bookName,
      "authorName": authorName,
      "price": price,
      "bookCopies": bookCopies
    };
    myData.add(userMap);
    print(userMap);
  } catch (error) {
    print("error");
  }
}

//function 3 for searching
searching() {
  print("Enter name of the book you want to search for\n");
  String searching = stdin.readLineSync() ?? "unknown";
  for (var index in myData) {
    if (index['bookName'] == searching) {
      print(
          "\nBook name: ${index['bookName']}\nFor author: ${index['authorName']}\nPrice: ${index['price']}\n bookCopies: ${index['bookCopies']}\n");
    }
  }
}

//function 4 for delete
void deleteItem() {
  try {
    print("please Enter name of book  you need delete");
    var removedValue = stdin.readLineSync()!;
    myData.removeWhere((myData) => myData['bookName'] == removedValue);
    print("The deleted book is $removedValue ");
  } catch (error) {
    print("error");
  }
}

//function 5 for get Available Copies
getAvailableCopies() {
  print(
      "Enter the name of the book you want to check whether it is available or not\n");
  String bookCopies = stdin.readLineSync() ?? "unknown";
  for (var index in myData) {
    if (index['bookName'] == bookCopies) {
      print(
          "The book: ${index['bookName']},\nhave '${index['bookCopies']}' Avalibale copies.\n");
    }
  }
}
