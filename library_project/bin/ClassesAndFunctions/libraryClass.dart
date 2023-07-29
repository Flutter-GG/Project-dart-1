import "dart:io";
import '../Data/libraryData.dart';

// TODO: database
class Library {
  String? title;
  String? author;
  List? categories;
  double? price;
  int? availableCopies;
  List? myLibrary;

  Library(
      {this.title,
      this.author,
      this.categories,
      this.price,
      this.availableCopies,
      this.myLibrary});
}

class GetView extends Library {
  //? done
  /* this class 'View' conatin all methods that belong to view,
  for example: if you want to see the availabe copies or all categories and
  books */
  getAvailableCopies() {
    //? done
    /* this method only show the name of the book and how many copies left for
    this title I added some spicific like if the book is more or equal 3 will print 
    the available cpies but if the copies is less than 3 it will print 'Avalibale copies!!!'
    to make it exited but if the copies is equal 0 it will print 'sold out'*/
    String availableCopies =
        ""; // this variuble is empty string just to access to it and then print the title and number of available copies
    for (var index in theLibrary) {
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

  getCategories() {
    //? done
    /* this just show all categories I make it empty list because I used 'for in' loop
    and append every category in the index of categories, if string is doublecated 
    it will ignore it, I use this method because unlike python,
    tuples are not built-in in Dart and I don't know how to use packages in dart */
    List allCategories = [];
    for (var index in theLibrary) {
      for (var category in index['categories']) {
        if (!allCategories.contains(category)) {
          allCategories.add(category);
        }
      }
    }
    String availableCategories = "\nWe have categories: $allCategories\n";
    print(availableCategories);
  }

  getBooks() {
    //? done
    /* this method is only to view all books in the theLibrary database, also I added 
    empty string to easily access to it and print it out */
    String bookDetails = "";
    for (var book in theLibrary) {
      bookDetails +=
          "\nThe book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price'].toStringAsFixed(2)}\$\navalibale copies: ${book['avalibale copies']}\n\n";
    }
    print(bookDetails);
  }
}

class GetSearch extends Library {
  //? done
  /* this class 'Search' conatin one method that belong to search,
  for example: if you want to search by the title, category or author you can do it here
  this class only for search not for view, it will print out what you looking for
  for example: if you looking for 'Automate the Boring Stuff with Python: Practical Programming for Total Beginners'
  you can search using query, if you select title for example you can search using 
  'Automate' or 'Python' and it will print out all books contain these words, and 
  also if you search using categories you can search by using one of the categories
  TODO: maybe if I have time I will fix the issue with searching by using more than one category, I will print the book more than one time
  */
  getSearchByQuery() {
    //? done
    try {
      print("\nPlease select what you want to search by:");
      print("\n1: by title name\n2: by author name\n3: by category\n");
      String userSelector = stdin.readLineSync()!;

      searchingByFunc({required String userInput, required String index}) {
        String book = "";
        for (var item in theLibrary) {
          String theKey = item[index].toString().toLowerCase();
          if (theKey.contains(userInput.toLowerCase())) {
            book +=
                "\nBook name: ${item['title']}\nFor author: ${item['author']}\nFirst published: ${item['First published']}\nCategories: ${item['categories']}\nPrice: ${item['price'].toStringAsFixed(2)}\$\nAvalibale copies: ${item['avalibale copies']}\n\n";
          }
        }
        print(book);
      }

      switch (userSelector.toLowerCase()) {
        case == '1':
          print("\nWrite the 'title' of the book:");
          String userInput = stdin.readLineSync()!;
          searchingByFunc(userInput: userInput, index: 'title');
          break;
        case == '2':
          print("\nWrite the 'author' of the book:");
          String userInput = stdin.readLineSync()!;
          searchingByFunc(userInput: userInput, index: 'author');
          break;
        case == '3':
          print("\nWrite the 'category' of the book:");
          String userInput = stdin.readLineSync()!;
          searchingByFunc(userInput: userInput, index: 'categories');
          break;
        case == 'q':
          exit(0);
        default:
          print("\n'$userSelector'is not a valid.");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}

class EditingLibrary extends Library {
  //? done
  /* this class 'Edits' conatin all methods that belong to editing the library,
  for example: if you want to add a book, delete one or update one use these methods */
  addNewBook() {
    //? done
    /* this method will add a new book to collection and print the list with the
    new book, the data that will added will be the title, author name, number of copies, 
    the price, the date of publish and the categories separated by comma, for 
    example: if you type (python, clean code). will be a list ['python', 'clean code'] 
    AKA the categories, because category is a list of strings */
    try {
      print("please enter title \n(or press 'q' to exit):");
      String title = stdin.readLineSync() ?? "";
      if (title.toLowerCase() == 'q') {
        print("We didn't add any book");
        return;
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

      String newListStrig = "";
      List updatedBookList = List.from(theLibrary);

      updatedBookList.add({
        "title": title,
        "author": author,
        "categories": categories,
        "price": price,
        "avalibale copies": copies,
        "First published": publishDate
      });

      for (var book in updatedBookList) {
        newListStrig +=
            "\nBook name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price'].toStringAsFixed(2)}\$\navalibale copies: ${book['avalibale copies']}\n\n";
      }
      print(newListStrig);

      theLibrary = updatedBookList;
    } catch (error) {
      print("Error: $error");
    }
  }

  deleteBook() {
    //? done
    /* this method will delete a book, then print the updated list, this is 
    case sensitive because you will delete the book so you need to be sure 
    about the spiling of the book, I cange it from decrease one of the copies to
    delete the whole book with all copies */
    try {
      print(
          "Write the 'title' of the book that you want to 'delete' \n(or press 'q' to exit):\n");
      for (var bookIndex = 0; bookIndex < theLibrary.length; bookIndex++) {
        print("${bookIndex + 1}: ${theLibrary[bookIndex]['title']}");
      }
      String? titleOfTheBook = stdin.readLineSync() ?? "";
      if (titleOfTheBook.toLowerCase() == 'q') {
        print("We didn't delete anything");
        return;
      }
      List booksToRemove = [];

      while (titleOfTheBook?.toLowerCase() != 'q') {
        bool bookFinder = false;
        for (var book in theLibrary) {
          String title = book['title'];
          if (title.toLowerCase() == titleOfTheBook?.toLowerCase()) {
            bookFinder = true;
            booksToRemove.add(book);
            break;
          }
        }

        if (!bookFinder) {
          print("Book with title '$titleOfTheBook' does not exist.");
        }

        print("Is there any other book? \n(type 'q' to exit):");
        titleOfTheBook = stdin.readLineSync();
      }
      theLibrary.removeWhere((book) => booksToRemove.contains(book));

      String printedList = "";
      for (var book in theLibrary) {
        printedList +=
            "\nBook name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price'].toStringAsFixed(2)}\$\nAvalibale copies: ${book['avalibale copies']}\n\n";
      }
      print(printedList);
      for (var deletedBookIndex = 0;
          deletedBookIndex < booksToRemove.length;
          deletedBookIndex++) {
        print(
            "\nThe book '${booksToRemove[deletedBookIndex]['title']}' was deleted.");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  modifyBookData() {
    //?done
    /* this method to modify the data of a book if the user didn't add a new data or empty string
    the exist data will stay, but if the user add a data the method will add it
    and delete the old data */
    try {
      List updatedBookList = List.from(theLibrary);

      while (true) {
        print(
            "\nPlease enter the 'title' of the book you want to 'modify' \n(or press 'q' to exit):");
        for (var bookIndex = 0;
            bookIndex < updatedBookList.length;
            bookIndex++) {
          print("${bookIndex + 1}: ${updatedBookList[bookIndex]['title']}");
        }
        String titleToModify = stdin.readLineSync() ?? "";
        if (titleToModify.toLowerCase() == 'q') {
          break;
        }
        Map? bookToModify;
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
            "\nYou just edit the book and new data is:\nname: ${bookToModify['title']}\nFor author: ${bookToModify['author']}\nFirst published: ${bookToModify['First published']}\nCategories: ${bookToModify['categories']}\nPrice: ${bookToModify['price'].toStringAsFixed(2)}\$\nAvalibale copies: ${bookToModify['avalibale copies']}\n\n";
        print(newList);
      }

      theLibrary = updatedBookList;
    } catch (error) {
      print("\nError: $error");
    }
  }
}

class Purchases extends Library {
  //? done
  /* this class is for makeing purchases, if the user want to but a book with 0 
  copies it wont allow the user to do it, also recieve the invoice of 
  the purchase */
  static List invoice = []; //

  makePurchase() {
    /* this method will */
    try {
      List updatedInvoice = List.from(invoice);

      print("What book do you want to buy (or press 'q' to exit):");
      for (var bookIndex = 1; bookIndex < theLibrary.length; bookIndex++) {
        if (theLibrary[bookIndex]['avalibale copies'] == 0) {
          print(
              "\n$bookIndex: ${theLibrary[bookIndex]['title']}, is sold out\n");
        } else {
          print(
              "$bookIndex: ${theLibrary[bookIndex]['title']}, '${theLibrary[bookIndex]['avalibale copies']}' copy/copies\n");
        }
      }

      print(
          "Enter the number of the book you want to buy \n(or press 'q' to exit):");
      String userInput = stdin.readLineSync() ?? "";

      if (userInput.toLowerCase() == 'q') {
        print("No purchase made.");
        return;
      }

      int bookNumber = int.tryParse(userInput) ?? -1;
      if (bookNumber >= 0 && bookNumber < theLibrary.length) {
        Map selectedBook = theLibrary[bookNumber];
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
              "You purchased '$numberOfCopies' copy/copies of '${selectedBook['title']}'.\nTotal Price: ${totalPrice.toStringAsFixed(2)} \$");
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

  getInvoice() {
    if (invoice.isEmpty) {
      print("\nYou haven't made any purchases yet.");
      return;
    }

    double totalAmount = 0.0;

    print("\nYour Purchases:");
    for (var purchase in invoice) {
      print(
          "\nTitle: ${purchase['title']}\nAuthor: ${purchase['author']}\nNumber of Copies: ${purchase['numberOfCopies']}\nTotal Price: \$${purchase['totalPrice'].toStringAsFixed(2)}\n");
      totalAmount += purchase['totalPrice'];
    }

    print("\nTotal Amount Spent: \$${totalAmount.toStringAsFixed(2)}");
  }
}