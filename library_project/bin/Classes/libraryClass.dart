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
  View(
      [String? title,
      String? author,
      List? categories,
      double? price,
      int? availableCopies])
      : super(
            title: title,
            author: author,
            categories: categories,
            price: price,
            availableCopies: availableCopies);

  viewAvailableCopies() {
    String availableCopies = '';
    for (var index in myLibrary) {
      if (index['avalibale copies'] >= 1) {
        availableCopies +=
            'The book: ${index['title']},\nhas ${index['avalibale copies']} available copies.\n\n';
      }
    }
    return availableCopies;
  }

  viewBooks() {
    String bookDetails = '';
    for (var index in myLibrary) {
      bookDetails +=
          'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navalibale copies: ${index['avalibale copies']}\n\n';
    }
    return bookDetails;
  }
}

class Search extends Library {
  Search(
      [String? title,
      String? author,
      List? categories,
      double? price,
      int? availableCopies])
      : super(
            title: title,
            author: author,
            categories: categories,
            price: price,
            availableCopies: availableCopies);

  searchByQuery({required String userInput, required String searchBy}) {
    String bookAuthor = '';
    for (var index in myLibrary) {
      String author = index[searchBy.toLowerCase()];
      if (author.toLowerCase().contains(userInput.toLowerCase())) {
        bookAuthor +=
            'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navailable copies: ${index['avalibale copies']}\n\n';
      }
    }
    return bookAuthor;
  }

  searchByCatigory({required String userInputCatigory}) {
    String theBook = '';
    for (var index in myLibrary) {
      for (String catigory in index['categories']) {
        if (catigory.toLowerCase().contains(userInputCatigory.toLowerCase())) {
          theBook +=
              'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navalibale copies: ${index['avalibale copies']}\n\n';
        }
      }
    }
    return theBook;
  }
}

class Edits extends Library {
  Edits(
      [String? title,
      String? author,
      List? categories,
      double? price,
      int? availableCopies])
      : super(
            title: title,
            author: author,
            categories: categories,
            price: price,
            availableCopies: availableCopies);

  addNewBook(
      {required String title,
      required String author,
      required List categories,
      required int copies,
      required double price,
      required String publishDate}) {
    String viweNewList = '';
    myLibrary.add({
      "title": title,
      "author": author,
      "categories": categories,
      "price": price,
      "avalibale copies": copies,
      "First published": publishDate
    });
    for (var book in myLibrary) {
      viweNewList +=
          'Book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\navalibale copies: ${book['avalibale copies']}\n\n';
    }
    return viweNewList;
  }

  deleteBook({required String titleOfTheBook}) {
    String newList = '';
    for (var index in myLibrary) {
      String title = index['title'];
      if (title.toLowerCase() == titleOfTheBook.toLowerCase()) {
        if (index['avalibale copies'] < 1) {
          return "you can't delete (${index['title']}) because it is out of stock";
        } else if (index['avalibale copies'] >= 1) {
          index['avalibale copies']--;
        }
      }
      newList +=
          'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navailable copies: ${index['avalibale copies']}\n\n';
    }
    return newList;
  }

  modifyBookData(
      {required int userIndex,
      required String title,
      required String author,
      required List categories,
      required int copies,
      required double price,
      required String publishDate}) {
    var userModifyObject = myLibrary[userIndex];
    userModifyObject['title'] = title;
    userModifyObject['author'] = author;
    userModifyObject['categories'] = categories;
    userModifyObject['avalibale copies'] = copies;
    userModifyObject['price'] = price;
    userModifyObject['First published'] = publishDate;
    return userModifyObject;
  }

  // !updateAvailableCopies() {}
}

class Purchase extends Library {
  Purchase(
      [String? title,
      String? author,
      List? categories,
      double? price,
      int? availableCopies])
      : super(
            title: title,
            author: author,
            categories: categories,
            price: price,
            availableCopies: availableCopies);
  makePurchase() {}
  receiveInvoice() {}
  // TODO viewPurchased() {}
}
