import 'dart:io';
import 'package:first_project/book_data.dart';

void main() {
  var count = 0;
  while (count < 50) {
    print("Welcome to Wejdan Library!");
    print("please select from menu:");
    print(
        "1: Query about books.\n2: Update the library.\n3: To make a book purchase.\nQ: quite.");
    String selected = stdin.readLineSync()!;
    switch (selected) {
      case "1":
        print(
            "1: To view all books.\n2: To search in books.\n3: Display all Book Categories.\nQ: quite.");
        String? selected = stdin.readLineSync();
        switch (selected) {
          case '1':
            displayAvailableBook();
            break;
          case '2':
            print(
                "1: To search books by title.\n2: To search books by author.\n3: To search books by category.\nQ: quite.");
            String? selected = stdin.readLineSync();
            switch (selected) {
              case '1':
                searchByTitle();
                break;
              case '2':
                searchByAuthor();
                break;
              case '3':
                searchByCategory();
                break;
              case 'q' || 'Q':
                break;
            }
            break;
          case '3':
            print("please select the category from menu:");
            print(
                "1: Mystery/Thriller.\n2: Science Fiction/Dystopian.\n3: Short Stories/Fiction.\n4: Fiction/Romance.\n5: Fiction/Self-Help.\n6: NonFiction/Science.\n7: Fiction/Drama.\nQ: quite.");
            String? selected = stdin.readLineSync();
            switch (selected) {
              case '1':
                searchInCategory('Mystery/Thriller');
                break;
              case '2':
                searchInCategory('Science Fiction/Dystopian');
                break;
              case '3':
                searchInCategory('Short Stories/Fiction');
                break;
              case '4':
                searchInCategory('Fiction/Romance');
                break;
              case '5':
                searchInCategory('Fiction/Self-Help');
                break;
              case '6':
                searchInCategory('NonFiction/Science');
                break;
              case '7':
                searchInCategory('Fiction/Drama');
                break;
              case 'q' || 'Q':
                break;
            }
            break;
          case 'q' || 'Q':
            break;
        }
        break;

      case "2":
        print(
            "1: To add new book.\n2: To delete book.\n3: To update book info.\nQ: quite.");
        String? selected = stdin.readLineSync();
        switch (selected) {
          case '1':
            addNewBook();
            break;
          case '2':
            deleteBook();
            break;
          case '3':
            print(
                "1: To update the title of book.\n2: To update the author name.\n3: To update the brief description.\n4: To update the publication date of the book.\n5: To update the category of the book.\n6: To update the available copies of book.\n7: To update the price of the book.\nQ: quite.");
            String? selected = stdin.readLineSync();
            print("Please enter the title of the book you want to update:");
            String selectedBook = stdin.readLineSync()!;
            switch (selected) {
              case '1':
                updateBookInfo(selectedBook, '1');
                break;
              case '2':
                updateBookInfo(selectedBook, '2');
                break;
              case '3':
                updateBookInfo(selectedBook, '3');
                break;
              case '4':
                updateBookInfo(selectedBook, '4');
                break;
              case '5':
                updateBookInfo(selectedBook, '5');
                break;
              case '6':
                updateBookInfo(selectedBook, '6');
                break;
              case '7':
                updateBookInfo(selectedBook, '7');
                break;
              case 'q' || 'Q':
                break;
            }
            break;
          case 'q' || 'Q':
            break;
        }
        break;

      case "3":
        makeBookPurchase();
        break;

      case "Q" || "q":
        exit(0);

      default:
        print("Wrong choese!");
    }
    count++;
  }
}

class Book {
  late String? bookTitle;
  late String? authorName;
  late String? briefDescription;
  late String? publicationDate;
  late String? category;
  late int? availableCopies;
  late int? price;

  Book(
      {this.bookTitle,
      this.authorName,
      this.briefDescription,
      this.publicationDate,
      this.category,
      this.availableCopies,
      this.price});
  displayData() {
    print(
        "Book Title:$bookTitle\nAuthor Name: $authorName\nBrief Description: $briefDescription\nPublication Date: $publicationDate\nCategory: $category\nAvailable Copies: $availableCopies\nPrice: $price");
  }
}

addNewBook() {
  try {
    print("please inter book title:");
    String bookTitle = stdin.readLineSync()!;
    print("please inter author name:");
    String authorName = stdin.readLineSync()!;
    print("please inter brief Description about the book:");
    String briefDescription = stdin.readLineSync()!;
    print("please inter publication date:");
    String publicationDate = stdin.readLineSync()!;
    print("please inter book category:");
    String category = stdin.readLineSync()!;
    print("please inter available copies of the book:");
    int availableCopies = int.parse(stdin.readLineSync()!);
    print("please inter the book price:");
    int price = int.parse(stdin.readLineSync()!);

    final bookMap = {
      "bookTitle": bookTitle,
      "authorName": authorName,
      "briefDescription": briefDescription,
      "publicationDate": publicationDate,
      "category": category,
      "availableCopies": availableCopies,
      "price": price
    };
    myData.insert(0, bookMap);
    print("\nThe book has been added successfully!");
  } catch (error) {
    print("Error: $error");
  }
}

deleteBook() {
  try {
    print("please inter book title:");
    String bookTitle = stdin.readLineSync()!;
    bool flag = false;
    for (int i = 0; i <= myData.length - 1; i++) {
      if (myData[i]['bookTitle'] == bookTitle) {
        myData.removeWhere((item) => item["bookTitle"] == bookTitle);
        print("\nThe book has been deleted successfully!");
        flag = true;
      } else if (i == myData.length - 1 && flag != true) {
        print(
            "\nThe book does not exist! please check the spelling and try again.");
      }
    }
  } catch (error) {
    print("Error: $error");
  }
}

displayAvailableBook() {
  List<Book> listItem = [];
  for (var element in myData) {
    listItem.add(Book(
      bookTitle: element["bookTitle"],
      authorName: element["authorName"],
      briefDescription: element["briefDescription"],
      publicationDate: element["publicationDate"],
      category: element["category"],
      availableCopies: element["availableCopies"],
      price: element["price"],
    ));
  }
  int number = 1;
  for (var item in listItem) {
    print("------$number------");
    number++;
    item.displayData();
  }
}

searchByTitle() {
  try {
    print("please inter book title:");
    String bookTitle = stdin.readLineSync()!;
    bool flag = false;
    for (int i = 0; i <= myData.length - 1; i++) {
      if (myData[i]['bookTitle'] == bookTitle) {
        printMydata(i);
        flag = true;
      } else if (i == myData.length - 1 && flag != true) {
        print(
            "The book does not exist! please check the spelling and try again.");
      }
    }
  } catch (error) {
    print("Error: $error");
  }
}

searchByAuthor() {
  try {
    print("please inter author name:");
    String authorName = stdin.readLineSync()!;
    bool flag = false;
    for (int i = 0; i <= myData.length - 1; i++) {
      if (myData[i]['authorName'] == authorName) {
        printMydata(i);
        flag = true;
      } else if (i == myData.length - 1 && flag != true) {
        print(
            "The author name does not exist! please check the spelling and try again.");
      }
    }
  } catch (error) {
    print("Error: $error");
  }
}

searchByCategory() {
  try {
    print("please inter category:");
    String category = stdin.readLineSync()!;
    bool flag = false;
    for (int i = 0; i <= myData.length - 1; i++) {
      if (myData[i]['category'] == category) {
        printMydata(i);
        flag = true;
      } else if (i == myData.length - 1 && flag != true) {
        print(
            "The category does not exist! please check the spelling and try again.");
      }
    }
  } catch (error) {
    print("Error: $error");
  }
}

searchInCategory(String category) {
  ///for Extra creadt
  try {
    bool flag = false;
    for (int i = 0; i <= myData.length - 1; i++) {
      if (myData[i]['category'] == category) {
        printMydata(i);
        flag = true;
      } else if (i == myData.length - 1 && flag != true) {
        print(
            "The category does not exist! please check the spelling and try again.");
        break;
      }
    }
  } catch (error) {
    print("Error: $error");
  }
}

updateBookInfo(String selectedBook, String caseNumber) {
  print("Please if you want to cancel press C.");
  switch (caseNumber) {
    case '1':
      bool flag = false;
      for (int i = 0; i <= myData.length - 1; i++) {
        if (myData[i]['bookTitle'] == selectedBook) {
          print("Please entr the new title of the book:");
          String newBookTitle = stdin.readLineSync()!;
          myData[i]['bookTitle'] = newBookTitle;
          flag = true;
          print("\nThe book has been updated successfully!");
        } else if (i == myData.length - 1 && flag != true) {
          print(
              "The book does not exist! please check the spelling and try again.");
        }
      }
      break;
    case '2':
      bool flag = false;
      for (int i = 0; i <= myData.length - 1; i++) {
        if (myData[i]['bookTitle'] == selectedBook) {
          print("Please entr the new author name the book:");
          String newAuthorName = stdin.readLineSync()!;
          myData[i]['authorName'] = newAuthorName;
          flag = true;
          print("\nThe book has been updated successfully!");
        } else if (i == myData.length - 1 && flag != true) {
          print(
              "The book does not exist! please check the spelling and try again.");
        }
      }
      break;
    case '3':
      bool flag = false;
      for (int i = 0; i <= myData.length - 1; i++) {
        if (myData[i]['bookTitle'] == selectedBook) {
          print("Please entr the new brief description the book:");
          String newBriefDescription = stdin.readLineSync()!;
          myData[i]['briefDescription'] = newBriefDescription;
          flag = true;
          print("\nThe book has been updated successfully!");
        } else if (i == myData.length - 1 && flag != true) {
          print(
              "The book does not exist! please check the spelling and try again.");
        }
      }
      break;
    case '4':
      bool flag = false;
      for (int i = 0; i <= myData.length - 1; i++) {
        if (myData[i]['bookTitle'] == selectedBook) {
          print("Please entr the new publication date the book:");
          String newPublicationDate = stdin.readLineSync()!;
          myData[i]['publicationDate'] = newPublicationDate;
          flag = true;
          print("\nThe book has been updated successfully!");
        } else if (i == myData.length - 1 && flag != true) {
          print(
              "The book does not exist! please check the spelling and try again.");
        }
      }
      break;
    case '5':
      bool flag = false;
      for (int i = 0; i <= myData.length - 1; i++) {
        if (myData[i]['bookTitle'] == selectedBook) {
          print("Please entr the new category the book:");
          String newCategory = stdin.readLineSync()!;
          myData[i]['category'] = newCategory;
          flag = true;
          print("\nThe book has been updated successfully!");
        } else if (i == myData.length - 1 && flag != true) {
          print(
              "The book does not exist! please check the spelling and try again.");
        }
      }
      break;
    case '6':
      bool flag = false;
      for (int i = 0; i <= myData.length - 1; i++) {
        if (myData[i]['bookTitle'] == selectedBook) {
          print("Please entr the new available copies the book:");
          int newAvailableCopies = int.parse(stdin.readLineSync()!);
          myData[i]['availableCopies'] = newAvailableCopies;
          flag = true;
          print("\nThe book has been updated successfully!");
        } else if (i == myData.length - 1 && flag != true) {
          print(
              "The book does not exist! please check the spelling and try again.");
        }
      }
      break;
    case '7':
      bool flag = false;
      for (int i = 0; i <= myData.length - 1; i++) {
        if (myData[i]['bookTitle'] == selectedBook) {
          print("Please entr the new price the book:");
          int newPrice = int.parse(stdin.readLineSync()!);
          myData[i]['price'] = newPrice;
          flag = true;
          print("\nThe book has been updated successfully!");
        } else if (i == myData.length - 1 && flag != true) {
          print(
              "The book does not exist! please check the spelling and try again.");
        }
      }
      break;
    case 'C' || 'c':
      break;
  }
}

makeBookPurchase() {
  try {
    List purchesInvoice = [];
    var count = 0;
    int number = 0;
    while (count < 10) {
      for (int i = 0; i <= myData.length - 1; i++) {
        var bookTitle = myData[i]['bookTitle'];
        var availableCopies = myData[i]['availableCopies'];
        var price = myData[i]['price'];
        print("$number:$bookTitle");
        print("Available Copies: $availableCopies \t\t Price: $price");
        number++;
      }
      number = 0;
      print("Please enter the code of the book you want to purches:");
      int selectedBook = int.parse(stdin.readLineSync()!);
      print("Please enter the quantity of book u wanted:");
      int quantity = int.parse(stdin.readLineSync()!);
      if (myData[selectedBook]['availableCopies'] >= 0 &&
          quantity <= myData[selectedBook]['availableCopies']) {
        myData[selectedBook]['availableCopies'] =
            myData[selectedBook]['availableCopies'] - quantity;
        var bookTitle = myData[selectedBook]['bookTitle'];
        var price = myData[selectedBook]['price'];
        final invoice = {
          'bookTitle': bookTitle,
          'price': price,
          'quantity': quantity,
          'Total': quantity * price
        };
        purchesInvoice.insert(0, invoice);

        print(
            "ٌAnother book ? press Y, if you done press any key to print invoice");
        String? complate = stdin.readLineSync();
        if (complate == 'Y' || complate == 'y') {
        } else {
          printInvoice(purchesInvoice);
          break;
        }
      } else {
        print(
            "Please enter the quantity of book u wanted less or equal to available copies");
      }
      count++;
    }
  } catch (error) {
    print("error: $error");
  }
}

printInvoice(List purchesInvoice) {
  int total = 0;
  for (int i = 0; i <= purchesInvoice.length - 1; i++) {
    var bookTitle = purchesInvoice[i]['bookTitle'];
    int price = purchesInvoice[i]['price'];
    int quantity = purchesInvoice[i]['quantity'];
    int subtotal = price * quantity;
    total = total + subtotal;
    print("$i: $bookTitle.");
    print("Price: $price.\t Quantity: $quantity.");
    print("Sub total: $subtotal.");
    print("____________________________");
  }
  print("Total: $total.");
  print("____________________________");
  print("Thanks for shopping from Wejdan Library=)");
  exit(0);
}

printMydata(int index) {
  for (int i = 0; i <= myData.length - 1; i++) {
    if (i == index) {
      var bookTitle = myData[index]['bookTitle'];
      var authorName = myData[index]['authorName'];
      var briefDescription = myData[index]['briefDescription'];
      var publicationDate = myData[index]['publicationDate'];
      var category = myData[index]['category'];
      int availableCopies = myData[index]['availableCopies'];
      int price = myData[index]['price'];
      print("Book title: $bookTitle.\t Author name: $authorName");
      print("Brief description: $briefDescription.");
      print("Publication date: $publicationDate.\t Category: $category.\t ");
      print("Available Copies: $availableCopies.\t Price: $price.\t ");
      print("____________________________");
    }
  }
}
