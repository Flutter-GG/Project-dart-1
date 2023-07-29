import 'dart:convert';
import 'dart:io';
import '../Models/Book.dart';

class BooksViewModel {
  List<Book> books = [];
  List<Map<String, dynamic>> purchases = [];

  BooksViewModel(String jsonFilePath) {
    loadBooksFromJsonFile('Assets/Data/books.json');
  }

  void loadBooksFromJsonFile(String jsonFilePath) {
    String jsonString = File('Assets/Data/books.json').readAsStringSync();
    List<dynamic> jsonData = json.decode(jsonString);
    books = jsonData.map((json) => Book.fromJson(json)).toList();
  }

  List<Book> searchBooksByTitle(String title) {
    return books
        .where((book) => book.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
  }

  List<Book> searchBooksByAuthor(String author) {
    return books
        .where((book) => book.author.toLowerCase().contains(author.toLowerCase()))
        .toList();
  }

  List<Book> searchBooksByCategory(String category) {
    return books
        .where((book) => book.category.toLowerCase().contains(category.toLowerCase()))
        .toList();
  }

  void displayAllBooks() {
    for (var book in books) {
      print('Title: ${book.title}, Remaining Copies: ${book.availableCopies}');
    }
  }

void createBook() {
  // Read user input for the book details
  print("Enter the title of the new book:");
  String title = stdin.readLineSync() ?? '';

  print("Enter the author of the new book:");
  String author = stdin.readLineSync() ?? '';

  print("Enter a brief description of the new book:");
  String briefDescription = stdin.readLineSync() ?? '';

  print("Enter the publication date of the new book:");
  int publicationDate = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  print("Enter the category of the new book:");
  String category = stdin.readLineSync() ?? '';

  print("Enter the price of the new book:");
  double price = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

  print("Enter the number of available copies of the new book:");
  int availableCopies = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  // Create the new book object
  Book newBook = Book(
    title: title,
    author: author,
    briefDescription: briefDescription,
    publicationDate: publicationDate,
    category: category,
    price: price,
    availableCopies: availableCopies,
  );

  // Add the new book to the library
  books.add(newBook);

  print("New book added successfully:");
  printBookInfo(newBook);
}

void updateBookInfo() {
  // Read user input for the book index to update
  print("Enter the index of the book to update:");
  String? indexInput = stdin.readLineSync();
  int bookIndex = int.tryParse(indexInput ?? '') ?? -1;

  if (bookIndex >= 0 && bookIndex < books.length) {
    Book selectedBook = books[bookIndex];

    // Display the book info before updating
    print("Current book information:");
    printBookInfo(selectedBook);

    // Read user input for the property to update
    print("Which property do you want to update?");
    print("1: Title");
    print("2: Author");
    print("3: Brief Description");
    print("4: Publication Date");
    print("5: Category");
    print("6: Price");
    print("7: Available Copies");
    String? propertyInput = stdin.readLineSync();
    int propertyChoice = int.tryParse(propertyInput ?? '') ?? 0;

    // Read user input for the updated property value
    String? updatedValue;
    switch (propertyChoice) {
      case 1:
        print("Enter the updated title:");
        updatedValue = stdin.readLineSync();
        break;
      case 2:
        print("Enter the updated author:");
        updatedValue = stdin.readLineSync();
        break;
      case 3:
        print("Enter the updated brief description:");
        updatedValue = stdin.readLineSync();
        break;
      case 4:
        print("Enter the updated publication date:");
        updatedValue = stdin.readLineSync();
        break;
      case 5:
        print("Enter the updated category:");
        updatedValue = stdin.readLineSync();
        break;
      case 6:
        print("Enter the updated price:");
        updatedValue = stdin.readLineSync();
        break;
      case 7:
        print("Enter the updated number of available copies:");
        updatedValue = stdin.readLineSync();
        break;
      default:
        print("Invalid property choice.");
        return;
    }

    // Update the book property
    switch (propertyChoice) {
      case 1:
        selectedBook.title = updatedValue ?? '';
        break;
      case 2:
        selectedBook.author = updatedValue ?? '';
        break;
      case 3:
        selectedBook.briefDescription = updatedValue ?? '';
        break;
      case 4:
        int? updatedPublicationDate = int.tryParse(updatedValue ?? '');
        selectedBook.publicationDate = updatedPublicationDate ?? 0;
        break;
      case 5:
        selectedBook.category = updatedValue ?? '';
        break;
      case 6:
        double? updatedPrice = double.tryParse(updatedValue ?? '');
        selectedBook.price = updatedPrice ?? 0.0;
        break;
      case 7:
        int? updatedAvailableCopies = int.tryParse(updatedValue ?? '');
        selectedBook.availableCopies = updatedAvailableCopies ?? 0;
        break;
    }

    // Display the book info after updating
    print("Book information updated:");
    printBookInfo(selectedBook);
  } else {
    print("Invalid book index.");
  }
}


void deleteBook() {
  // Read user input for the book index to delete
  print("Enter the index of the book to delete:");
  String? indexInput = stdin.readLineSync();
  int bookIndex = int.tryParse(indexInput ?? '') ?? -1;

  if (bookIndex >= 0 && bookIndex < books.length) {
    // Delete the book from the library
    books.removeAt(bookIndex);
  } else {
    print("Invalid book index.");
  }
}



void purchaseBook() {
  if (books.isEmpty) {
    print("No books available for purchase.");
    return;
  }

  // Display the list of available books with numbers
  print("Available Books:");
  for (int i = 0; i < books.length; i++) {
    print("${i + 1}: ${books[i].title} (Remaining Copies: ${books[i].availableCopies})");
  }

  // Read user input for the book index to purchase
  print("Enter the number of the book you want to purchase:");
  String? bookInput = stdin.readLineSync();
  int bookIndex = int.tryParse(bookInput ?? '') ?? -1;

  if (bookIndex < 1 || bookIndex > books.length) {
    print("Invalid book number.");
    return;
  }

  int selectedBookIndex = bookIndex - 1;
  Book selectedBook = books[selectedBookIndex];

  // Read user input for the number of copies to purchase
  print("Enter the number of copies you want to purchase:");
  String? copiesInput = stdin.readLineSync();
  int numberOfCopies = int.tryParse(copiesInput ?? '') ?? 0;

  if (numberOfCopies <= 0) {
    print("Invalid number of copies.");
    return;
  }

  if (selectedBook.availableCopies < numberOfCopies) {
    print("Insufficient copies available.");
    return;
  }

  // Calculate the total price
  double totalPrice = selectedBook.price * numberOfCopies;

  // Generate the receipt
  print("Receipt:");
  print("Title: ${selectedBook.title}");
  print("Author: ${selectedBook.author}");
  print("Number of Copies Purchased: $numberOfCopies");
  print("Total Price: \$${totalPrice.toStringAsFixed(2)}");

  // Update the number of available copies
  selectedBook.availableCopies -= numberOfCopies;

  // Add the purchase to the purchases list
  purchases.add({
    'title': selectedBook.title,
    'author': selectedBook.author,
    'numberOfCopies': numberOfCopies,
    'totalPrice': totalPrice,
  });
}

  void displayPurchases() {
    if (purchases.isEmpty) {
      print('No purchases made yet.');
      return;
    }

    double totalAmount = 0.0;

    for (var purchase in purchases) {
      print('Title: ${purchase['title']}');
      print('Author: ${purchase['author']}');
      print('Number of Copies: ${purchase['numberOfCopies']}');
      print('Total Price: \$${purchase['totalPrice'].toStringAsFixed(2)}\n');
      totalAmount += purchase['totalPrice'];
    }

    print('Total Amount Spent: \$${totalAmount.toStringAsFixed(2)}');
  }

  void printBookInfo(Book book) {
  print("Title: ${book.title}");
  print("Author: ${book.author}");
  print("Brief Description: ${book.briefDescription}");
  print("Publication Date: ${book.publicationDate}");
  print("Category: ${book.category}");
  print("Price: ${book.price}");
  print("Available Copies: ${book.availableCopies}");
}


}