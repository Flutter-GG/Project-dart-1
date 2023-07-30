import 'dart:io';
import '../Data/admin_data.dart';
import '../Data/book_data.dart';

adminUser() {
  /**
   * This function is used in the SwitchCaseFunction 
   * It is called when the user chooses that he is a user admin
   * Its function displays the options of the type of switch what service you want
   */
  adminVerification();
  print("1:Add new book\n2:Delete book\n3:Update Book\nQ:Quite");
  String selected = stdin.readLineSync()!;
  switch (selected) {
    case "1":
      addNewBook();
      break;
    case "2":
      deleteBook();
      break;
    case "3":
      updateBook();
      break;
    case "Q" || "q":
      exit(0);

    default:
      print("wrong entry");
  }
}

adminVerification() {
  print("please enter admin Email?");
  String adminEmail = stdin.readLineSync()!;

  print("please enter admin Password?");
  String adminPass = stdin.readLineSync()!;

  bool isAdminFound = false;
  for (var admin in adminData) {
    if (adminEmail == admin['adminEmail'] && adminPass == admin['adminPass']) {
      isAdminFound = true;
      print("Welcome Admin user $adminEmail");
    }
  }
  if (!isAdminFound) {
    print("The account or password is incorrect");
    exit(0);
  }
}

addNewBook() {
  /**
   * This function is used in the adminUser function
   * its function Add a new book
   * It requests the values from the user and they are stored in a map called userMap and then added to bookData
   * In the event that the user enters an incorrect value at the price or the available copies, an error message appears
   */
  print("please inter book name?");
  String bookName = stdin.readLineSync()!;
  print("please inter Author Name?");
  String authorName = stdin.readLineSync()!;

  print("please inter Brief Description?");
  String briefDescription = stdin.readLineSync()!;

  print("please inter PublicationDate?");
  String publicationDate = stdin.readLineSync() ?? "2023";

  print("please inter Category?");
  String category = stdin.readLineSync()!;

  int availableCopies = 0;
  try {
    print("please enter Available Copies?");
    availableCopies = int.parse(stdin.readLineSync()!);
  } catch (availableCopies) {
    print("Invalid input. Please enter a numeric value for Available Copies.");
    return;
  }

  int price = 0;
  try {
    print("please enter Price?");
    price = int.parse(stdin.readLineSync()!);
  } catch (price) {
    print("Invalid input. Please enter a numeric value for Price.");
    return;
  }
  final userMap = {
    "book_Name": bookName,
    "author_Name": authorName,
    "brief_Description": briefDescription,
    "publication_Date": publicationDate,
    "Category": category,
    "Available_Copies": availableCopies,
    "Price": price,
  };
  bookData.add(userMap);
}

deleteBook() {
  /**
   * This function is used in the adminUser function'
   * Its function is to delete the book
   * It asks the user for a book name 
   * Its value is defined as an false with the name bookFound
   * The removeWhere function is used to delete the book by name, and if the book exists, a value is added to  bookFound = true and   return true; 
   * If the book is not found return false
   * if  bookFound = true It is deleted and a message is displayed
   * if  bookFound = false A message is displayed stating that the book does not exist
   */
  print("Please enter the name of the book that you want to delete?");
  String bookName = stdin.readLineSync()!;

  bool bookFound = false;
  bookData.removeWhere((book) {
    if (book['book_Name'] == bookName) {
      bookFound = true;
      return true;
    }
    return false;
  });

  if (bookFound == true) {
    print("Book '$bookName' has been deleted successfully.");
  } else {
    print("Book '$bookName' not found.");
  }
  ;
}

updateBook() {
  /**
   * This function is used in the adminUser function
   * Its function is to Update Book information
   * Take from the user the name of the book to be updated
   * Then you search for it through the indexWhere function through index
   * If index is not equal to -1, it means it exists and new information is requested to modify it
   * In the event that the user enters an incorrect value at the price or the available copies, an error message appears
   * After writing the new information is added
   * After writing the new information, it is Updateid in bookData
   * If index is -1, a message is displayed stating that the book does not exist
   */
  print("Please enter the name of the book that you want to update?");
  String bookName = stdin.readLineSync()!;
  var searchBook = bookData.indexWhere(
    (book) => book['book_Name'] == bookName,
  );

  if (searchBook != -1) {
    print("Please enter the updated book name?");
    String updatedBookName = stdin.readLineSync()!;

    print("Please enter the updated author name?");
    String updatedAuthorName = stdin.readLineSync()!;

    print("Please enter the updated brief description?");
    String updatedBriefDescription = stdin.readLineSync()!;

    print("Please enter the updated publication date?");
    String updatedPublicationDate = stdin.readLineSync() ?? "2023";

    print("Please enter the updated category?");
    String updatedCategory = stdin.readLineSync()!;

    int updatedAvailableCopies = 0;
    try {
      print("Please enter the updated available copies?");
      updatedAvailableCopies = int.parse(stdin.readLineSync()!);
    } catch (updatedAvailableCopies) {
      print(
          "Invalid input. Please enter a numeric value for Available Copies.");
      return;
    }
    int updatedPrice = 0;
    try {
      print("Please enter the updated price?");
      updatedPrice = int.parse(stdin.readLineSync()!);
    } catch (updatedPrice) {
      print("Invalid input. Please enter a numeric value for Price.");
      return;
    }

    bookData[searchBook] = {
      "book_Name": updatedBookName,
      "author_Name": updatedAuthorName,
      "brief_Description": updatedBriefDescription,
      "publication_Date": updatedPublicationDate,
      "Category": updatedCategory,
      "Available_Copies": updatedAvailableCopies,
      "Price": updatedPrice,
    };

    print("Book '$bookName' has been updated successfully.");
  } else {
    print("Book '$bookName' not found.");
  }
}
