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
  viewAvailableCopies() {
    //? done
    String availableCopies = '';
    for (var index in myLibrary) {
      if (index['avalibale copies'] >= 3) {
        availableCopies +=
            'The book: ${index['title']},\nhas ${index['avalibale copies']} Avalibale copies.\n\n';
      } else if (index['avalibale copies'] > 1 &&
          index['avalibale copies'] < 3) {
        availableCopies +=
            'The book: ${index['title']},\nis only has ${index['avalibale copies']} Avalibale copies!!!.\n\n';
      } else if (index['avalibale copies'] == 0) {
        availableCopies += 'The book: ${index['title']},\nis sold out.\n\n';
      }
    }
    return availableCopies;
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
    return availableCategories;
  }

  viewBooks() {
    //? done
    String bookDetails = '';
    for (var index in myLibrary) {
      bookDetails +=
          'The book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navalibale copies: ${index['avalibale copies']}\n\n';
    }
    return bookDetails;
  }
  // TODO viewPurchased() {}
}

class Search extends Library {
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

      switch (userSelector) {
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
        default:
          print('$userSelector is not a valid number');
      }
    } catch (error) {
      return 'error: $error';
    }
  }
}

class Edits extends Library {
  addNewBook() {
    try {
      print("please enter title:");
      String title = stdin.readLineSync() ?? '';
      print("\nplease enter author name:");
      String author = stdin.readLineSync() ?? '';
      print("\nplease enter copies:");
      int copies = int.parse(stdin.readLineSync()!);
      print("\nplease enter price:");
      double price = double.parse(stdin.readLineSync()!);
      print("\nplease enter publishDate:");
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
      return viweNewList;
    } catch (error) {
      return 'error: $error';
    }
  }

  deleteBook() {
    try {
      print("What book do you want to delete (press 'q' to quit):");
      String? titleOfTheBook = stdin.readLineSync();
      List<Map<String, dynamic>> booksToRemove = [];

      while (titleOfTheBook?.toLowerCase() != 'q') {
        bool bookFound = false;
        for (var book in myLibrary) {
          String title = book['title'];
          if (title.toLowerCase() == titleOfTheBook?.toLowerCase()) {
            bookFound = true;
            if (book['avalibale copies'] < 1) {
              return "You can't delete '${book['title']}' because it is out of stock.";
            } else {
              book['avalibale copies']--;
              booksToRemove.add(book);
            }
            break;
          }
        }

        if (!bookFound) {
          print("Book with title '$titleOfTheBook' not found.");
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
      return newList;
    } catch (error) {
      return 'error: $error';
    }
  }

  modifyBookData() {
    try {
      print('Please enter the title of the book you want to modify:');
      String titleToModify = stdin.readLineSync() ?? '';
      Map<String, dynamic>? bookToModify;
      for (var book in myLibrary) {
        if (book['title'] == titleToModify) {
          bookToModify = book;
          break;
        }
      }
      while (titleToModify.toLowerCase() != 'q'.toLowerCase()) {
        if (bookToModify == null) {
          print("Book with title '$titleToModify' not found.");
          return null;
        }
        print("\nPlease enter the new title:");
        String newTitle = stdin.readLineSync() ?? '';
        bookToModify['title'] = newTitle;

        print("\nPlease enter the new author name:");
        String newAuthor = stdin.readLineSync() ?? '';
        bookToModify['author'] = newAuthor;

        print("\nPlease enter the new copies:");
        int newCopies = int.parse(stdin.readLineSync()!);
        bookToModify['avalibale copies'] = newCopies;

        print("\nPlease enter the new price:");
        double newPrice = double.parse(stdin.readLineSync()!);
        bookToModify['price'] = newPrice;

        print("\nPlease enter the new publishDate:");
        String newPublishDate = stdin.readLineSync() ?? '';
        bookToModify['First published'] = newPublishDate;

        print("\nPlease enter the new categories separated by commas:");
        String newCategoriesInput = stdin.readLineSync() ?? '';
        newCategoriesInput.split(',');
        bookToModify['categories'] = [newCategoriesInput];

        var newList =
            'You iust edit a book and new data is:\nname: ${bookToModify['title']}\nFor author: ${bookToModify['author']}\nFirst published: ${bookToModify['First published']}\nCategories: ${bookToModify['categories']}\nPrice: ${bookToModify['price']}\$\nAvalibale copies: ${bookToModify['avalibale copies']}\n\n';

        return newList;
      }
      myLibrary.add({bookToModify});
    } catch (error) {
      return 'error: $error';
    }
  }
}

class Purchase extends Library {
  makePurchase({required String titleInput, required int numberOfCopies}) {
    String bookPurchase = '';
    for (var index in myLibrary) {
      String title = index['title'];
      if (title.toLowerCase() == titleInput.toLowerCase()) {
        bookPurchase +=
            'You bought ($numberOfCopies) copies of (${index['title']}) book, that will costs you ${numberOfCopies * index['price']}\$';
      }
    }
    return bookPurchase;
  }
}
  // receiveInvoice() {}
//      print("please enter categories");
      // List categories = stdin.readLineSync().split(', ') ?? [];
