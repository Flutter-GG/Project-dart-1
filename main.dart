import 'dart:io';
import 'Book.dart';

List<Book> library = [];

main (){
showMainMenu();

}

showMainMenu(){

  starsLine();
  print("1. Query a book");
  print("2. Add a book");
  print("3. Delete a book");
  print("4. Update a book");
  print("5. Make a purchase");
  starsLine();
  print("Please select an option:");

  int? choice = int.parse(stdin.readLineSync()!);

  switch(choice){
    case 1:
      findABookMenu();
    break;
    case 2:
      addBook();
    break;
    case 3:
      deleteBook();
    break;
    case 4:
      updateBook();
    break;
    case 5:
      purchaseBooks();
    break;
    default: { 

      invaildOption();
   }
   break; 
  }
}

findABookMenu() {

  starsLine();
  print("How do you want to find the book:");
  print("1. Using it's title.");
  print("2. Using the author name.");
  print("3. Using the category of the book.");
  starsLine();

  print("Select an option:");
  int optionFind = int.parse(stdin.readLineSync()!);


  print("Please enter the search term:");
  String? searchTerm = stdin.readLineSync();
  if (searchTerm == null || searchTerm.isEmpty) {
    invaildOption();
    return;
  }

  Book? book;
  switch(optionFind){
    case 1:
      book = findBook(searchTerm, "title");
      print(book.toString());
    break;
    case 2:
      book = findBook(searchTerm, "author");
      print(book.toString());
    break;
    case 3:
      book = findBook(searchTerm, "category");
      print(book.toString());
    break;
    default: { 
      invaildOption();
   }
   break;
  }

  starsLine();
  print("To look for another book press [Y], otherwise return to main menu:");

  if(stdin.readLineSync() == "Y"){

    findABookMenu();
  } else{

    showMainMenu();
  }


}

Book? findBook(String searchTerm, String searchAttribute) {

  Book? targetBook = null;
  String bookSearchData;

  library.forEach((book) {
    
    if (searchAttribute == "title"){
      bookSearchData = book.bookTitle;
    } else if(searchAttribute == "author"){
      bookSearchData = book.bookAuthorName;
    } else {
      bookSearchData = book.category;
    }

    if (bookSearchData == searchTerm){
      targetBook = book;
    }
  });

  return targetBook;
}

addBook(){

  starsLine();
  print("Please enter the book title:");
  String title = stdin.readLineSync() ?? "";

  print("Please enter the book author:");
  String author = stdin.readLineSync() ?? "";

  print("Category of the book:");
  String category = stdin.readLineSync() ?? "";

  print("Number of copies to be added:");
  int numberOfCopies =  int.parse(stdin.readLineSync() ?? "");

  print("The price of the book:");
  int price =  int.parse(stdin.readLineSync() ?? "");

  library.add(Book(title, author, category, numberOfCopies, price));

  starsLine();
  print("Book was added successfully");
  starsLine();
  showMainMenu();
  
}

deleteBook(){

  starsLine();
  print("Enter book title:");
  String? bookTitle = stdin.readLineSync();
  if (bookTitle == null || bookTitle.isEmpty) {
    invaildOption();
    return;
  }

  library.remove(findBook(bookTitle, "title"));
  print("Book was removed successfully");
  showMainMenu();

}

updateBook(){
  starsLine();
  print("Enter book title:");
  String? bookTitle = stdin.readLineSync();
  if (bookTitle == null || bookTitle.isEmpty) {
    invaildOption();
    return;
  }

  Book? book = findBook(bookTitle, "title");

  print("Which data do you want to update:");
  print("1. Title");
  print("2. Author");
  print("3. Category");
  print("4. Number of copies");
  print("5. Price");

  print("Select an option:");
  int optionFind = int.parse(stdin.readLineSync()!);

  print("Input new value:");
  String? newValue = stdin.readLineSync();
  if (newValue == null || newValue.isEmpty) {
    invaildOption();
    return;
  }

  switch(optionFind){
    case 1:
      book!.bookTitle = newValue;
    break;
    case 2:
      book!.bookAuthorName = newValue;
    break;
    case 3:
      book!.category = newValue;
    break;
    case 4:
      book!.availableCopies = int.parse(newValue);
    break;
    case 5:
      book!.price = int.parse(newValue);
    break;
  }

   print("Book was updated successfully");
  showMainMenu();

}

purchaseBooks(){

  List<Book> books = [];

  do {
  starsLine();
  print("Enter book title:");
  String? bookTitle = stdin.readLineSync();
  if (bookTitle == null || bookTitle.isEmpty) {
    invaildOption();
    return;
  }

  books.add(findBook(bookTitle, "title")!);

  starsLine();
  print("To look for another book press [Y], otherwise checkout:");

  } while(stdin.readLineSync() == "Y");

  checkout(books);
}

checkout(List<Book> books){

  int totalCost = 0;
  books.forEach((book) { 

    print(book.toString());
    totalCost = totalCost + book.price;
    book.availableCopies--;
  });

  starsLine();
  print("Total cost: $totalCost");
  showMainMenu();
}

starsLine(){

  print("*******************************");
}

invaildOption(){

  print("Please enter a vaild option!");
  showMainMenu();
}