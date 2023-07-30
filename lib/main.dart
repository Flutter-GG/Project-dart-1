import 'dart:io';
import 'books.dart';
   
   void main(List<String> arguments) {
  var count = 0;
  while (count < 10) {
    print(" ...... welcome to the library please choose a number ...... :");
    print(
        "1: desplay all books  2: add new book   \n 3: search for a book   4: delete a book \n 5:edit a book  0:Exit");
    String num = stdin.readLineSync()!;
    switch (num) {
      case "1":
        displayItem();
        break;

      case "2":
        addBook();
        break;

      case "3":
        searchBook();
        break;

      case "4":
         deleteBook();
        break;

      case "5":
        // editBook();
        break;

      
      case "0":
        exit(0);

      default:
        print("enter a number");
    }
    count++;
  }
}
  

