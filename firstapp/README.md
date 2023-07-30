

# Books Library

I create program that meets user requirements, in the first I created 5 classes each class has it is own work, I will explain more in the next steps..

## Classes in the program
<img  width="657" alt="class" src="https://github.com/Flutter-GG/Project-dart-1/assets/140311670/0f547b01-e356-4a0a-b031-6f464cb03083">

## Books class

<br> The first class: <br>
Books class has 3 functions: <br>
1- display: to deal with the new books and to add title and copies.
<br><br><br>

```
static Books display() {
    print('Enter the title of the book:');
    final title = stdin.readLineSync()!;
    print('Enter book author:');
    final author = stdin.readLineSync()!;
    print('Enter number of copies:');
    final copies = int.parse(stdin.readLineSync()!);
    return Books(title: title, author: author, copies: copies);
  }
  ```
 <br>
  
2- Delete: to delete books you do not want it or adedd by wrong.
```
static void delete(List<Books> books) {
    print('Enter the title of the book to delete:');
    final titleToDelete = stdin.readLineSync()!;
    final bookToDelete = books.firstWhere(
      (book) => book.title == titleToDelete,
      orElse: () => Books(title: '', author: '', copies: 0),
    );
    if (bookToDelete.title.isNotEmpty) {
      books.remove(bookToDelete);
      print('Book deleted successfully.');
    } else {
      print('Book not found.');
    }
  }
```



<br> 3- Edit: this function to update books and to deal with changes.

```

static void edit(List<Books> books) {
    print('Enter the title of the book to edit:');
    final titleToEdit = stdin.readLineSync()!;
    final bookToEdit = books.firstWhere(
      (book) => book.title == titleToEdit,
      orElse: () => Books(title: '', author: '', copies: 0),
    );
    if (bookToEdit.title.isNotEmpty) {
      print('Enter the new title:');
      final newTitle = stdin.readLineSync()!;
      print('Enter the new author:');
      final newAuthor = stdin.readLineSync()!;
      print('Enter the new number of copies:');
      final newCopies = int.parse(stdin.readLineSync()!);
      bookToEdit.title = newTitle;
      bookToEdit.author = newAuthor;
      bookToEdit.copies = newCopies;
      print('Book updated successfully.');
      print('----------------------------------');
    } else {
      print('Book not found.');
    }
```

### Data Class
<br>
in this class, I have been adding some books that already exist in the library.
<br>

```
 List<Books> books = [
    Books(title: 'The sky', author: 'Fahad', copies: 5),
    Books(title: 'nice map', author: 'Ahmed', copies: 3),
    Books(title: '1984', author: 'Salman', copies: 10),
    Books(title: 'Good point', author: 'Sara', copies: 2),
    Books(title: 'The Great Gatsby', author: 'Naser', copies: 4),
    Books(title: 'bath', author: 'Samar', copies: 2),

  ];

class Data1 {
  static bool containsTitle(String title) {
    return books.any((book) => book.title == title);
  }

  static Books search(String title) {
    return books.firstWhere(
      (book) => book.title == title,
      orElse: () => Books(title: '', author: '', copies: 0),
    );
  }
}
```

## Search Class

<br>
In this class, I add two functions that make the user print all names of the books or see particular books from the library.
<br>
<br>

```
class Search {
  static void displayAll(List<Books> books) {
    if (books.isEmpty) {
      print('There are no books in the library.');
    } else {
      print('All books in the library:');
      for (Books book in books) {
        print('${book.title} by ${book.author} - ${book.copies} copies');
      }
    }
  }
```
## Purchase Class 

<br>
This class is very important for this library because it is made users to buy books and see how many books are available in the library.

```
static void purchase(List<Books> books) {
    print('Enter the title of the book to purchase:');
    final titleToPurchase = stdin.readLineSync()!;
    final bookToPurchase = books.firstWhere(
      (book) => book.title == titleToPurchase,
      orElse: () => Books(title: '', author: '', copies: 0),
    );
    if (bookToPurchase.title.isNotEmpty) {
      print('How many copies do you want to purchase?');
      final copiesToPurchase = int.parse(stdin.readLineSync()!);
      if (copiesToPurchase <= bookToPurchase.copies) {
        bookToPurchase.copies -= copiesToPurchase;
        print('Purchase successful.');
      } else {
        print('Purchase failed: not enough copies in stock.');
      }
    } else {
      print('Book not found.');
    }

```

## Main Class
<br>
It is the most important class in the program because this class is the gate to enter another class or call the rest of the class.

```
import 'dart:io';
import 'package:firstapp/Purchase.dart';
import 'Search.dart';
import 'Books.dart';
import 'Data1.dart';

// final books2 = <Books>[];
void main() {
  while (true) {
    print('Enter 1 to add a book.');
    print('Enter 2 to delete a book by title.');
    print('Enter 3 to see All books availabli');
    print('Enter 4 to search on partcular book');
    print('Enter 5 to purchase a book.');
    print('Enter 6 to edite books');
    print('Enter 0 to exit.');
    final choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 0:
        exit(0);
        break;
      case 1:
        final book = Books.display();
        books.add(book);
        print('Book added successfully:');
        print('Title: ${book.title}');
        print('Author: ${book.author}');
        print('Copies: ${book.copies}');
        break;
      case 2:
        Books.delete(books);
        break;

      // default:
      //   print('Invalid choice. Please try again.');
      //   print('-------------------------------------');
      case 3:
        Search.displayAll(books);
        break;
      case 4:
        Search.searchP(books);
        // Data1.getBooks();
        break;

      case 5:
        Purchase.purchase(books);
        break;
      case 6:
        Books.edit(books);

        break;
    }
  }
}

```

## Result or run

<br>
here you can see the result of running the program and I have explained everything in the image.
<br> <br>
<img width="920" alt="expain" src="https://github.com/Flutter-GG/Project-dart-1/assets/140311670/6f00a74c-d161-4529-8d83-40c5ef744fa1">

# Summary

In this program, you can view all books in two options, choose a specific book, add a book, modify it, and delete it, in addition to that the user can buy the book and see it. Program codes have been added that prevent the user from making any mistake, such as buying an empty book or trying to Attach letters instead of numbers. To learn more, please run the program and see it.

<br> <br> <br> 
 10:10 Pm 30 Jul
