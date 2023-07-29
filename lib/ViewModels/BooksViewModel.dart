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

  void createBook(Book newBook) {
    books.add(newBook);
  }

  void updateBookInfo(int bookIndex, Book updatedBook) {
    if (bookIndex >= 0 && bookIndex < books.length) {
      books[bookIndex] = updatedBook;
    }
  }

  void deleteBook(int bookIndex) {
    if (bookIndex >= 0 && bookIndex < books.length) {
      books.removeAt(bookIndex);
    }
  }

  void purchaseBook(int bookIndex, int numberOfCopies) {
    if (bookIndex >= 0 && bookIndex < books.length) {
      Book selectedBook = books[bookIndex];

      if (selectedBook.availableCopies >= numberOfCopies) {
        selectedBook.availableCopies -= numberOfCopies;
        double totalPrice = selectedBook.price * numberOfCopies;
        purchases.add({
          'title': selectedBook.title,
          'author': selectedBook.author,
          'numberOfCopies': numberOfCopies,
          'totalPrice': totalPrice,
        });
      } else {
        print('Insufficient copies available.');
      }
    }
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
}

void main() {
  String jsonFilePath = 'Assets/Data/books.json';

  BooksViewModel booksViewModel = BooksViewModel(jsonFilePath);

  // Example usage:
  // Search by title
  List<Book> searchedBooks = booksViewModel.searchBooksByTitle('1984');
  for (var book in searchedBooks) {
    print('Title: ${book.title}, Remaining Copies: ${book.availableCopies}');
  }

  // Create a new book and add it to the library
  Book newBook = Book(
    title: 'New Book Title',
    author: 'New Book Author',
    briefDescription: 'Brief Description of New Book',
    publicationDate: '2023',
    category: 'Fiction',
    price: 14.99,
    availableCopies: 50,
  );
  booksViewModel.createBook(newBook);

  // Update book info
  int bookIndexToUpdate = 0; // Index of the book you want to update
  Book updatedBook = Book(
    title: 'Updated Book Title',
    author: 'Updated Book Author',
    briefDescription: 'Updated Brief Description',
    publicationDate: '2022',
    category: 'Mystery',
    price: 12.99,
    availableCopies: 100,
  );
  booksViewModel.updateBookInfo(bookIndexToUpdate, updatedBook);

  // Delete a book
  int bookIndexToDelete = 1; // Index of the book you want to delete
  booksViewModel.deleteBook(bookIndexToDelete);

  // Purchase a book
  int bookIndexToPurchase = 2; // Index of the book you want to purchase
  int numberOfCopiesToPurchase = 3; // Number of copies to purchase
  booksViewModel.purchaseBook(bookIndexToPurchase, numberOfCopiesToPurchase);

  // Display all books in the library
  booksViewModel.displayAllBooks();

  // Display all purchases made by the user
  booksViewModel.displayPurchases();
}