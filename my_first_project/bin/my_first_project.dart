import 'dart:io';
import 'package:my_first_project/myData.dart';
import 'package:my_first_project/my_first_project.dart' as my_first_project;
import 'book.dart';
import 'library.dart';
import 'myData.dart';
void main(List<String> arguments) {
  var library = Library();

  print("Welcome to the Library!");

  while (true) {
    print("Please select from the menu:");
    print("1: Add new book,2: Display all books ,3: Search books ,4: Delete book ,5: Purchase book ,6: Edit book information ,Q: Quit");
  

    String? select = stdin.readLineSync();

    switch (select) {
      case "1":
        addNewItem(library);
        break;

      case "2":
        library.displayAllBooks();
        break;

      case "3":
        searchBooks(library);
        break;

      case "4":
        deleteBook(library);
        break;

      case "5":
        purchaseBook(library);
        break;

      case "6":
        editBookInformation(library);
        break;

      case "Q":
        print("Thank you!");
        return;

      default:
        print("Please try again.");
    }
  }
}

addNewItem(Library library) {
  try {
    print("Please enter Book Title:");
    String bookTitle = stdin.readLineSync() ?? "";

    print("Please enter Author Name:");
    String authorName = stdin.readLineSync() ?? "";

    print("Please enter Brief Description:");
    String briefDescription = stdin.readLineSync() ?? "";

    print("Please enter Publication Date:");
    int publicationDate = int.parse(stdin.readLineSync() ?? "");

    print("Please enter Category:");
    String category = stdin.readLineSync() ?? "";

    print("Please enter Available Copies:");
    int availableCopies = int.parse(stdin.readLineSync() ?? "");

    print("Please enter Price:");
    int price = int.parse(stdin.readLineSync() ?? "");

    Book newBook = Book(
      bookTitle: bookTitle,
      authorName: authorName,
      briefDescription: briefDescription,
      publicationDate: publicationDate,
      category: category,
      availableCopies: availableCopies,
      price: price,
    );

    library.addBook(newBook);
    print("Book added successfully");
  } catch (error) {
    print("Error: $error");
  }
}

  searchBooks(Library library) {
  print("Please enter the search keyword:");
  String keyword = stdin.readLineSync() ?? "";

  List<Book> searchResults = library.searchBooks(keyword);
  if (searchResults.isNotEmpty) {
    print("Search Results:");
    for (var book in searchResults) {
      print("----------------");
      book.displayData();
    }
  } else {
    print("No matching books found.");
  }
}

  deleteBook(Library library) {
  print("Please enter the title of the book to delete:");
  String title = stdin.readLineSync() ?? "";

  if (library.deleteBook(title)) {
    print("Book deleted successfully!");
  } else {
    print("Book with the given title not found.");
  }
}

  purchaseBook(Library library) {
  print("Please enter the title of the book to purchase:");
  String title = stdin.readLineSync() ?? "";

  if (library.purchaseBook(title)) {
    print("Purchase successful!");
  } else {
    print("Book with the given title not found or out of stock.");
  }
}

  editBookInformation(Library library) {
  print("Please enter the title of the book to edit:");
  String title = stdin.readLineSync() ?? "";

  Book? bookToEdit = library.getBookByTitle(title);
  if (bookToEdit == null) {
    print("Book is not found.");
    return;
  }

  print("What information do you want to edit?");
  print("1: Title ,2: Author Name ,3: Brief Description ,4: Publication Date ,5: Category ,6: Available Copies ,7: Price ,Q: Quit");

  String selection = stdin.readLineSync()?.toUpperCase() ?? "";
  switch (selection) {
    case "1":
      print("Enter new title:");
      bookToEdit.bookTitle = stdin.readLineSync() ?? bookToEdit.bookTitle;
      break;

    case "2":
      print("Enter new author name:");
      bookToEdit.authorName = stdin.readLineSync() ?? bookToEdit.authorName;
      break;
    case "3":
      print("Enter new brief description:");
      bookToEdit.briefDescription =
          stdin.readLineSync() ?? bookToEdit.briefDescription;
      break;

    case "4":
      print("Enter new publication date:");
      int? publicationDate = int.tryParse(stdin.readLineSync() ?? "");
      if (publicationDate != null) {
        bookToEdit.publicationDate = publicationDate;
      }
      break;

    case "5":
      print("Enter new category:");
      bookToEdit.category = stdin.readLineSync() ?? bookToEdit.category;
      break;

    case "6":
      print("Enter new available copies:");
      int? availableCopies = int.tryParse(stdin.readLineSync() ?? "");
      if (availableCopies != null) {
        bookToEdit.availableCopies = availableCopies;
      }
      break;

    case "7":
      print("Enter new price:");
      int? price = int.tryParse(stdin.readLineSync() ?? "");
      if (price != null) {
        bookToEdit.price = price;
      }
      break;

    case "Q":
      return;

    default:
      print("No changes made.");
  }
  print("Book information updated");
}

