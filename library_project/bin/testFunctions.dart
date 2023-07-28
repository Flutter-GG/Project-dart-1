// import 'dart:io';

// List<Map<String, dynamic>> myLibrary = [
//   {
//     'title': 'Book 1',
//     'author': 'Author 1',
//     'First published': '2021',
//     'categories': ['Fiction', 'Fantasy'],
//     'price': 19.99,
//     'avalibale copies': 1,
//   },
//   // Add more books as needed
// ];

// String deleteBook() {
//   try {
//     print("What book do you want to delete (type 'q' to quit):");
//     String? titleOfTheBook = stdin.readLineSync();

//     bool bookDeleted = false;
//     while (titleOfTheBook?.toLowerCase() != 'q') {
//       for (var book in myLibrary) {
//         String title = book['title'];
//         if (title.toLowerCase() == titleOfTheBook?.toLowerCase()) {
//           if (book['avalibale copies'] < 1) {
//             return "You can't delete '${book['title']}' because it is out of stock.";
//           } else {
//             book['avalibale copies']--;
//             bookDeleted = true;
//             break; // No need to continue searching after finding the book
//           }
//         }
//       }

//       if (!bookDeleted) {
//         print("Book with title '$titleOfTheBook' not found.");
//       }

//       print("Is there any other book? (type 'q' to quit):");
//       titleOfTheBook = stdin.readLineSync();
//     }

//     if (bookDeleted) {
//       // If any book was deleted, build the newList
//       String newList = '';
//       for (var book in myLibrary) {
//         newList +=
//             'Book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\nAvailable copies: ${book['avalibale copies']}\n\n';
//       }
//       return newList;
//     } else {
//       return "No books were deleted.";
//     }
//   } catch (error) {
//     return 'Error occurred: $error';
//   }
// }

// void main() {
//   String updatedLibrary = deleteBook();
//   print("\nUpdated Library:\n");
//   print(updatedLibrary);
// }
// try {
//   print("What book do you want to delete (type 'q' to quit):");
//   String titleOfTheBook = stdin.readLineSync() ?? '';
//   String newList = '';
//   do {
//     print("is there any other book?:");
//     if (titleOfTheBook == 'q' || titleOfTheBook == 'Q') {
//       break;
//     } else {
//       for (var index in myLibrary) {
//         String title = index['title'];
//         if (title.toLowerCase() == titleOfTheBook.toLowerCase()) {
//           if (index['avalibale copies'] < 1) {
//             return "you can't delete (${index['title']}) because it is out of stock";
//           } else if (index['avalibale copies'] >= 1) {
//             index['avalibale copies']--;
//           }
//         }
//         newList +=
//             'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navailable copies: ${index['avalibale copies']}\n\n';
//       }
//     }
//   } while (true);
//   return newList;
// } catch (error) {
//   return 'error';
// }

//     modifyBookData(
//     /*{required int userIndex,
//     required String title,
//     required String author,
//     required List categories,
//     required int copies,
//     required double price,
//     required String publishDate}*/
//     ) {
//   try {
//     print("please enter title:");
//     String title = stdin.readLineSync() ?? '';
//     print("\nplease enter author name:");
//     String author = stdin.readLineSync() ?? '';
//     print("\nplease enter copies:");
//     int copies = int.parse(stdin.readLineSync()!);
//     print("\nplease enter price:");
//     double price = double.parse(stdin.readLineSync()!);
//     print("\nplease enter publishDate:");
//     String publishDate = stdin.readLineSync() ?? '';
//     print("\nplease enter categories separated by comma:");
//     String categories = stdin.readLineSync() ?? '';
//     categories.split(', ');
//   var userModifyObject = myLibrary[userIndex];
//   userModifyObject['title'] = title;
//   userModifyObject['author'] = author;
//   userModifyObject['categories'] = categories;
//   userModifyObject['avalibale copies'] = copies;
//   userModifyObject['price'] = price;
//   userModifyObject['First published'] = publishDate;
//   } catch (error) {}

//   return userModifyObject;
// }

// import 'dart:io';
// // import 'Classes/libraryClass.dart';
// import 'Data/libraryData.dart';

// modifyBookData() {
//   try {
//     print("Please enter the title of the book you want to modify:");
//     String titleToModify = stdin.readLineSync() ?? '';

//     Map<String, dynamic>? bookToModify;
//     for (var book in myLibrary) {
//       if (book['title'] == titleToModify) {
//         bookToModify = book;
//         break;
//       }
//     }

//     if (bookToModify == null) {
//       print("Book with title '$titleToModify' not found.");
//       return null;
//     }

//     print("\nPlease enter the new title:");
//     String newTitle = stdin.readLineSync() ?? '';
//     bookToModify['title'] = newTitle;

//     print("\nPlease enter the new author name:");
//     String newAuthor = stdin.readLineSync() ?? '';
//     bookToModify['author'] = newAuthor;

//     print("\nPlease enter the new copies:");
//     int newCopies = int.parse(stdin.readLineSync()!);
//     bookToModify['available copies'] = newCopies;

//     print("\nPlease enter the new price:");
//     double newPrice = double.parse(stdin.readLineSync()!);
//     bookToModify['price'] = newPrice;

//     print("\nPlease enter the new publishDate:");
//     String newPublishDate = stdin.readLineSync() ?? '';
//     bookToModify['First published'] = newPublishDate;

//     print("\nPlease enter the new categories separated by commas:");
//     String newCategoriesInput = stdin.readLineSync() ?? '';
//     List<String> newCategories = newCategoriesInput
//         .split(',')
//         .map((category) => category.trim())
//         .toList();
//     bookToModify['categories'] = newCategories;

//     var newList =
//         'Book name: ${bookToModify['title']}\nFor author: ${bookToModify['author']}\nFirst published: ${bookToModify['First published']}\nCategories: ${bookToModify['categories']}\nPrice: ${bookToModify['price']}\$\navailable copies: ${bookToModify['available copies']}\n\n';

//     return newList;
//   } catch (error) {
//     print('Error occurred: $error');
//     return null;
//   }
// }

// void main() {
//   var updatedBook = modifyBookData();
//   if (updatedBook != null) {
//     print("\nUpdated Book:\n");
//     print(updatedBook);
//   }
// }
// import 'dart:io';

// List<Map<String, dynamic>> myLibrary = [
//   {
//     'title': 'Book 1',
//     'author': 'Author 1',
//     'First published': '2021',
//     'categories': ['Fiction', 'Fantasy'],
//     'price': 19.99,
//     'available copies': 5,
//   },
//   // Add more books as needed
// ];

// String? modifyBookData() {
//   try {
//     print("Please enter the title of the book you want to modify:");
//     String titleToModify = stdin.readLineSync() ?? '';

//     Map<String, dynamic>? bookToModify;
//     for (var book in myLibrary) {
//       if (book['title'] == titleToModify) {
//         bookToModify = book;
//         break;
//       }
//     }

//     if (bookToModify == null) {
//       print("Book with title '$titleToModify' not found.");
//       return null;
//     }

//     print("\nPlease enter the new title:");
//     String newTitle = stdin.readLineSync() ?? '';
//     bookToModify['title'] = newTitle;

//     print("\nPlease enter the new author name:");
//     String newAuthor = stdin.readLineSync() ?? '';
//     bookToModify['author'] = newAuthor;

//     print("\nPlease enter the new copies:");
//     int newCopies = int.parse(stdin.readLineSync()!);
//     bookToModify['available copies'] = newCopies;

//     print("\nPlease enter the new price:");
//     double newPrice = double.parse(stdin.readLineSync()!);
//     bookToModify['price'] = newPrice;

//     print("\nPlease enter the new publishDate:");
//     String newPublishDate = stdin.readLineSync() ?? '';
//     bookToModify['First published'] = newPublishDate;

//     print("\nPlease enter the new categories separated by commas:");
//     String newCategoriesInput = stdin.readLineSync() ?? '';
//     List<String> newCategories = newCategoriesInput
//         .split(',')
//         .map((category) => category.trim())
//         .toList();
//     bookToModify['categories'] = newCategories;

//     String newList =
//         'Book name: ${bookToModify['title']}\nFor author: ${bookToModify['author']}\nFirst published: ${bookToModify['First published']}\nCategories: ${bookToModify['categories']}\nPrice: ${bookToModify['price']}\$\navailable copies: ${bookToModify['available copies']}\n\n';

//     return newList;
//   } catch (error) {
//     print('Error occurred: $error');
//     return null;
//   }
// }

// void main() {
//   var updatedBook = modifyBookData();
//   if (updatedBook != null) {
//     print("\nUpdated Book:\n");
//     print(updatedBook);

//     // Update the myLibrary list with the modified book
//     int index = myLibrary.indexWhere((book) =>
//         book['title'].toLowerCase() == updatedBook['title'].toLowerCase());
//     if (index != -1) {
//       myLibrary[index] = updatedBook;
//     }
//   }

//   print("\nUpdated Library:\n");
//   print(myLibrary);
// }
// import 'dart:io';

// List<Map<String, dynamic>> myLibrary = [
//   {
//     'title': 'Book 1',
//     'author': 'Author 1',
//     'First published': '2021',
//     'categories': ['Fiction', 'Fantasy'],
//     'price': 19.99,
//     'available copies': 5,
//   },
//   // Add more books as needed
// ];

// void modifyBookData(String titleToModify) {
//   try {
//     Map<String, dynamic>? bookToModify;
//     for (var book in myLibrary) {
//       if (book['title'] == titleToModify) {
//         bookToModify = book;
//         break;
//       }
//     }

//     if (bookToModify == null) {
//       print("Book with title '$titleToModify' not found.");
//       return;
//     }

//     while (titleToModify.toLowerCase() != 'q') {
//       print("\nPlease enter the new title:");
//       String newTitle = stdin.readLineSync() ?? '';
//       bookToModify['title'] = newTitle;

//       print("\nPlease enter the new author name:");
//       String newAuthor = stdin.readLineSync() ?? '';
//       bookToModify['author'] = newAuthor;

//       print("\nPlease enter the new copies:");
//       int newCopies = int.parse(stdin.readLineSync()!);
//       bookToModify['available copies'] = newCopies;

//       print("\nPlease enter the new price:");
//       double newPrice = double.parse(stdin.readLineSync()!);
//       bookToModify['price'] = newPrice;

//       print("\nPlease enter the new publishDate:");
//       String newPublishDate = stdin.readLineSync() ?? '';
//       bookToModify['First published'] = newPublishDate;

//       print("\nPlease enter the new categories separated by commas:");
//       String newCategoriesInput = stdin.readLineSync() ?? '';
//       List<String> newCategories = newCategoriesInput
//           .split(',')
//           .map((category) => category.trim())
//           .toList();
//       bookToModify['categories'] = newCategories;

//       print("\nBook data updated successfully.");
//       print("Enter 'q' to stop modifying or another title to modify:");
//       titleToModify = stdin.readLineSync() ?? '';
//     }
//   } catch (error) {
//     print('Error occurred: $error');
//   }
// }

// void main() {
//   print("Please enter the title of the book you want to modify:");
//   String titleToModify = stdin.readLineSync() ?? '';
//   modifyBookData(titleToModify);

//   print("\nUpdated Library:\n");
//   print(myLibrary);
// }
// import 'dart:io';
// import '../Data/libraryData.dart';

// class Library {
//   String? title;
//   String? author;
//   List? categories;
//   double? price;
//   int? availableCopies;

//   Library(
//       {this.title,
//       this.author,
//       this.categories,
//       this.price,
//       this.availableCopies});
// }

// class View extends Library {
//   // View(
//   //     [String? title,
//   //     String? author,
//   //     List? categories,
//   //     double? price,
//   //     int? availableCopies])
//   //     : super(
//   //           title: title,
//   //           author: author,
//   //           categories: categories,
//   //           price: price,
//   //           availableCopies: availableCopies);

//   viewAvailableCopies() {
//     String availableCopies = '';
//     for (var index in myLibrary) {
//       if (index['avalibale copies'] >= 1) {
//         availableCopies +=
//             'The book: ${index['title']},\nhas ${index['avalibale copies']} Avalibale copies.\n\n';
//       }
//     }
//     return availableCopies;
//   }

//   viewBooks() {
//     String bookDetails = '';
//     for (var index in myLibrary) {
//       bookDetails +=
//           'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navalibale copies: ${index['avalibale copies']}\n\n';
//     }
//     return bookDetails;
//   }
// }

// class Search extends Library {
//   // Search(
//   //     [String? title,
//   //     String? author,
//   //     List? categories,
//   //     double? price,
//   //     int? availableCopies])
//   //     : super(
//   //           title: title,
//   //           author: author,
//   //           categories: categories,
//   //           price: price,
//   //           availableCopies: availableCopies);

//   searchByQuery({required String userInput, required String searchBy}) {
//     String bookAuthor = '';
//     for (var index in myLibrary) {
//       String author = index[searchBy.toLowerCase()];
//       if (author.toLowerCase().contains(userInput.toLowerCase())) {
//         bookAuthor +=
//             'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\nAvalibale copies: ${index['avalibale copies']}\n\n';
//       }
//     }
//     return bookAuthor;
//   }

//   searchByCatigory({required String userInputCatigory}) {
//     String theBook = '';
//     for (var index in myLibrary) {
//       for (String catigory in index['categories']) {
//         if (catigory.toLowerCase().contains(userInputCatigory.toLowerCase())) {
//           theBook +=
//               'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navalibale copies: ${index['avalibale copies']}\n\n';
//         }
//       }
//     }
//     return theBook;
//   }
// }

// class Edits extends Library {
//   // Edits(
//   //     [String? title,
//   //     String? author,
//   //     List? categories,
//   //     double? price,
//   //     int? availableCopies])
//   //     : super(
//   //           title: title,
//   //           author: author,
//   //           categories: categories,
//   //           price: price,
//   //           availableCopies: availableCopies);

//   addNewBook(
//       /*{required String title,
//       required String author,
//       required List categories,
//       required int copies,
//       required double price,
//       required String publishDate}*/
//       ) {
//     try {
//       print("please enter title:");
//       String title = stdin.readLineSync() ?? '';
//       print("\nplease enter author name:");
//       String author = stdin.readLineSync() ?? '';
//       print("\nplease enter copies:");
//       int copies = int.parse(stdin.readLineSync()!);
//       print("\nplease enter price:");
//       double price = double.parse(stdin.readLineSync()!);
//       print("\nplease enter publishDate:");
//       String publishDate = stdin.readLineSync() ?? '';
//       print("\nplease enter categories separated by comma:");
//       String categories = stdin.readLineSync() ?? '';
//       categories.split(', ');

//       String viweNewList = '';
//       myLibrary.add({
//         "title": title,
//         "author": author,
//         "categories": [categories],
//         "price": price,
//         "avalibale copies": copies,
//         "First published": publishDate
//       });
//       for (var book in myLibrary) {
//         viweNewList +=
//             'Book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\navalibale copies: ${book['avalibale copies']}\n\n';
//       }
//       return viweNewList;
//     } catch (error) {
//       return 'error: $error';
//     }
//   }

//   deleteBook() {
//     try {
//       print("What book do you want to delete (press 'q' to quit):");
//       String? titleOfTheBook = stdin.readLineSync();

//       bool bookDeleted = false;
//       while (titleOfTheBook?.toLowerCase() != 'q') {
//         for (var book in myLibrary) {
//           String title = book['title'];
//           if (title.toLowerCase() == titleOfTheBook?.toLowerCase()) {
//             if (book['avalibale copies'] < 1) {
//               return "You can't delete '${book['title']}' because it is out of stock.";
//             } else {
//               book['avalibale copies']--;
//               bookDeleted = true;
//               break;
//             }
//           }
//         }

//         if (!bookDeleted) {
//           print("Book with title '$titleOfTheBook' not found.");
//         }

//         print("Is there any other book? (type 'q' to quit):");
//         titleOfTheBook = stdin.readLineSync();
//       }

//       if (bookDeleted) {
       
//         String newList = '';
//         for (var book in myLibrary) {
//           newList +=
//               'Book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\nAvalibale copies: ${book['avalibale copies']}\n\n';
//           myLibrary.add({
//             "title": book['title'],
//             "author": book['author'],
//             "categories": book['categories'],
//             "price": book['price'],
//             "avalibale copies": book['avalibale copies'],
//             "First published": book['First published'],
//           });
//         }
//         return newList;
//       } else {
//         return "No books were deleted.";
//       }
//     } catch (error) {
//       return 'error: $error';
//     }
//   }

//   modifyBookData(
//       /*{required int userIndex,
//       required String title,
//       required String author,
//       required List categories,
//       required int copies,
//       required double price,
//       required String publishDate}*/
//       ) {
//     try {
//       print('Please enter the title of the book you want to modify:');
//       String titleToModify = stdin.readLineSync() ?? '';
//       Map<String, dynamic>? bookToModify;
//       for (var book in myLibrary) {
//         if (book['title'] == titleToModify) {
//           bookToModify = book;
//           break;
//         }
//       }
//       while (titleToModify.toLowerCase() != 'q'.toLowerCase()) {
//         if (bookToModify == null) {
//           print("Book with title '$titleToModify' not found.");
//           return null;
//         }
//         print("\nPlease enter the new title:");
//         String newTitle = stdin.readLineSync() ?? '';
//         bookToModify['title'] = newTitle;

//         print("\nPlease enter the new author name:");
//         String newAuthor = stdin.readLineSync() ?? '';
//         bookToModify['author'] = newAuthor;

//         print("\nPlease enter the new copies:");
//         int newCopies = int.parse(stdin.readLineSync()!);
//         bookToModify['avalibale copies'] = newCopies;

//         print("\nPlease enter the new price:");
//         double newPrice = double.parse(stdin.readLineSync()!);
//         bookToModify['price'] = newPrice;

//         print("\nPlease enter the new publishDate:");
//         String newPublishDate = stdin.readLineSync() ?? '';
//         bookToModify['First published'] = newPublishDate;

//         print("\nPlease enter the new categories separated by commas:");
//         String newCategoriesInput = stdin.readLineSync() ?? '';
//         newCategoriesInput.split(',');
//         bookToModify['categories'] = [newCategoriesInput];

//         var newList =
//             'You iust edit a book and new data is:\nname: ${bookToModify['title']}\nFor author: ${bookToModify['author']}\nFirst published: ${bookToModify['First published']}\nCategories: ${bookToModify['categories']}\nPrice: ${bookToModify['price']}\$\nAvalibale copies: ${bookToModify['avalibale copies']}\n\n';

//         return newList;
//       }
//       myLibrary.add({bookToModify});
//     } catch (error) {
//       return 'error: $error';
//     }
//   }

//   // !updateAvailableCopies() {}
// }

// class Purchase extends Library {
//   // Purchase(
//   //     [String? title,
//   //     String? author,
//   //     List? categories,
//   //     double? price,
//   //     int? availableCopies])
//   //     : super(
//   //           title: title,
//   //           author: author,
//   //           categories: categories,
//   //           price: price,
//   //           availableCopies: availableCopies);
//   makePurchase({required String titleInput, required int numberOfCopies}) {
//     String bookPurchase = '';
//     for (var index in myLibrary) {
//       String title = index['title'];
//       if (title.toLowerCase() == titleInput.toLowerCase()) {
//         bookPurchase +=
//             'You bought ($numberOfCopies) copies of (${index['title']}) book, that will costs you ${numberOfCopies * index['price']}\$';
//       }
//     }
//     return bookPurchase;
//   }
// }
//   // receiveInvoice() {}
//   // // TODO viewPurchased() {}
// //      print("please enter categories");
//       // List categories = stdin.readLineSync().split(', ') ?? [];
  // deleteBook() {
  //   try {
  //     print("What book do you want to delete (press 'q' to quit):");
  //     String? titleOfTheBook = stdin.readLineSync();
  //     List<Map<String, dynamic>> booksToRemove = [];

  //     while (titleOfTheBook?.toLowerCase() != 'q') {
  //       bool bookFound = false;
  //       for (var book in myLibrary) {
  //         String title = book['title'];
  //         if (title.toLowerCase() == titleOfTheBook?.toLowerCase()) {
  //           bookFound = true;
  //           if (book['avalibale copies'] < 1) {
  //             return "You can't delete '${book['title']}' because it is out of stock.";
  //           } else {
  //             book['avalibale copies']--;
  //             booksToRemove.add(book);
  //           }
  //           break;
  //         }
  //       }

  //       if (!bookFound) {
  //         print("Book with title '$titleOfTheBook' not found.");
  //       }

  //       print("Is there any other book? (type 'q' to quit):");
  //       titleOfTheBook = stdin.readLineSync();
  //     }
  //     myLibrary.removeWhere((book) => booksToRemove.contains(book));

  //     String newList = '';
  //     for (var book in myLibrary) {
  //       newList +=
  //           'Book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\nAvalibale copies: ${book['avalibale copies']}\n\n';
  //     }
  //     return newList;
  //   } catch (error) {
  //     return 'error: $error';
  //   }
  // }
          //   case == '2':
        //     print('Write the author of the book:');
        //     String userInput = stdin.readLineSync()!;
        //     String book = '';
        //     for (var index in myLibrary) {
        //       String title = index['author'].toLowerCase();
        //       if (title.contains(userInput.toLowerCase())) {
        //         book +=
        //             'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\nAvalibale copies: ${index['avalibale copies']}\n\n';
        //       }
        //     }
        //     return book;
        //   case == '3':
        //     print('Write the category of the book:');
        //     String userInput = stdin.readLineSync()!;
        //     String book = '';
        //     for (var index in myLibrary) {
        //       String title = index['title'].toLowerCase();
        //       if (title.contains(userInput.toLowerCase())) {
        //         book +=
        //             'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\nAvalibale copies: ${index['avalibale copies']}\n\n';
        //       }
        //     }
        //     return book;


// import 'dart:io';
// import '../Data/libraryData.dart';

// class Library {
//   String? title;
//   String? author;
//   List? categories;
//   double? price;
//   int? availableCopies;

//   Library(
//       {this.title,
//       this.author,
//       this.categories,
//       this.price,
//       this.availableCopies});
// }

// class View extends Library {
//   viewAvailableCopies() {
//     //? done
//     String availableCopies = '';
//     for (var index in myLibrary) {
//       if (index['avalibale copies'] >= 3) {
//         availableCopies +=
//             'The book: ${index['title']},\nhas ${index['avalibale copies']} Avalibale copies.\n\n';
//       } else if (index['avalibale copies'] > 1 &&
//           index['avalibale copies'] < 3) {
//         availableCopies +=
//             'The book: ${index['title']},\nis only has ${index['avalibale copies']} Avalibale copies!!!.\n\n';
//       } else if (index['avalibale copies'] == 0) {
//         availableCopies += 'The book: ${index['title']},\nis sold out.\n\n';
//       }
//     }
//     return availableCopies;
//   }

//   viewCategories() {
//     //? done
//     List allCategories = [];
//     for (var index in myLibrary) {
//       for (var category in index['categories']) {
//         if (!allCategories.contains(category)) {
//           allCategories.add(category);
//         }
//       }
//     }
//     String availableCategories = 'We have categories: $allCategories';
//     return availableCategories;
//   }

//   viewBooks() {
//     //? done
//     String bookDetails = '';
//     for (var index in myLibrary) {
//       bookDetails +=
//           'The book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navalibale copies: ${index['avalibale copies']}\n\n';
//     }
//     return bookDetails;
//   }
//   // TODO viewPurchased() {}
// }

// class Search extends Library {
//   searchByQuery(/*{required String userInput, required String searchBy}*/) {
//     //!
//     try {
//       print('Please select what you want to search by:');
//       print('1: by title name\n2: by author name\n3: by category');
//       String userSelector = stdin.readLineSync()!;

//       searchByFunc({required String userInput, required String index}) {
//         String book = '';
//         for (var item in myLibrary) {
//           String theKey = item[index].toString().toLowerCase();
//           if (theKey.contains(userInput.toLowerCase())) {
//             book +=
//                 'Book name: ${item['title']}\nFor author: ${item['author']}\nFirst published: ${item['First published']}\nCategories: ${item['categories']}\nPrice: ${item['price']}\$\nAvalibale copies: ${item['avalibale copies']}\n\n';
//           }
//         }
//         print(book);
//       }

//       switch (userSelector) {
//         case == '1':
//           print('Write the title of the book:');
//           String userInput = stdin.readLineSync()!;
//           searchByFunc(userInput: userInput, index: 'title');
//           break;
//         case == '2':
//           print('Write the author of the book:');
//           String userInput = stdin.readLineSync()!;
//           searchByFunc(userInput: userInput, index: 'author');
//           break;
//         case == '3':
//           print('Write the category of the book:');
//           String userInput = stdin.readLineSync()!;
//           searchByFunc(userInput: userInput, index: 'category');
//           break;
//       }
//     } catch (error) {
//       return 'error: $error';
//     }
//   }

//   searchByCatigory({required String userInputCatigory}) {
//     //!
//     String theBook = '';
//     for (var index in myLibrary) {
//       for (String catigory in index['categories']) {
//         if (catigory.toLowerCase().contains(userInputCatigory.toLowerCase())) {
//           theBook +=
//               'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navalibale copies: ${index['avalibale copies']}\n\n';
//         }
//       }
//     }
//     return theBook;
//   }
// }

// class Edits extends Library {
//   addNewBook() {
//     try {
//       print("please enter title:");
//       String title = stdin.readLineSync() ?? '';
//       print("\nplease enter author name:");
//       String author = stdin.readLineSync() ?? '';
//       print("\nplease enter copies:");
//       int copies = int.parse(stdin.readLineSync()!);
//       print("\nplease enter price:");
//       double price = double.parse(stdin.readLineSync()!);
//       print("\nplease enter publishDate:");
//       String publishDate = stdin.readLineSync() ?? '';
//       print("\nplease enter categories separated by comma:");
//       String categories = stdin.readLineSync() ?? '';
//       categories.split(', ');

//       String viweNewList = '';
//       myLibrary.add({
//         "title": title,
//         "author": author,
//         "categories": [categories],
//         "price": price,
//         "avalibale copies": copies,
//         "First published": publishDate
//       });
//       for (var book in myLibrary) {
//         viweNewList +=
//             'Book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\navalibale copies: ${book['avalibale copies']}\n\n';
//       }
//       return viweNewList;
//     } catch (error) {
//       return 'error: $error';
//     }
//   }

//   deleteBook() {
//     try {
//       print("What book do you want to delete (press 'q' to quit):");
//       String? titleOfTheBook = stdin.readLineSync();
//       List<Map<String, dynamic>> booksToRemove = [];

//       while (titleOfTheBook?.toLowerCase() != 'q') {
//         bool bookFound = false;
//         for (var book in myLibrary) {
//           String title = book['title'];
//           if (title.toLowerCase() == titleOfTheBook?.toLowerCase()) {
//             bookFound = true;
//             if (book['avalibale copies'] < 1) {
//               return "You can't delete '${book['title']}' because it is out of stock.";
//             } else {
//               book['avalibale copies']--;
//               booksToRemove.add(book);
//             }
//             break;
//           }
//         }

//         if (!bookFound) {
//           print("Book with title '$titleOfTheBook' not found.");
//         }

//         print("Is there any other book? (type 'q' to quit):");
//         titleOfTheBook = stdin.readLineSync();
//       }
//       myLibrary.removeWhere((book) => booksToRemove.contains(book));

//       String newList = '';
//       for (var book in myLibrary) {
//         newList +=
//             'Book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\nAvalibale copies: ${book['avalibale copies']}\n\n';
//       }
//       return newList;
//     } catch (error) {
//       return 'error: $error';
//     }
//   }

//   modifyBookData() {
//     try {
//       print('Please enter the title of the book you want to modify:');
//       String titleToModify = stdin.readLineSync() ?? '';
//       Map<String, dynamic>? bookToModify;
//       for (var book in myLibrary) {
//         if (book['title'] == titleToModify) {
//           bookToModify = book;
//           break;
//         }
//       }
//       while (titleToModify.toLowerCase() != 'q'.toLowerCase()) {
//         if (bookToModify == null) {
//           print("Book with title '$titleToModify' not found.");
//           return null;
//         }
//         print("\nPlease enter the new title:");
//         String newTitle = stdin.readLineSync() ?? '';
//         bookToModify['title'] = newTitle;

//         print("\nPlease enter the new author name:");
//         String newAuthor = stdin.readLineSync() ?? '';
//         bookToModify['author'] = newAuthor;

//         print("\nPlease enter the new copies:");
//         int newCopies = int.parse(stdin.readLineSync()!);
//         bookToModify['avalibale copies'] = newCopies;

//         print("\nPlease enter the new price:");
//         double newPrice = double.parse(stdin.readLineSync()!);
//         bookToModify['price'] = newPrice;

//         print("\nPlease enter the new publishDate:");
//         String newPublishDate = stdin.readLineSync() ?? '';
//         bookToModify['First published'] = newPublishDate;

//         print("\nPlease enter the new categories separated by commas:");
//         String newCategoriesInput = stdin.readLineSync() ?? '';
//         newCategoriesInput.split(',');
//         bookToModify['categories'] = [newCategoriesInput];

//         var newList =
//             'You iust edit a book and new data is:\nname: ${bookToModify['title']}\nFor author: ${bookToModify['author']}\nFirst published: ${bookToModify['First published']}\nCategories: ${bookToModify['categories']}\nPrice: ${bookToModify['price']}\$\nAvalibale copies: ${bookToModify['avalibale copies']}\n\n';

//         return newList;
//       }
//       myLibrary.add({bookToModify});
//     } catch (error) {
//       return 'error: $error';
//     }
//   }
// }

// class Purchase extends Library {
//   makePurchase({required String titleInput, required int numberOfCopies}) {
//     String bookPurchase = '';
//     for (var index in myLibrary) {
//       String title = index['title'];
//       if (title.toLowerCase() == titleInput.toLowerCase()) {
//         bookPurchase +=
//             'You bought ($numberOfCopies) copies of (${index['title']}) book, that will costs you ${numberOfCopies * index['price']}\$';
//       }
//     }
//     return bookPurchase;
//   }
// }
//   // receiveInvoice() {}
// //      print("please enter categories");
//       // List categories = stdin.readLineSync().split(', ') ?? [];
// searchByCatigory({required String userInputCatigory}) {
//     //!
//     String theBook = '';
//     for (var index in myLibrary) {
//       for (String catigory in index['categories']) {
//         if (catigory.toLowerCase().contains(userInputCatigory.toLowerCase())) {
//           theBook +=
//               'Book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navalibale copies: ${index['avalibale copies']}\n\n';
//         }
//       }
//     }
//     return theBook;
//   }
// import 'dart:io';
// import '../Data/libraryData.dart';

// class Library {
//   String? title;
//   String? author;
//   List? categories;
//   double? price;
//   int? availableCopies;

//   Library(
//       {this.title,
//       this.author,
//       this.categories,
//       this.price,
//       this.availableCopies});
// }

// class View extends Library {
//   viewAvailableCopies() {
//     //? done
//     String availableCopies = '';
//     for (var index in myLibrary) {
//       if (index['avalibale copies'] >= 3) {
//         availableCopies +=
//             "The book: ${index['title']},\nhas '${index['avalibale copies']}' Avalibale copies.\n\n";
//       } else if (index['avalibale copies'] > 1 &&
//           index['avalibale copies'] < 3) {
//         availableCopies +=
//             "The book: ${index['title']},\nis only has '${index['avalibale copies']}' Avalibale copies!!!.\n\n";
//       } else if (index['avalibale copies'] == 0) {
//         availableCopies += "The book: ${index['title']},\nis sold out.\n\n";
//       }
//     }
//     print(availableCopies);
//   }

//   viewCategories() {
//     //? done
//     List allCategories = [];
//     for (var index in myLibrary) {
//       for (var category in index['categories']) {
//         if (!allCategories.contains(category)) {
//           allCategories.add(category);
//         }
//       }
//     }
//     String availableCategories = 'We have categories: $allCategories';
//     print(availableCategories);
//   }

//   viewBooks() {
//     //? done
//     String bookDetails = '';
//     for (var index in myLibrary) {
//       bookDetails +=
//           'The book name: ${index['title']}\nFor author: ${index['author']}\nFirst published: ${index['First published']}\nCategories: ${index['categories']}\nPrice: ${index['price']}\$\navalibale copies: ${index['avalibale copies']}\n\n';
//     }
//     print(bookDetails);
//   }
//   // TODO viewPurchased() {}
// }

// class Search extends Library {
//   searchByQuery() {
//     //? done
//     try {
//       print('Please select what you want to search by:');
//       print('1: by title name\n2: by author name\n3: by category');
//       String userSelector = stdin.readLineSync()!;

//       searchByFunc({required String userInput, required String index}) {
//         String book = '';
//         for (var item in myLibrary) {
//           String theKey = item[index].toString().toLowerCase();
//           if (theKey.contains(userInput.toLowerCase())) {
//             book +=
//                 'Book name: ${item['title']}\nFor author: ${item['author']}\nFirst published: ${item['First published']}\nCategories: ${item['categories']}\nPrice: ${item['price']}\$\nAvalibale copies: ${item['avalibale copies']}\n\n';
//           }
//         }
//         print(book);
//       }

//       switch (userSelector.toLowerCase()) {
//         case == '1':
//           print('Write the title of the book:');
//           String userInput = stdin.readLineSync()!;
//           searchByFunc(userInput: userInput, index: 'title');
//           break;
//         case == '2':
//           print('Write the author of the book:');
//           String userInput = stdin.readLineSync()!;
//           searchByFunc(userInput: userInput, index: 'author');
//           break;
//         case == '3':
//           print('Write the category of the book:');
//           String userInput = stdin.readLineSync()!;
//           searchByFunc(userInput: userInput, index: 'categories');
//           break;
//         case == 'q':
//           exit(0);
//         default:
//           print('$userSelector is not a valid number');
//       }
//     } catch (error) {
//       print('error: $error');
//     }
//   }
// }

// class Edits extends Library {
//   addNewBook() {
//     //? done
//     try {
//       print("please enter title:");
//       String title = stdin.readLineSync() ?? '';
//       print("\nplease enter author name:");
//       String author = stdin.readLineSync() ?? '';
//       print("\nplease enter copies:");
//       int copies = int.parse(stdin.readLineSync() ?? '');
//       print("\nplease enter price:");
//       double price = double.parse(stdin.readLineSync() ?? '');
//       print("\nplease enter publishDate:");
//       String publishDate = stdin.readLineSync() ?? '';
//       print("\nplease enter categories separated by comma:");
//       String categories = stdin.readLineSync() ?? '';
//       categories.split(', ');

//       String viweNewList = '';
//       myLibrary.add({
//         "title": title,
//         "author": author,
//         "categories": [categories],
//         "price": price,
//         "avalibale copies": copies,
//         "First published": publishDate
//       });
//       for (var book in myLibrary) {
//         viweNewList +=
//             'Book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\navalibale copies: ${book['avalibale copies']}\n\n';
//       }
//       print(viweNewList);
//     } catch (error) {
//       print('error: $error');
//     }
//   }

//   deleteBook() {
//     //? done
//     try {
//       print("What book do you want to delete (press 'q' to quit):");
//       String? titleOfTheBook = stdin.readLineSync();
//       List<Map<String, dynamic>> booksToRemove = [];

//       while (titleOfTheBook?.toLowerCase() != 'q') {
//         bool bookFound = false;
//         for (var book in myLibrary) {
//           String title = book['title'];
//           if (title.toLowerCase() == titleOfTheBook?.toLowerCase()) {
//             bookFound = true;
//             if (book['avalibale copies'] < 1) {
//               print(
//                   "You can't delete '${book['title']}' because it is out of stock.");
//             } else {
//               book['avalibale copies']--;
//               booksToRemove.add(book);
//             }
//             break;
//           }
//         }

//         if (!bookFound) {
//           print("Book with title '$titleOfTheBook' does not exists.");
//         }

//         print("Is there any other book? (type 'q' to quit):");
//         titleOfTheBook = stdin.readLineSync();
//       }
//       myLibrary.removeWhere((book) => booksToRemove.contains(book));

//       String newList = '';
//       for (var book in myLibrary) {
//         newList +=
//             'Book name: ${book['title']}\nFor author: ${book['author']}\nFirst published: ${book['First published']}\nCategories: ${book['categories']}\nPrice: ${book['price']}\$\nAvalibale copies: ${book['avalibale copies']}\n\n';
//       }
//       print(newList);
//     } catch (error) {
//       print('error: $error');
//     }
//   }

//   modifyBookData() {
//     try {
//       print('Please enter the title of the book you want to modify:');
//       String titleToModify = stdin.readLineSync() ?? '';
//       Map? bookToModify;
//       for (var book in myLibrary) {
//         if (book['title'] == titleToModify) {
//           bookToModify = book;
//           break;
//         }
//       }

//       while (titleToModify.toLowerCase() != 'q'.toLowerCase()) {
//         if (bookToModify == null) {
//           print("Book with title '$titleToModify' not found.");
//           return;
//         }
//         print("\nPlease enter the new title:");
//         String newTitle = stdin.readLineSync() ?? '';
//         if (newTitle.isNotEmpty) {
//           bookToModify['title'] = newTitle;
//         }

//         print("\nPlease enter the new author name:");
//         String newAuthor = stdin.readLineSync() ?? '';
//         if (newAuthor.isNotEmpty) {
//           bookToModify['author'] = newAuthor;
//         }

//         print("\nPlease enter the new copies:");
//         String newCopiesInput = stdin.readLineSync() ?? '';
//         if (newCopiesInput.isNotEmpty) {
//           int newCopies = int.tryParse(newCopiesInput) ?? 0;
//           bookToModify['avalibale copies'] = newCopies;
//         }

//         print("\nPlease enter the new price:");
//         String newPriceInput = stdin.readLineSync() ?? '';
//         if (newPriceInput.isNotEmpty) {
//           double newPrice = double.tryParse(newPriceInput) ?? 0.0;
//           bookToModify['price'] = newPrice;
//         }

//         print("\nPlease enter the new publish date:");
//         String newPublishDate = stdin.readLineSync() ?? '';
//         if (newPublishDate.isNotEmpty) {
//           bookToModify['First published'] = newPublishDate;
//         }

//         print("\nPlease enter the new categories separated by commas:");
//         String newCategoriesInput = stdin.readLineSync() ?? '';
//         if (newCategoriesInput.isNotEmpty) {
//           List<String> newCategories = newCategoriesInput.split(',');
//           bookToModify['categories'] = newCategories;
//         }
//         var newList =
//             'You just edit the book and new data is:\nname: ${bookToModify['title']}\nFor author: ${bookToModify['author']}\nFirst published: ${bookToModify['First published']}\nCategories: ${bookToModify['categories']}\nPrice: ${bookToModify['price']}\$\nAvalibale copies: ${bookToModify['avalibale copies']}\n\n';

//         print(newList);
//       }
//       myLibrary.add({bookToModify});
//     } catch (error) {
//       print('error: $error');
//     }
//   }
// }

// class Purchase extends Library {
//   makePurchase({required String titleInput, required int numberOfCopies}) {
//     String bookPurchase = '';
//     for (var index in myLibrary) {
//       String title = index['title'];
//       if (title.toLowerCase() == titleInput.toLowerCase()) {
//         bookPurchase +=
//             "You bought '$numberOfCopies' copies of '${index['title']}' book, that will costs you ${numberOfCopies * index['price']}\$";
//       }
//     }
//     print(bookPurchase);
//   }
// }
//   // receiveInvoice() {}
// //      print("please enter categories");
//       // List categories = stdin.readLineSync().split(', ') ?? [];
// try {
  //   print(
  //       "Please select:\n\n1- If you want to view the library\n2- If you want to search in the library\n3- If you want to edit the library\n4- If you want to buy a book\n(press 'q' to exit):");
  //   String? userInput = stdin.readLineSync();

  //   switch (userInput) {
  //     case == '1':
  //       print(
  //           "\n1- If you want to view available copies\n2- If you want to view categories\n3- If you want to view all books\n(press 'q' to exit):");
  //       String? userInput = stdin.readLineSync();
  //       switch (userInput) {
  //         case == '1':
  //           View().viewAvailableCopies();
  //         case == '2':
  //           View().viewCategories();
  //         case == '3':
  //           View().viewBooks();
  //       }
  //       break;
  //     case == '2':
  //       Search().searchByQuery();
  //       break;
  //     case == '3':
  //       print(
  //           "\n1- If you want to add new book\n2- If you want to delete a book\n3- If you want to edit a book\n(press 'q' to exit):");
  //       String? userInput = stdin.readLineSync();
  //       switch (userInput) {
  //         case == '1':
  //           Edits().addNewBook();
  //           break;
  //         case == '2':
  //           Edits().deleteBook();
  //           break;
  //         case == '3':
  //           Edits().modifyBookData();
  //           break;
  //       }
  //       break;
  //     case == '4':
  //       Purchases().makePurchase();
  //       break;
  //   }
  // } catch (error) {
  //   print('Error: $error');
  // }