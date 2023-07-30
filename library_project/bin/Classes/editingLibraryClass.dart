import 'dart:io';

import '../Data/libraryData.dart';
import 'libraryClass.dart';

class EditingLibrary extends Library {
  //? done
  /* this class 'Edits' conatin all methods that belong to editing the library,
  for example: if you want to add a book, delete one or update one use these methods */
  addNewBook() {
    /* this method will add a new book to collection and print the list with the
    new book, the data that will added will be the title, author name, number of copies, 
    the price, the date of publish and the categories separated by comma, for 
    example: if you type (python, clean code). will be a list ['python', 'clean code'] 
    AKA the categories, because category is a list of strings */
    try {
      print("\nPlease enter title \n\nQ: to exit\n\n");
      String title = stdin.readLineSync() ?? "";
      if (title.toLowerCase() == 'q') {
        print("You didn't add any book");
        return;
      }

      int existingBookIndex = theLibrary.indexWhere(
          (book) => book['title'].toLowerCase() == title.toLowerCase());

      if (existingBookIndex != -1) {
        print("\n Book '$title' already exists in the library.\n");
        
        print("Enter number of copies:\n");
        int copiesToAdd = int.parse(stdin.readLineSync() ?? "");

        theLibrary[existingBookIndex]['avalibale copies'] += copiesToAdd;
        print("Added $copiesToAdd copies to the existing book '$title'.");
      } else {
        print("\nplease enter author name:");
        String author = stdin.readLineSync() ?? "";

        print("\nplease enter copies:");
        int copies = int.parse(stdin.readLineSync() ?? "");

        print("\nplease enter price:");
        double price = double.parse(stdin.readLineSync() ?? "");

        print("\nplease enter publish date:");
        String publishDate = stdin.readLineSync() ?? "";

        print("\nplease enter categories separated by comma:");
        String categoriesUserInput = stdin.readLineSync() ?? "";
        List<String> categories = categoriesUserInput.split(', ');

        theLibrary.add({
          "title": title,
          "author": author,
          "categories": categories,
          "price": price,
          "avalibale copies": copies,
          "First published": publishDate
        });

        print("\n Book '$title' has been added to the library.");
      }
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
          "Write the 'title' of the book that you want to 'delete' \n\n Q: to exit\n\n");
      for (var bookIndex = 0; bookIndex < theLibrary.length; bookIndex++) {
        print("${bookIndex + 1}: ${theLibrary[bookIndex]['title']}");
      }
      String? titleOfTheBook = stdin.readLineSync() ?? "";
      if (titleOfTheBook.toLowerCase() == 'q') {
        print("You didn't delete anything");
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

        print("Is there any other book? \n\n Q: to exit\n\n");
        titleOfTheBook = stdin.readLineSync();
      }
      theLibrary.removeWhere((book) => booksToRemove.contains(book));

      String printedList = "";
      for (var book in theLibrary) {
        printedList +=
            "\n Book name: ${book['title']}\n For author: ${book['author']}\n First published: ${book['First published']}\n Categories: ${book['categories']}\n Price: ${book['price'].toStringAsFixed(2)}\$\n Avalibale copies: ${book['avalibale copies']}\n\n";
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
            "\nPlease enter the 'title' of the book you want to 'modify' \n\n Q: to exit\n\n");
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
        print("\n Please enter the new title:");
        String newTitle = stdin.readLineSync() ?? "";
        if (newTitle.isNotEmpty) {
          bookToModify['title'] = newTitle;
        }

        print("\n Please enter the new author name:");
        String newAuthor = stdin.readLineSync() ?? "";
        if (newAuthor.isNotEmpty) {
          bookToModify['author'] = newAuthor;
        }

        print("\n Please enter the new copies:");
        String newCopiesInput = stdin.readLineSync() ?? "";
        if (newCopiesInput.isNotEmpty) {
          int newCopies = int.tryParse(newCopiesInput) ?? 0;
          bookToModify['avalibale copies'] = newCopies;
        }

        print("\n Please enter the new price:");
        String newPriceInput = stdin.readLineSync() ?? "";
        if (newPriceInput.isNotEmpty) {
          double newPrice = double.tryParse(newPriceInput) ?? 0.0;
          bookToModify['price'] = newPrice;
        }

        print("\n Please enter the new publish date:");
        String newPublishDate = stdin.readLineSync() ?? "";
        if (newPublishDate.isNotEmpty) {
          bookToModify['First published'] = newPublishDate;
        }

        print("\n Please enter the new categories separated by commas:");
        String newCategoriesInput = stdin.readLineSync() ?? "";
        if (newCategoriesInput.isNotEmpty) {
          List<String> newCategories = newCategoriesInput.split(',');
          bookToModify['categories'] = newCategories;
        }

        var newList =
            "\n You just edit the book and new data is:\nname: ${bookToModify['title']}\n For author: ${bookToModify['author']}\n First published: ${bookToModify['First published']}\n Categories: ${bookToModify['categories']}\n Price: ${bookToModify['price'].toStringAsFixed(2)}\$\n Avalibale copies: ${bookToModify['avalibale copies']}\n\n";
        print(newList);
      }

      theLibrary = updatedBookList;
    } catch (error) {
      print("\nError: $error");
    }
  }
}
