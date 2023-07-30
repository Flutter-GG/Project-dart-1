import 'books_data.dart';
import 'class_book.dart';
import 'library_methods.dart';
import 'dart:io';

void main() {

  //adding the data to a list of book object
  List <Book> booklist = [];
  for (int i = 0; i < booksList.length; i++) {
    booklist.add(Book(
        title: booksList[i]['title'],
        author: booksList[i]['author'],
        category: booksList[i]['category'],
        numCopies: booksList[i]['avaliable copies'],
        price: booksList[i]['price']));
  }
 /* for (var element in booklist) {
    element.display();
  }*/
  
  int adminPass = 1234; // a password to enter the the library's admin menu

  print("Hello, Welcome to Reema's Library!!");

  print('Choose are you an 1-Admin or 2-Client (1 or 2): ');
  int userType = int.parse(stdin.readLineSync()!);

  //if the user choose 1 he has to give the password so that he can add or delete a book
  if (userType == 1) {
    print('Enter the password:');
    int passCheck = int.parse(stdin.readLineSync()!);
    //check if the password is correct
    if (passCheck == adminPass) {
      //Correct --> displaying the admin menu
      var count = 0;

      while (count < 10) {
        print("please select a number from the admin menu for any services: ");

        print(" 1:Add new book\n 2:Delete a book\n 3:Edit a book\n 4: quit");

        int selectedNum = int.parse(stdin.readLineSync()!);
        switch (selectedNum) {
          case 1:
            addBook(booklist);
            break;
          case 2:
            deleteBook(booklist);
            break;
          case 3:
            editBooks(booklist);
            break;
          case 4:
            exit(0);
          default:
            print("Wrong choice, Please choose from the menu");
        }
        count++;
      }
    } else {
      print("Wrong password try again");
    }
    //else if for the outer if statement
  } else if (userType == 2) {
    var count = 0;
    while (count < 10) {
      print('please select a number from the client menu for any services:');
      print(
          " 1:Purchase a book\n 2:Search for a book\n 3:Display all the catgories\n 4: quit");

      int selectedNum = int.parse(stdin.readLineSync()!);
      switch (selectedNum) {
        case 1:
          purchaseBook(booklist);
          break;
        case 2:
          searchBooks(booklist);
          break;
        case 3:
          catagoryDisplay(booklist);
          break;
        case 4:
          exit(0);
        default:
          print("Wrong choice, Please choose from the menu");
      }
      count++;
    }
    //else for the outer if statement if the user did not choose 1 or 2
  } else {
    print('wrong number choose 1 or 2');
  }
}
