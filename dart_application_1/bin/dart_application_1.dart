
import 'dart:io';

// import '../lib/data.dart/data.dart';
import 'func/func.dart';

void main(List<String> arguments) {
  var count = 0;
  while (count < 10) {
    print("welcome to the library");
    print("please select from menu:");
    print("1: add new book ,2: display data,3: delet book Q: quite");
    String selected = stdin.readLineSync()!;

    switch (selected) {
      case "1":
        addNewItem();
        break;

      case "2":
        displayItem();
        break;
        case "3":
        deleteBook();
        break;

      case "Q" || "q":
        exit(0);

      default:
        print("where are you");
    }
    count++;
  }
}

// void deleteBook() {
//   print("Please enter the title of the book that you want to delete?");
//   String booktitle = stdin.readLineSync()!;

//   int initialLength = myData.length;
//   myData.removeWhere((book) => book['title'] == booktitle);

//   if ( myData.length < initialLength) {
//     print("Book '$booktitle' has been deleted successfully.");
//   } else {
//     print("Book '$booktitle' not found.");
//   }
// }




// addNewItem() {
//   try {
//     print("please inter your title");
//     String title = stdin.readLineSync() ?? "John";
//     print("please inter your price");
//     int price = int.parse(stdin.readLineSync()!);
//     print("please inter your secretIdentity");
//     int available = int.parse(stdin.readLineSync()!);
//     print("please inter your cate");

//     List cate = [];
//     do {
//       String enterPawers = stdin.readLineSync()!;

//       if (enterPawers == "q") {
//         break;
//       } else {
//         cate.add(enterPawers);
//       }
//     } while (true);

//     final userMap = {
//       "title": title,
//       "price": price,
//       "available": available,
//       "cate": cate
//     };
//     myData.add(userMap);
//   } catch (error) {
//     print("error");
//   }
// }

// class Book {
//   late String title;
//   late int price;
//   late int available;
//   late List cate;
//   Book(
//       {required this.title,
//       required this.price,
//       required this.available,
//       required this.cate});
//   displayData() {
//     print("title:$title price: $price available: $available cate: $cate");
//   }
// }

// displayItem() {
//   List<Book> listItem = [];
//   for (var element in myData) {
//     listItem.add(Book(
//         title: element["title"],
//         price: element["price"],
//         available: element["available"],
//         cate: element["cate"]));
//   }
//   for (var item in listItem) {
//     print("------------");
//     item.displayData();
//   }
// }