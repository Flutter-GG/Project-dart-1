import 'dart:io';

import '../Data/libraryData.dart';
import 'libraryClass.dart';

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
            "\n The book: ${index['title']},\n has '${index['avalibale copies']}' Avalibale copies.\n\n___________________________________________________\n";
      } else if (index['avalibale copies'] >= 1 &&
          index['avalibale copies'] < 3) {
        availableCopies +=
            "\n The book: ${index['title']},\n is only has '${index['avalibale copies']}' Avalibale copies!!!.\n\n___________________________________________________\n";
      } else if (index['avalibale copies'] == 0) {
        availableCopies +=
            "\n The book: ${index['title']},\n is sold out.\n\n___________________________________________________\n";
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
    for (var categoryIndex in theLibrary) {
      for (var category in categoryIndex['categories']) {
        if (!allCategories.contains(category)) {
          allCategories.add(category);
        }
      }
    }
    String availableCategories = "\n We have categories: $allCategories\n";
    print(availableCategories);
    print("\n Write the 'category' of the book\n\nQ: to exit\n\n");
    String userInput = stdin.readLineSync()!;
    Library.searchingByFunc(userInput: userInput, index: 'categories');
  }

  getBooks() {
    //? done
    /* this method is only to view all books in the theLibrary database, also I added 
    empty string to easily access to it and print it out */
    String bookDetails = "";
    for (var book in theLibrary) {
      bookDetails +=
          "\n The book name: ${book['title']}\n For author: ${book['author']}\n First published: ${book['First published']}\n Categories: ${book['categories']}\n Price: ${book['price'].toStringAsFixed(2)}\$\n Avalibale copies: ${book['avalibale copies']}\n\n";
    }
    print(bookDetails);
  }
}
