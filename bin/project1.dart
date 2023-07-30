import 'dart:io';
import 'book_data1.dart';

// 
// stdin.readLineSync()??"" is equal to if(stdin.readLineSync() == null) then ""

List<Book> getBooksData() {
  // for (var book in myData) {
  //   return Book.fromJson(book);
  // }

  final booksList = myData.map((book) {
    return Book.fromJson(book);
  }).toList();

  return booksList;
}
class Book {
  String? bookTitle;
  String ?authorName;
  String? briefDescription;
  String? publicationDate;
  String? category;
  int? availableCopies;
  double? price;

  Book({this.bookTitle, this.authorName, this.briefDescription, this.publicationDate, this.category, this.availableCopies, this.price});
// to.String() is a function that override the default function.
  String toString() {
    return "Book Title: ${this.bookTitle}\nAuthor Name: ${this.authorName}\nBrief Description: ${this.briefDescription}\nPublication Date: ${this.publicationDate}\nCategory: ${this.category}\nAvailable Copies: ${this.availableCopies}\nPrice: ${this.price}";
  }

  // from json converts a json object to a dart object
  Book.fromJson(Map<String, dynamic> json)
      : bookTitle = json['Book_Title'],
        authorName = json['Author Name'],
        briefDescription = json['Brief Description'],
        publicationDate = json['PublicationDate'],
        category = json['Category'],
        availableCopies = json['AvailableCopies'],
        price = json['Price'].toDouble();

  // to json converts a dart object to a json object
  Map<String, dynamic> toJson() => {
        'Book_Title': bookTitle,
        'Author Name': authorName,
        'Brief Description': briefDescription,
        'PublicationDate': publicationDate,
        'Category': category,
        'AvailableCopies': availableCopies,
        'Price': price,
      };
}

void main(List<String> args) {
  print("Welcome to our Book Store");

  int choice = 0;

  while (choice != 6) {
    print(
        "Please Choose the service that you want to do:\n 1- Add a new book\n 2- Search for a book\n 3- Edit a book\n 4- Delete a book\n 5- Purchase a book\n 6- Exit the application\n");
    choice = int.parse(stdin.readLineSync() ?? "");

    switch (choice) {
      case 1:
        // Call function to add a new book
        addBook();
        break;
      case 2:
      // call function to search for a book
        searchBook();
        break;
      case 3:
        // Call function to Edit a book
        editBook();
        break;
      case 4:
        // Call function to delete a book
        deleteBook();
        break;
      case 5:
        // Call function to purchase a book
       PurchaseBook(); 
        break; 
      case 6:
        // Exit the application
        print("Thank you for using our application");

        break;
      default:
        print("Invalid choice");
    }
  }
}

void addBook() {
  // Code to add a new book
  print("Please enter the book title:");
  String bookTitle = stdin.readLineSync() ?? "";
  print("Please enter the author name:");
  String authorName = stdin.readLineSync() ?? "";
  print("Please enter the brief description:");
  String briefDescription = stdin.readLineSync() ?? "";
  print("Please enter the publication date:");
  String publicationDate = stdin.readLineSync() ?? "";
  print("Please enter the category:");
  String category = stdin.readLineSync() ?? "";
  print("Please enter the available copies:");
  int availableCopies = int.parse(stdin.readLineSync() ?? "");
  print("Please enter the price:");
  double price = double.parse(stdin.readLineSync() ?? "");
  
  final newBook = Book(
    bookTitle: bookTitle,
    authorName: authorName,
    briefDescription: briefDescription,
    publicationDate: publicationDate,
    category: category,
    availableCopies: availableCopies,
    price: price.toDouble(),
  );
}

void searchBook() {
  int choice = 0;

  while (choice != 4) {
    print("Please Choose the service that you want to do:\n 1- Search by book title\n 2- Search by author name\n 3- Search by category\n 4- Exit the search\n");
    choice = int.parse(stdin.readLineSync() ?? "");

    switch (choice) {
      case 1:
        searchBookByTitle();
        break;
      case 2:
        // Call function to search by author name
        searchBookByAuthorName();
        break;
      case 3:
      searchBookByCategory();
        break;
      case 4:
        // Exit the search
        print("Thank you for using our application");
        break;
      default:
        print("Invalid choice");
    }
  }
}

void searchBookByTitle() {
  print("Please enter the book title that you want to search for:");
  String inputBookTitle = stdin.readLineSync() ?? "";

  final booksList = getBooksData();

  List<Book> foundedBooks = [];
  for (var book in booksList) {
    if (book.bookTitle!=null && book.bookTitle!.toLowerCase().contains(inputBookTitle.toLowerCase())) {
      foundedBooks.add(book);
    }
  }
  if (foundedBooks.isEmpty) {
    print("No books found with this title");
  } else {
    print("The Founded books with this title are:");
    for (var book in foundedBooks) {
      print(book);
      print("");
    }
  }
}
void searchBookByAuthorName() {
  // Code to search by author name
  print("Please enter the author name that you want to search for:");
  String authorName = stdin.readLineSync() ?? "";
  final booksList = getBooksData();
  List<Book> foundedBooks = [];
  for (var book in booksList) { 
    if (book.authorName!=null && book.authorName!.toLowerCase().contains(authorName.toLowerCase())) {
      foundedBooks.add(book);
    }
  } if(foundedBooks.isEmpty){
    print("No books found with this author name");
  } else {
    print("The Founded books with this author name are:");
    for (var book in foundedBooks) {
      print(book);
      print("");
    }
  }
} 
void searchBookByCategory() {
  // Code to search by category
  print("please enter the catagory that you want to search for:");
  String category = stdin.readLineSync() ?? "";
  final booksList = getBooksData();
  List<Book> foundedBooks = [];
  for (var book in booksList) { 
    if (book.category!=null && book.category!.toLowerCase().contains(category.toLowerCase())) {
      foundedBooks.add(book);
    }
  } if(foundedBooks.isEmpty){
    print("No books found with this category");
  } else {
    print("The Founded books with this category are:");
    for (var book in foundedBooks) {
      print(book);
      print("");
    }
  }
}

void editBook() {
  // Code to Edit a book
  print("Please Enter the book title that you want to edit:");
  String bookTitle = stdin.readLineSync() ?? "";
  final booksList = getBooksData();
  List<Book> foundedBooks = [];
  for (var book in booksList) {
    if (book.bookTitle!=null && book.bookTitle!.toLowerCase().contains(bookTitle.toLowerCase())) {
      foundedBooks.add(book);

      bool exit = false;
      while (!exit) {
        print("The current infromation of the book is the following:");
        print(book);
        print("");
        print("Please Choose the service that you want to do:\n 1- Edit book title\n 2- Edit author name\n 3- Edit brief description\n 4- Edit publication date\n 5- Edit category\n 6- Edit available copies\n 7- Edit price\n 8- Exit the edit\n");
        int choice = int.parse(stdin.readLineSync() ?? "");
        switch (choice) {
          case 1:
            print("Please enter the new book title:");
            String newBookTitle = stdin.readLineSync() ?? "";
            book.bookTitle = newBookTitle;
            break;
          case 2:
            print("Please enter the new author name:");
            String newAuthorName = stdin.readLineSync() ?? "";
            book.authorName = newAuthorName;
            break;
          case 3:
            print("Please enter the new brief description:");
            String newBriefDescription = stdin.readLineSync() ?? "";
            book.briefDescription = newBriefDescription;
            break;
          case 4:
            print("Please enter the new publication date:");
            String newPublicationDate = stdin.readLineSync() ?? "";
            book.publicationDate = newPublicationDate;
            break;
          case 5:
            print("Please enter the new category:");
            String newCategory = stdin.readLineSync() ?? "";
            book.category = newCategory;
            break;
          case 6:
            print("Please enter the new available copies:");
            int newAvailableCopies = int.parse(stdin.readLineSync() ?? "");
            book.availableCopies = newAvailableCopies;
            break;
          case 7:
            print("Please enter the new price:");
            double newPrice = double.parse(stdin.readLineSync() ?? "");
            book.price = newPrice.toDouble();
            break;
          case 8:
            print("Thank you for using our application");
            exit = true;
            break;
          default:
            print("Invalid choice");
        }
      }
    }
  }
}

void deleteBook() {
  // Code to delete a book
  print("Please enter the book title that you want to delete:");
  String bookTitle = stdin.readLineSync() ?? "";
  final booksList = getBooksData();
  List<Book> foundedBooks = [];
  for (var book in booksList) { 
    if (book.bookTitle!=null && book.bookTitle!.toLowerCase().contains(bookTitle.toLowerCase())) {
      foundedBooks.add(book);
    }
  } if(foundedBooks.isEmpty){
    print("No books found with this title");
  } else { booksList.remove(foundedBooks);
    print("The Founded books with this titles will be removed:");
    for (var book in foundedBooks) { 
      print(book);
      print("");
    }
}
} 
void PurchaseBook(){
  print("Please enter the book title that you want to purchase:");

  String bookTitle = stdin.readLineSync() ?? "";  
  final booksList = getBooksData();
  List<Book> foundedBooks = [];
  for(var book in booksList){
    if (book.bookTitle!=null && book.bookTitle!.toLowerCase().contains(bookTitle.toLowerCase())) {
      foundedBooks.add(book);
    }
  } if(foundedBooks.isEmpty){
    print("No books found with this title");
  } else if(foundedBooks.isNotEmpty){ {
    print("Thet book you want to purchase is:");
    for (var book in foundedBooks) {
      print(book);
      print("");
      List<Book> purchasedBooks = [];
      purchasedBooks.add(book);
      print("Please enter the number of copies you want to purchase:");
      int numberOfCopies = int.parse(stdin.readLineSync() ?? "");
      if (numberOfCopies <= book.availableCopies!) {
        print("The total price is: ${book.price! * numberOfCopies}");
        book.availableCopies = book.availableCopies! - numberOfCopies;
        print("The number of available copies is: ${book.availableCopies}");
        
      } else {
        print("The number of available copies is: ${book.availableCopies}");
        print("The number of copies you want to purchase is not available");
      
      }
    }
  }}}