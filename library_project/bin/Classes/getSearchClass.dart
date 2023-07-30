import 'dart:io';

import 'libraryClass.dart';

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
      print(
          "\n 1: by title name\n 2: by author name\n 3: by category\n\n Q: to exit\n\n");
      String userSelector = stdin.readLineSync()!;

      switch (userSelector.toLowerCase()) {
        case == '1':
          print("\nWrite the 'title' of the book:");
          String userInput = stdin.readLineSync()!;
          Library.searchingByFunc(userInput: userInput, index: 'title');
          break;
        case == '2':
          print("\nWrite the 'author' of the book:");
          String userInput = stdin.readLineSync()!;
          Library.searchingByFunc(userInput: userInput, index: 'author');
          break;
        case == '3':
          print("\nWrite the 'category' of the book:");
          String userInput = stdin.readLineSync()!;
          Library.searchingByFunc(userInput: userInput, index: 'categories');
          break;
        case == 'q':
          break;
        default:
          print("\n'$userSelector'is not a valid.");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
