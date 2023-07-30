
import 'dart:io';

import 'data.dart';

void main(List<String> arguments) {
  var count = 0;
  while (count < 10) {
    print("please select from menu:");
    print("1: add new ,2: display data, Q: quite");
    String selected = stdin.readLineSync()!;

    switch (selected) {
      case "1":
        addNewItem();
        break;

      case "2":
        displayItem();
        break;

      case "Q" || "q":
        exit(0);

      default:
        print("where are you");
    }
    count++;
  }
}

addNewItem() {
  try {
    print("please inter your name");
    String author = stdin.readLineSync() ?? "John";
    print("please inter your age");
    String country = stdin.readLineSync() ?? "John";
    print("please inter your secretIdentity");
    String language = stdin.readLineSync() ?? "John";
    print("please inter your secretIdentity");
    int pages = int.parse(stdin.readLineSync()!);


    List pawers = [];
    do {
      String enterPawers = stdin.readLineSync()!;

      if (enterPawers == "q") {
        break;
      } else {
        pawers.add(enterPawers);
      }
    } while (true);

    final userMap = {
      "author": author,
      "country": country,
      "language": language,
      "pages": pages
    };
    myData.add(userMap);
  } catch (error) {
    print("error");
  }
}

class Books {
  late String author;
  late String country;
  late String language;
  late int pages;
  Books(
      {required this.author,
      required this.country,
      required this.language,
      required this.pages});
  displayData() {
    print("author:$author country: $country language: $language pages: $pages");
  }
}

displayItem() {
  List<Books> listItem = [];
  for (var element in myData) {
    listItem.add(Books(
        author: element["author"],
        country: element["age"],
        language: element["language"],
        pages: element["pages"]));
  }
  for (var item in listItem) {
    print("------------");
    item.displayData();
  }
}
