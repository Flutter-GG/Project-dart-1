// ignore_for_file: slash_for_doc_comments

import 'dart:io';
import '../Class/Book.dart';
import '../Data/book_data.dart';

endUser() {
  /**
   * This function is used in the SwitchCaseFunction 
   * It is called when the user chooses that he is a user End User
   * Its function displays the options of the type of switch what service you want
   */
  print("Welcome End User");
  print(
      "1:Display Book\n2:Search Book\n3:Pay Book\n4:Show Category\n5:show Purchased Books\nQ:quite");
  String selected = stdin.readLineSync()!;
  switch (selected) {
    case "1":
      displayBook();
      break;
    case "2":
      searchBook();
      break;
    case "3":
      payBook();
      break;
    case "4":
      showCategory();
      break;
    case "5":
      showPurchasedBooks();
      break;
    case "Q" || "q":
      exit(0);

    default:
      print("wrong entry");
  }
}

displayBook() {
  /**
   * This function is used in the endUser function
   * its function display book
   * A new list is being created And through for displays all values in bookData
   */
  List<Book> listBook = [];
  for (var books in bookData) {
    listBook.add(Book(
        book_Name: books['book_Name'],
        author_Name: books['author_Name'],
        brief_Description: books['brief_Description'],
        publication_Date: books['publication_Date'],
        Category: books['Category'],
        Available_Copies: books['Available_Copies'],
        Price: books['Price']));
  }
  for (var book in listBook) {
    print("------------");
    book.displayBook();
  }
}

searchBook() {
  /**
   * This function is used in the endUser function
   * its function search Book
   * Inside it there is a new function that receives the type and the type is determined by the user's choices
   * If the book does not exist, null is added and the message The book is not found is displayed
   */
  entranceType(String type) {
    print("Please enter the $type of the book that you want to search?");
    String search = stdin.readLineSync()!;
    var foundBook = bookData.firstWhere(
      (book) => book[type] == search,
      orElse: () => null,
    );

    if (foundBook != -1) {
      print("Book Name: ${foundBook['book_Name']}");
      print("Author Name: ${foundBook['author_Name']}");
      print("Brief Description: ${foundBook['brief_Description']}");
      print("Publication Date: ${foundBook['publication_Date']}");
      print("Category: ${foundBook['Category']}");
      print("Available Copies: ${foundBook['Available_Copies']}");
      print("Price: ${foundBook['Price']}");
    } else {
      print("Book '$search' not found.");
    }
  }

  print("Please select from the menu:");
  print(
      "1: Search Book by name, 2: Search Book by author name, 3: Search Book by category");
  String selected = stdin.readLineSync()!;

  switch (selected) {
    case "1":
      entranceType('book_Name');
      break;

    case "2":
      entranceType('author_Name');
      break;

    case "3":
      entranceType('Category');
      break;

    default:
      print("Wrong entry.");
  }
}

List<Map<String, dynamic>> purchasedBooks = [];
int totalSales = 0;
payBook() {
/**
   * This function is used in the endUser function
   * its function Pay Book
   * Ask the user for a book to search for
   * A message is displayed if he is sure and wants to buy the book, and the name of the book is displayed along with its price
   * If he chooses Y, the purchase is displayed with a simplified invoice containing the name of the book and its price
   * A copy is reduced from the copies available in available copies
   * The name of the book and its price are added in a list called PurchaseBooks to be displayed later as an inventory record
   * And the amount is added to the totalSales variable to be displayed later
   * If he chooses N, messages are displayed that the purchase was canceled
   * 
 */
  print("Please enter the name of the book that you want to pay?");
  String bookName = stdin.readLineSync()!;

  var bookIndex = bookData.indexWhere((book) => book['book_Name'] == bookName);

  if (bookIndex != -1) {
    var selectedBook = bookData[bookIndex];
    int price = selectedBook['Price'];
    int availableCopies = selectedBook['Available_Copies'];

    print(
        "Are you sure you want to pay for $bookName? The price is \$${price.toStringAsFixed(2)}");
    print("Choose 'Y' to pay or 'N' to cancel.");
    String areYouSure = stdin.readLineSync()!.toLowerCase();

    if (areYouSure.toLowerCase() == 'y') {
      print("Successfully paid This is your receipt:");
      print("Book: $bookName");
      print("Price: $price");
      selectedBook['Available_Copies'] = availableCopies - 1;
      purchasedBooks.add({"Book": bookName, "Price": price});
      totalSales += price;
    } else if (areYouSure.toLowerCase() == 'n') {
      print("Payment canceled.");
    } else {
      print("Wrong entry.");
    }
  } else {
    print("Book '$bookName' not found.");
  }
}

showCategory() {
  /**
   * This function is used in the endUser function
   * its function show Category
   * The function is to display books by classifying them
   * The way it works is similar to that of searchBook
   */
  Set<String> categories = {};
  for (var book in bookData) {
    categories.add(book['Category']);
  }
  print("Available Categories: ${categories.join('\n ')}");

  print("Please enter the Category of the book you want to search?");
  String chosenCategory = stdin.readLineSync()!;

  List<Book> booksInChosenCategory = [];
  for (var element in bookData) {
    if (element['Category'] == chosenCategory) {
      booksInChosenCategory.add(Book(
        book_Name: element['book_Name'],
        author_Name: element['author_Name'],
        brief_Description: element['brief_Description'],
        publication_Date: element['publication_Date'],
        Category: element['Category'],
        Available_Copies: element['Available_Copies'],
        Price: element['Price'],
      ));
    }
  }

  if (booksInChosenCategory.isNotEmpty) {
    print("Books in Category '$chosenCategory':");
    for (var book in booksInChosenCategory) {
      print("------------");
      book.displayBook();
    }
  } else {
    print("This Category does not exist '$chosenCategory'.");
  }
}

showPurchasedBooks() {
  /**
   * This function is used in the endUser function
   * Its function is to display the books that have been purchased if they exist and were previously stored in purchasedBooks
   */
  print("\n-- Purchased Books --");
  if (purchasedBooks.isEmpty) {
    print("No books have been purchased yet.");
  } else {
    for (var book in purchasedBooks) {
      print("Book: ${book['Book']}, Price: ${book['Price']}\$");
    }
    print("Total Sales: $totalSales\$");
  }
}
