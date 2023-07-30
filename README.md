```javascript
import 'dart:io';
import 'books.dart';
//import 'package:library_project/library_project.dart' ;
//import 'books.dart';
```
# main fuction #

```javascript

void main(List<String> arguments) {
var count = 0;
while (count < 10) {
print("\n \n Welcome,Please select how I can help you...\n ------------");
print(" 1 Query books \n 2 Purchase a book \n 3 Add a new book \n 4 Delete a book \n 5 categorys \n 6 modify book data \n Q Exit");
String selected = stdin.readLineSync()!;


    switch (selected) {
      case "1": queryBooks();

        break;

      case "2": puchases();

        break;
        
      case "3": addNewBooks();
       
        break;
        
      case "4": deleteBooks();
    
        break;

      case "5": displayCategorys();
    
        break;
      
      case "6": editBooksinfo();

        break;

      case "Q" || "q": 
        exit(0);

      default:
        print("\n Please Try again and select from menu\n");
    }
    count++;
  }


}
```
# categorys display Function
```javascript

displayCategorys() {
 List<BooksInfo> books = [];
   String category = stdin.readLineSync()!;
List<BooksInfo> booksCategory = getBooksCategory(books, category);
for (BooksInfo book in booksCategory) {
print("\n book Title: ${book.bookTitle}  author: ${book.author}  description: ${book.description}  publication Date: ${book.publicationDate}  category: ${book.category}  available: ${book.available}  price: ${book.price}");
}
}
void displayBookCategories(List<BooksInfo> books) {
List<String> categories = [];
for (BooksInfo book in books) {
if (!categories.contains(book.category)) {
categories.add(book.category);
}
}
print("Book Categories:");
for (String category in categories) {
print(category);
}
}
List<BooksInfo> getBooksCategory(List<BooksInfo> books, String category) {
List<BooksInfo> booksCategory = [];
for (BooksInfo book in books) {
if (book.category == category) {
booksCategory.add(book);
}
}

return booksCategory;
}
//
```
# edit Function

```javascript
void editBooksinfo() {
  List<BooksInfo> books = [];
print("enter the name of the book you want to edit..");
String title = stdin.readLineSync()!;
BooksInfo bookEdit = books.firstWhere((book) => book.bookTitle == title);

if (bookEdit != null) {
print("Enter the new title: ");
String newTitle = stdin.readLineSync()!;
print("Enter the new author: ");
String newAuthor = stdin.readLineSync()!;
print("Enter the new description: ");
String newDescription = stdin.readLineSync()!;
print("Enter the new publication Date: ");
String newDate = stdin.readLineSync()!;
print("Enter the new category: ");
String newCategory = stdin.readLineSync()!;
print("Enter the new available: ");
int newAvailable = int.parse(stdin.readLineSync()!);
print("Enter the new price: ");
String newPrice = stdin.readLineSync()!;

bookEdit.bookTitle = newTitle;
bookEdit.author = newAuthor;
bookEdit.description = newDescription;
bookEdit.publicationDate = newDate;
bookEdit.category = newCategory;
bookEdit.available = newAvailable;
bookEdit.price = newPrice;

}
}
```



# Delete Function

```javascript

void deleteBooks() {
List<BooksInfo> books=[];

try{
  print("enter the name of the book you want to delete..");
  String deletBook = stdin.readLineSync()!;
  BooksInfo bookToDelete = books.firstWhere((book) => book.bookTitle == deletBook);

  if (bookToDelete == null) {
    print("Book not found..");
    return;
  }

  bookToDelete.available--;

  if (bookToDelete.available == 0) {
    books.remove(bookToDelete);
  }
  }
catch(error){
    print("error");
    }
}
```
# add Function

```javascript

void addNewBooks() {
List<BooksInfo> newBooks=[];
try{
  print("Add Book Title..");
  String bookTitle = stdin.readLineSync()!;
  print("Add Book Author..");
  String author = stdin.readLineSync()!;
  print("Add Book description..");
  String description = stdin.readLineSync()!;
  print("Add Book publication Date..");
  String publicationDate = stdin.readLineSync()!;
  print("Add Book Category..");
  String category = stdin.readLineSync()!;
  print("Add Book number Of Copies..");
  int available = int.parse(stdin.readLineSync()!);
  print("Add Book Price..");
  String price = stdin.readLineSync()!;

  bool bookFound = newBooks.any((book) => book.bookTitle == bookTitle && book.author == author && book.description == description && book.publicationDate == publicationDate && book.category == category && book.available == available );
  if (!bookFound) {
    newBooks.add(BooksInfo(bookTitle: bookTitle, author: author, description: description, publicationDate: publicationDate, category:category, available: available, price:price));
    //print("$newBooks");
    print(" book Title: $bookTitle author: $author \n description: $description \n publicationDate: $publicationDate \n category: $category \n available: $available \n price: $price");
  }

 final booksMap = {
      "bookTitle": bookTitle,
      "author": author,
      "description": description,
      "publicationDate": publicationDate,
      "category": category,
      "available":available,
      "price": price
    };
    books.add(booksMap);
    print("added successfully...");
    print("book Title: $bookTitle  author: $author  description: $description  publicationDate: $publicationDate  category: $category  available: $available  price: $price");

  } catch (error) {
    print("error");
  }
}
```

# Puchases Function

```javascript

void puchases() {
  List<BooksInfo> books=[];
print("enter the name of the book you want..");
String bookTitles = stdin.readLineSync()!;
List<String> bookTitlesList = bookTitles.split(" ");
for (String bookTitle in bookTitlesList) {
BooksInfo bookToPurchase = books.firstWhere((book) => book.bookTitle == bookTitle);

if (bookToPurchase != null) {
  bookToPurchase.available--;
print(invoice());
}
}
}
 invoice() {
  List<BooksInfo> books=[];

print("\n Invoice \n -------------------------------");

for (BooksInfo book in books) {
print("${book.bookTitle} - ${book.price}");
}


double totalCost = 0;
for (BooksInfo book in books) {
totalCost += book.price as double;
}
print(" \n Total: ${totalCost}");
 }

```

# Query Function 

```javascript

 queryBooks() {
      try {
    print("enter the title, author, or category of the book...");
    String search = stdin.readLineSync()!;
    bool found = false;
    for (int i = 0; i <= books.length - 1; i++) {
      if (books[i]['bookTitle'] == search || books[i]['author'] == search|| books[i]['category'] == search) {
        print(books[i]);
        found = true;
      } else if (i == books.length - 1 && found != true) {
        print("the book you are looking for doesn't Exist");
      }
    }
  } catch (error) {
    print("Error: $error");
  }
}

```
    
# books class #

```javascript

class BooksInfo {
  late String bookTitle;
  late String author;
  late String description;
  late String publicationDate;
  late String category;
  late int available;
  late String price;

  BooksInfo({
    required this.bookTitle,
    required this.author,
    required this.description,
    required this.publicationDate,
    required this.category,
    required this.available,
    required this.price,
  });

  displayData() {
    print("bookTitle:$bookTitle author:$author description:$description publicationDate:$publicationDate category:$category available:$available price:$price");
  }
  
  }
```
