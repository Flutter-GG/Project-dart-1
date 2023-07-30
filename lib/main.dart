import 'dart:io';
import 'books.dart';
   
   void main(List<String> arguments) {
  var count = 0;
  while (count < 10) {
    print(" ...... welcome to the library please choose a number ...... :");
    print(
        "1: desplay all books  2: add new book   3: search for a book   4: numbers of copies   5:edit a book  0:Exit");
    String selected = stdin.readLineSync()!;
    switch (selected) {
      case "1":
        displayItem();
        break;

      case "2":
      print('heee');
        addBook();
        break;

      case "3":
        searchBook();
        break;

      case "4":
         numberOfCopies();
        break;

      case "5":
        // getAvailableCopies();
        break;

      case "6":
        // buyABook();
        break;

      case "0":
        exit(0);

      default:
        print("enter a number");
    }
    count++;
  }
}
  

