import 'dart:io';
import '../Data/libraryData.dart';

class Library {
  String? title;
  String? author;
  List? categories;
  double? price;
  int? availableCopies;

  Library(
      {this.title,
      this.author,
      this.categories,
      this.price,
      this.availableCopies});
}

class View extends Library {
  //? done
  viewAvailableCopies() {
    //? done
    String availableCopies = '';
    for (var index in myLibrary) {
      if (index['avalibale copies'] >= 3) {
        availableCopies +=
            "The book: ${index['title']},\nhas '${index['avalibale copies']}' Avalibale copies.\n\n";
      } else if (index['avalibale copies'] > 1 &&
          index['avalibale copies'] < 3) {
        availableCopies +=
            "The book: ${index['title']},\nis only has '${index['avalibale copies']}' Avalibale copies!!!.\n\n";
      } else if (index['avalibale copies'] == 0) {
        availableCopies += "The book: ${index['title']},\nis sold out.\n\n";
      }
    }
    print(availableCopies);
  }

  viewCategories() {
    //? done
    List allCategories = [];
    for (var index in myLibrary) {
      for (var category in index['categories']) {
        if (!allCategories.contains(category)) {
          allCategories.add(category);
        }
      }
    }
    String availableCategories = 'We have categories: $allCategories';
    print(availableCategories);
  }

  viewBooks() {
    //? done
    String bookDetails = '';
    for (var index in myLibrary) {
      bookDetails +=
          'The book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navalibale copies: ${index['avalibale copies']}\n\n';
    }
    print(bookDetails);
  }

  //? viewPurchased() {// Purchase().makePurchase(titleInput: titleInput, numberOfCopies: numberOfCopies)// }
}

class Search extends Library {
  //? done
  searchByQuery() {
    //? done
    try {
      print('Please select what you want to search by:');
      print('1: by title name\n2: by author name\n3: by category');
      String userSelector = stdin.readLineSync()!;

      searchByFunc({required String userInput, required String index}) {
        String book = '';
        for (var item in myLibrary) {
          String theKey = item[index].toString().toLowerCase();
          if (theKey.contains(userInput.toLowerCase())) {
            book +=
                'Book name: ${item['title']}\nFor author: ${item['author']}\nFirst published: ${item['First published']}\nCategories: ${item['categories']}\nPrice: ${item['price']}\$\nAvalibale copies: ${item['avalibale copies']}\n\n';
          }
        }
        print(book);
      }

      switch (userSelector.toLowerCase()) {
        case == '1':
          print('Write the title of the book:');
          String userInput = stdin.readLineSync()!;
          searchByFunc(userInput: userInput, index: 'title');
          break;
        case == '2':
          print('Write the author of the book:');
          String userInput = stdin.readLineSync()!;
          searchByFunc(userInput: userInput, index: 'author');
          break;
        case == '3':
          print('Write the category of the book:');
          String userInput = stdin.readLineSync()!;
          searchByFunc(userInput: userInput, index: 'categories');
          break;
        case == 'q':
          exit(0);
        default:
          print('$userSelector is not a valid number');
      }
    } catch (error) {
      print('error: $error');
    }
  }
}

class Edits extends Library {
  //? done
  addNewBook() {
    //? done
    try {
      print("please enter title:");
      String title = stdin.readLineSync() ?? '';
      print("\nplease enter author name:");
      String author = stdin.readLineSync() ?? '';
      print("\nplease enter copies:");
      int copies = int.parse(stdin.readLineSync() ?? '');
      print("\nplease enter price:");
      double price = double.parse(stdin.readLineSync() ?? '');
      print("\nplease enter publish date:");
      String publishDate = stdin.readLineSync() ?? '';
      print("\nplease enter categories separated by comma:");
      String categories = stdin.readLineSync() ?? '';
      categories.split(', ');

      String viweNewList = '';
      myLibrary.add({
        "title": title,
        "author": author,
        "categories": [categories],
        "price": price,
        "avalibale copies": copies,
        "First published": publishDate
      });
      for (var book in myLibrary) {
        viweNewList +=
            'Book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\navalibale copies: ${book['avalibale copies']}\n\n';
      }
      print(viweNewList);
    } catch (error) {
      print('error: $error');
    }
  }

  deleteBook() {
    //? done
    try {
      print("What book do you want to delete (press 'q' to quit):");
      String? titleOfTheBook = stdin.readLineSync();
      if (titleOfTheBook == 'q' || titleOfTheBook == 'q') {
        print("We didn't delete anything");
        exit(0);
      }
      List booksToRemove = [];

      while (titleOfTheBook?.toLowerCase() != 'q') {
        bool bookFound = false;
        for (var book in myLibrary) {
          String title = book['title'];
          if (title.toLowerCase() == titleOfTheBook?.toLowerCase()) {
            bookFound = true;
            if (book['avalibale copies'] < 1) {
              print(
                  "You can't delete '${book['title']}' because it is out of stock.");
            } else {
              book['avalibale copies']--;
              booksToRemove.add(book);
            }
            break;
          }
        }

        if (!bookFound) {
          print("Book with title '$titleOfTheBook' does not exists.");
        }

        print("Is there any other book? (type 'q' to quit):");
        titleOfTheBook = stdin.readLineSync();
      }
      myLibrary.removeWhere((book) => booksToRemove.contains(book));

      String newList = '';
      for (var book in myLibrary) {
        newList +=
            'Book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\nAvalibale copies: ${book['avalibale copies']}\n\n';
      }
      print(newList);
    } catch (error) {
      print('error: $error');
    }
  }

  modifyBookData() {
    //?done
    try {
      while (true) {
        print('Please enter the title of the book you want to modify:');
        String titleToModify = stdin.readLineSync() ?? '';
        if (titleToModify.toLowerCase() == 'q') {
          break;
        }
        Map? bookToModify;
        for (var book in myLibrary) {
          if (book['title'] == titleToModify) {
            bookToModify = book;
            break;
          }
        }

        if (bookToModify == null) {
          print("Book with title '$titleToModify' not found.");
          return;
        }
        print("\nPlease enter the new title:");
        String newTitle = stdin.readLineSync() ?? '';
        if (newTitle.isNotEmpty) {
          bookToModify['title'] = newTitle;
        }

        print("\nPlease enter the new author name:");
        String newAuthor = stdin.readLineSync() ?? '';
        if (newAuthor.isNotEmpty) {
          bookToModify['author'] = newAuthor;
        }

        print("\nPlease enter the new copies:");
        String newCopiesInput = stdin.readLineSync() ?? '';
        if (newCopiesInput.isNotEmpty) {
          int newCopies = int.tryParse(newCopiesInput) ?? 0;
          bookToModify['avalibale copies'] = newCopies;
        }

        print("\nPlease enter the new price:");
        String newPriceInput = stdin.readLineSync() ?? '';
        if (newPriceInput.isNotEmpty) {
          double newPrice = double.tryParse(newPriceInput) ?? 0.0;
          bookToModify['price'] = newPrice;
        }

        print("\nPlease enter the new publish date:");
        String newPublishDate = stdin.readLineSync() ?? '';
        if (newPublishDate.isNotEmpty) {
          bookToModify['First published'] = newPublishDate;
        }

        print("\nPlease enter the new categories separated by commas:");
        String newCategoriesInput = stdin.readLineSync() ?? '';
        if (newCategoriesInput.isNotEmpty) {
          List<String> newCategories = newCategoriesInput.split(',');
          bookToModify['categories'] = newCategories;
        }
        var newList =
            'You just edit the book and new data is:\nname: ${bookToModify['title']}\nFor author: ${bookToModify['author']}\nFirst published: ${bookToModify['First published']}\nCategories: ${bookToModify['categories']}\nPrice: ${bookToModify['price']}\$\nAvalibale copies: ${bookToModify['avalibale copies']}\n\n';

        print(newList);
        myLibrary.add({bookToModify});
      }
    } catch (error) {
      print('error: $error');
    }
  }
}

class Purchases extends Library {
  //? done
  List invoice = [];
  makePurchase() {
    print('What book do you want to buy:');
    for (var index = 0; index < myLibrary.length; index++) {
      print('$index: ${myLibrary[index]['title']}\n');
    }

    print('Enter the number of the book you want to buy:');
    int bookNumber = int.parse(stdin.readLineSync() ?? '');

    if (bookNumber >= 0 && bookNumber < myLibrary.length) {
      Map<String, dynamic> selectedBook = myLibrary[bookNumber];
      print('Selected Book: ${selectedBook['title']}');

      print('Enter the number of copies you want to purchase:');
      int numberOfCopies = int.parse(stdin.readLineSync() ?? '');

      if (numberOfCopies > 0 &&
          numberOfCopies <= selectedBook['avalibale copies']) {
        double totalPrice = selectedBook['price'] * numberOfCopies;

        invoice.add({
          'title': selectedBook['title'],
          'author': selectedBook['author'],
          'numberOfCopies': numberOfCopies,
          'totalPrice': totalPrice,
        });

        print(
            "You purchased '$numberOfCopies' copy/copies of '${selectedBook['title']}'.");
        print('Total Price: $totalPrice \$');
      } else {
        print('Invalid number of copies. Please enter a valid quantity.');
      }
    } else {
      print('Invalid book number. Please enter a valid book number.');
    }
  }
}
