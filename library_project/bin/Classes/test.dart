import 'dart:io';

import '../Data/libraryData.dart';

// Define the libraryData list with book information
List libraryData = theLibrary;

class Library {
  String? title;
  String? author;
  List? categories;
  double? price;
  int? availableCopies;

  Library({
    this.title,
    this.author,
    this.categories,
    this.price,
    this.availableCopies,
  });
}

class View extends Library {
  void viewAvailableCopies() {
    String availableCopies = "";
    for (var index in libraryData) {
      if (index['avalibale copies'] >= 3) {
        availableCopies +=
            "The book: ${index['title']},\nhas '${index['avalibale copies']}' Avalibale copies.\n\n";
      } else if (index['avalibale copies'] >= 1 &&
          index['avalibale copies'] < 3) {
        availableCopies +=
            "The book: ${index['title']},\nis only has '${index['avalibale copies']}' Avalibale copies!!!.\n\n";
      } else if (index['avalibale copies'] == 0) {
        availableCopies += "The book: ${index['title']},\nis sold out.\n\n";
      }
    }
    print(availableCopies);
  }

  void viewCategories() {
    List allCategories = [];
    for (var index in libraryData) {
      for (var category in index['categories']) {
        if (!allCategories.contains(category)) {
          allCategories.add(category);
        }
      }
    }
    String availableCategories = "\nWe have categories: $allCategories\n";
    print(availableCategories);
  }

  void viewBooks() {
    String bookDetails = "";
    for (var index in libraryData) {
      bookDetails +=
          "\nThe book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navalibale copies: ${index['avalibale copies']}\n\n";
    }
    print(bookDetails);
  }
}

class Search extends Library {
  void searchByQuery() {
    try {
      print("\nPlease select what you want to search by:");
      print("\n1: by title name\n2: by author name\n3: by category\n");
      String userSelector = stdin.readLineSync()!;

      searchingByFunc({required String userInput, required String index}) {
        String book = "";
        for (var item in libraryData) {
          String theKey = item[index].toString().toLowerCase();
          if (theKey.contains(userInput.toLowerCase())) {
            book +=
                "\nBook name: ${item['title']}\nFor author: ${item['author']}\nFirst published: ${item['First published']}\nCategories: ${item['categories']}\nPrice: ${item['price']}\$\nAvalibale copies: ${item['avalibale copies']}\n\n";
          }
        }
        print(book);
      }

      switch (userSelector.toLowerCase()) {
        case '1':
          print("\nWrite the 'title' of the book:");
          String userInput = stdin.readLineSync()!;
          searchingByFunc(userInput: userInput, index: 'title');
          break;
        case '2':
          print("\nWrite the 'author' of the book:");
          String userInput = stdin.readLineSync()!;
          searchingByFunc(userInput: userInput, index: 'author');
          break;
        case '3':
          print("\nWrite the 'category' of the book:");
          String userInput = stdin.readLineSync()!;
          searchingByFunc(userInput: userInput, index: 'categories');
          break;
        case 'q':
          exit(0);
        default:
          print("\n'$userSelector' is not a valid number");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}

class Edits extends Library {
  void addNewBook() {
    try {
      print("please enter title (press q to exit):");
      String title = stdin.readLineSync() ?? "";
      if (title.toLowerCase() == 'q') {
        print("We didn't add any book");
        exit(0);
      }
      print("\nplease enter author name:");
      String author = stdin.readLineSync() ?? "";
      print("\nplease enter copies:");
      int copies = int.parse(stdin.readLineSync() ?? "");
      print("\nplease enter price:");
      double price = double.parse(stdin.readLineSync() ?? "");
      print("\nplease enter publish date:");
      String publishDate = stdin.readLineSync() ?? "";
      print("\nplease enter categories separated by comma:");
      String categoriesInput = stdin.readLineSync() ?? "";
      List<String> categories = categoriesInput.split(', ');

      String viewNewList = "";
      List<Map<String, dynamic>> updatedBookList = List.from(libraryData);

      updatedBookList.add({
        "title": title,
        "author": author,
        "categories": categories,
        "price": price,
        "avalibale copies": copies,
        "First published": publishDate
      });

      for (var book in updatedBookList) {
        viewNewList +=
            "\nBook name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\navalibale copies: ${book['avalibale copies']}\n\n";
      }
      print(viewNewList);

      libraryData = updatedBookList;
    } catch (error) {
      print("Error: $error");
    }
  }

  void deleteBook() {
    try {
      print(
          "Write the 'title' of the book that you want to 'delete' (press 'q' to exit):\n");
      for (var index = 0; index < libraryData.length; index++) {
        print("${index + 1}: ${libraryData[index]['title']}");
      }
      String? titleOfTheBook = stdin.readLineSync() ?? "";
      if (titleOfTheBook.toLowerCase() == 'q') {
        print("We didn't delete anything");
        return;
      }
      List booksToRemove = [];

      while (titleOfTheBook?.toLowerCase() != 'q') {
        bool bookFound = false;
        for (var book in libraryData) {
          String title = book['title'];
          if (title.toLowerCase() == titleOfTheBook?.toLowerCase()) {
            bookFound = true;
            booksToRemove.add(book);
            break;
          }
        }

        if (!bookFound) {
          print("Book with title '$titleOfTheBook' does not exist.");
        }

        print("Is there any other book? (type 'q' to exit):");
        titleOfTheBook = stdin.readLineSync();
      }
      libraryData.removeWhere((book) => booksToRemove.contains(book));

      String printedList = "";
      for (var book in libraryData) {
        printedList +=
            "\nBook name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\nAvalibale copies: ${book['avalibale copies']}\n\n";
      }
      print(printedList);
      for (var index = 0; index < booksToRemove.length; index++) {
        print("\nThe book '${booksToRemove[index]['title']}' was deleted.");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  void modifyBookData() {
    try {
      List<Map<String, dynamic>> updatedBookList = List.from(libraryData);

      while (true) {
        print(
            "\nPlease enter the 'title' of the book you want to 'modify' (press 'q' to exit):");
        for (var index = 1; index < updatedBookList.length; index++) {
          print("$index: ${updatedBookList[index]['title']}");
        }
        String titleToModify = stdin.readLineSync() ?? "";
        if (titleToModify.toLowerCase() == 'q') {
          break;
        }
        Map<String, dynamic>? bookToModify;
        for (var book in updatedBookList) {
          if (book['title'] == titleToModify) {
            bookToModify = book;
            break;
          }
        }

        if (bookToModify == null) {
          print("\nThe book with title '$titleToModify' not found.");
          return;
        }
        print("\nPlease enter the new title:");
        String newTitle = stdin.readLineSync() ?? "";
        if (newTitle.isNotEmpty) {
          bookToModify['title'] = newTitle;
        }

        print("\nPlease enter the new author name:");
        String newAuthor = stdin.readLineSync() ?? "";
        if (newAuthor.isNotEmpty) {
          bookToModify['author'] = newAuthor;
        }

        print("\nPlease enter the new copies:");
        String newCopiesInput = stdin.readLineSync() ?? "";
        if (newCopiesInput.isNotEmpty) {
          int newCopies = int.tryParse(newCopiesInput) ?? 0;
          bookToModify['avalibale copies'] = newCopies;
        }

        print("\nPlease enter the new price:");
        String newPriceInput = stdin.readLineSync() ?? "";
        if (newPriceInput.isNotEmpty) {
          double newPrice = double.tryParse(newPriceInput) ?? 0.0;
          bookToModify['price'] = newPrice;
        }

        print("\nPlease enter the new publish date:");
        String newPublishDate = stdin.readLineSync() ?? "";
        if (newPublishDate.isNotEmpty) {
          bookToModify['First published'] = newPublishDate;
        }

        print("\nPlease enter the new categories separated by commas:");
        String newCategoriesInput = stdin.readLineSync() ?? "";
        if (newCategoriesInput.isNotEmpty) {
          List<String> newCategories = newCategoriesInput.split(',');
          bookToModify['categories'] = newCategories;
        }

        var newList =
            "\nYou just edit the book and new data is:\nname: ${bookToModify['title']}\nFor author: ${bookToModify['author']}\nFirst published: ${bookToModify['First published']}\nCategories: ${bookToModify['categories']}\nPrice: ${bookToModify['price']}\$\nAvalibale copies: ${bookToModify['avalibale copies']}\n\n";
        print(newList);
      }

      libraryData = updatedBookList;
    } catch (error) {
      print("\nError: $error");
    }
  }
}

class Purchases extends Library {
  List<Map<String, dynamic>> invoice = [];

  void makePurchase() {
    try {
      List<Map<String, dynamic>> updatedInvoice = List.from(invoice);

      print("What book do you want to buy (or press q to quit):");
      for (var index = 1; index < libraryData.length; index++) {
        if (libraryData[index]['avalibale copies'] == 0) {
          print("\n$index: ${libraryData[index]['title']}, is sold out\n");
        } else {
          print("$index: ${libraryData[index]['title']}\n");
        }
      }

      print(
          "Enter the number of the book you want to buy (or press q to quit):");
      String userInput = stdin.readLineSync() ?? "";

      if (userInput.toLowerCase() == 'q') {
        print("No purchase made.");
        return;
      }

      int bookNumber = int.tryParse(userInput) ?? -1;
      if (bookNumber >= 0 && bookNumber < libraryData.length) {
        Map<String, dynamic> selectedBook = libraryData[bookNumber];
        print("Selected Book: ${selectedBook['title']}");

        print("Enter the number of copies you want to purchase:");
        int numberOfCopies = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

        if (numberOfCopies > 0 &&
            numberOfCopies <= selectedBook['avalibale copies']) {
          double totalPrice = selectedBook['price'] * numberOfCopies;

          updatedInvoice.add({
            'title': selectedBook['title'],
            'author': selectedBook['author'],
            'numberOfCopies': numberOfCopies,
            'totalPrice': totalPrice,
          });

          print(
              "You purchased '$numberOfCopies' copy/copies of '${selectedBook['title']}'.\nTotal Price: $totalPrice \$");
          var remainingCopies =
              selectedBook['avalibale copies'] - numberOfCopies;

          print("\nThe remaining copies '$remainingCopies'");

          selectedBook['avalibale copies'] = remainingCopies;
          invoice = updatedInvoice;
        } else if (selectedBook['avalibale copies'] == 0) {
          print("The book '${selectedBook['title']}' is sold out.");
        } else {
          print("Invalid number of copies. Please enter a valid quantity.");
        }
      } else {
        print("Invalid book number. Please enter a valid book number.");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  void viewPurchases() {
    if (invoice.isEmpty) {
      print("\nYou haven't made any purchases yet.");
      return;
    }

    double totalAmount = 0.0;

    print("\nYour Purchases:");
    for (var purchase in invoice) {
      print(
          "\nTitle: ${purchase['title']}\nAuthor: ${purchase['author']}\nNumber of Copies: ${purchase['numberOfCopies']}\nTotal Price: \$${purchase['totalPrice']}\n");
      totalAmount += purchase['totalPrice'];
    }

    print("\nTotal Amount Spent: \$${totalAmount.toStringAsFixed(2)}");
  }
}

void main() {
  View view = View();
  Search search = Search();
  Edits edits = Edits();
  Purchases purchases = Purchases();

  while (true) {
    try {
      print("\nLibrary Management System");
      print("1. View available copies");
      print("2. View categories");
      print("3. View all books");
      print("4. Search for a book");
      print("5. Add a new book");
      print("6. Delete a book");
      print("7. Modify book data");
      print("8. Make a purchase");
      print("9. View purchases");
      print("10. Exit");
      print("Enter your choice:");

      String? choice = stdin.readLineSync();
      if (choice == null) {
        continue;
      }

      switch (int.tryParse(choice)) {
        case 1:
          view.viewAvailableCopies();
          break;
        case 2:
          view.viewCategories();
          break;
        case 3:
          view.viewBooks();
          break;
        case 4:
          search.searchByQuery();
          break;
        case 5:
          edits.addNewBook();
          break;
        case 6:
          edits.deleteBook();
          break;
        case 7:
          edits.modifyBookData();
          break;
        case 8:
          purchases.makePurchase();
          break;
        case 9:
          purchases.viewPurchases();
          break;
        case 10:
          print("Exiting the Library Management System. Goodbye!");
          exit(0);
        default:
          print("Invalid choice. Please enter a valid option.");
          break;
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
