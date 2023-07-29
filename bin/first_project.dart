import 'dart:io';
import 'package:first_project/book_data.dart';

void main(List<String> arguments) {
  var count = 0;
  while (count < 10) {
    print("Welcome to Wejdan Library!");
    print("please select from menu:");
    print(
        "1: Query about books, 2: Update the library , 3: Make book purchases, Q: quite.");
    String selected = stdin.readLineSync()!;
    switch (selected) {
      case "1":
        print(
            "1: To view all books, 2: To search in books, 3: Display all Book Categories, Q: quite.");
        String? selected = stdin.readLineSync();
        switch (selected) {
          case '1':
            displayAvailableBook();
            break;
          case '2':
            print(
                "1: To search books by title, 2: To search books by author, 3: To search books by category, Q: quite.");
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
                "1: Mystery/Thriller, 2: Science Fiction/Dystopian, 3: Short Stories/Fiction, 4:Fiction/Romance, 5: Fiction/Self-Help, 6: NonFiction/Science, 7: Fiction/Drama,  Q: quite.");
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
            "1: To add new book, 2: To delete book, 3: To update book info, Q: quite.");
        String? selected = stdin.readLineSync();
        switch (selected) {
          case '1':
            addNewBook();
            break;
          case '2':
            deleteBook();
            break;
          case '3':
            // TODO To update book info
            break;
          case 'q' || 'Q':
            break;
        }
        break;

      case "3":
        // TODO Make book purchases && detailed invoice after the purchase
        break;

      case "Q" || "q":
        exit(0);

      default:
        print("Wrong choese!");
    }
    count++;
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
    print("The book has been added successfully!");
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
        print("The book has been deleted successfully!");
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

searchByTitle() {
  try {
    print("please inter book title:");
    String bookTitle = stdin.readLineSync()!;
    bool flag = false;
    for (int i = 0; i <= myData.length - 1; i++) {
      if (myData[i]['bookTitle'] == bookTitle) {
        print(myData[i]);
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
        print(myData[i]);
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
        print(myData[i]);
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
        print(myData[i]);
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
        "Book Title:$bookTitle Author Name: $authorName Brief Description: $briefDescription Publication Date: $publicationDate Category: $category Available Copies: $availableCopies Price: $price");
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
