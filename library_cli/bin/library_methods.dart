// this file has all the methods for the library application to make the file more clean
// ignore_for_file: iterable_contains_unrelated_type

import 'dart:io';
import 'class_book.dart';

// method for adding a new book
addBook(List<Book> bookList) {
  //enter all the book information
  try {
    print("please enter the name of the book:");
    String titlein = stdin.readLineSync()!;

    print("please enter the author name: ");
    String authorin = stdin.readLineSync()!;

    print("please enter the price of the book: ");
    double pricein = double.parse(stdin.readLineSync()!);

    print("please enter the number of avaliable copies of the book:");
    int numCopiesin = int.parse(stdin.readLineSync()!);

    print("please enter the catagories of the book:(press q for stopping)");
    List<String> categoryin = [];
    do {
      String enterCatagory = stdin.readLineSync()!;
      if (enterCatagory == "q") {
        break;
      } else {
        categoryin.add(enterCatagory.toLowerCase().trim());
      }
    } while (true);
    //add all the information into an object

    bookList.add(Book(
        title: titlein,
        author: authorin,
        category: categoryin,
        numCopies: numCopiesin,
        price: pricein));

    print("Your book has been added successfully");

    //update the number of copies
    if (bookList.contains(titlein)) {
      for (var item in bookList) {
        if (item.title == titlein) {
          item.numCopies += numCopiesin;
        }
      }
    }
  } catch (error) {
    print("error $error");
  }
}

// method for deleting a book
deleteBook(List<Book> bookList) {
  //enter all the book information
  print("please enter the name of the book you want to delete:");
  String titlein = stdin.readLineSync()!;
  if (bookList.contains(titlein.toLowerCase().trim())) {
    print("please enter the number of copies you want to delete:");
    int numCopiesin = int.parse(stdin.readLineSync()!);
    //delete and update the number of copies
    for (var item in bookList) {
      if (item.title == titlein) {
        if (item.numCopies < numCopiesin) {
          item.numCopies -= numCopiesin;
          print('the book {$item.title} is deleted successfully!');
        } else if (item.numCopies == numCopiesin) {
          int index = bookList.indexWhere((element) => element == item);
          bookList.removeAt(index);
          print('the book {$item.title} is deleted successfully!');
        } else {
          print('sorry the number of books exceeds the avaliable');
        }
      }
    }
  } else {
    print('there is no book with this name check again');
  }
}

//method for query books through title, category, author and display the number of avaliable copies
searchBooks(List<Book> bookList) {
  print(
      'please enter your search (you can search by author or category or title):');
  String text = stdin.readLineSync()!;
  if (bookList.contains(text)) {
    for (var item in bookList) {
      if (item.title == text.toLowerCase().trim()) {
        item.display();
      } else if (item.author == text.toLowerCase().trim()) {
        item.display();
      } else if (item.category.contains(text.toLowerCase().trim())) {
        item.display();
      } else {
        print("No item with this name please try again");
      }
    }
  }
}

//method for purchasing the book and printing the invoice
purchaseBook(List<Book> bookList) {
  //enter all the book information
  print("please enter the name of the book you want to purchase:");
  String titlein = stdin.readLineSync()!;
  if (bookList.contains(titlein.toLowerCase().trim())) {
    print("please enter the number of copies you want to purchase:");
    int numCopiesin = int.parse(stdin.readLineSync()!);
    //purchase and update the number of copies
    for (var item in bookList) {
      if (item.title == titlein) {
        double total = item.price * numCopiesin;
        if (item.numCopies < numCopiesin) {
          item.numCopies -= numCopiesin;
          print('the book is purchased successfully!');
          print(
              'your invoice is:\nBook --- Price\n{$item.title} --- {$item.price}\nTotal cost:$total');
        } else if (item.numCopies == numCopiesin) {
          int index = bookList.indexWhere((element) => element == item);
          bookList.removeAt(index);
          print('the book is purchased successfully!');
          print(
              'your invoice is:\nBook --- Price\n{$item.title} --- {$item.price}\nTotal cost:$total');
        } else {
          print('sorry the number of books exceeds the avaliable');
        }
      }
    }
  } else {
    print('there is no book with this name check again');
  }
}

//method for editing the book informations
editBooks(List<Book> bookList) {
  print('what do you want to edit:');
  print('1:title,\n2:author,\n3:catagory');
  int choice = int.parse(stdin.readLineSync()!);

  print('enter the origional item');
  String orgText = stdin.readLineSync()!.toLowerCase().trim();

  print('enter the edit');
  String editText = stdin.readLineSync()!.toLowerCase().trim();

  switch (choice) {
    case 1:
      for (var item in bookList) {
        if (item.title == orgText) {
          item.title = editText;
          print('edit is successful');
        }
      }
      break;
    case 2:
      for (var item in bookList) {
        if (item.author == orgText) {
          item.author = editText;
          print('edit is successful');
        }
      }
      break;
    case 3:
      for (var item in bookList) {
        if (item.category.contains(orgText)) {
          item.category = [editText];
          print('edit is successful');
        }
      }
      break;
  }
}

//method for displaying all Book Categories
catagoryDisplay(List<Book> bookList) {
  print('Our catagories:');
  for (var item in bookList) {
    print(item.category);
  }
  print('enter the catagory you want:');
  String catagory = stdin.readLineSync()!;
  for (var item in bookList) {
    if (item.category.contains(catagory)) {
      item.display();
    } else {
      print('wrong name');
    }
  }
}
