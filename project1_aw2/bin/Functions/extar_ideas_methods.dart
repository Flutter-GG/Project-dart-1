// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings, prefer_is_empty, slash_for_doc_comments, unused_import, unnecessary_string_interpolations
// import 'dart:async';
// import 'package:path/path.dart';
import 'dart:convert';
import 'dart:io';
import '../data/book.dart';
import '../data/data.dart';
import 'menu.dart';


/**********  Extar ideas Methods *****************/

// (7): display all categories, or write a specific category to display all books belongs to it
Display_all_Book_Categories() {
  if (library.length == 0) { // if the library is empty
    print("Sorry there is NO any book in the library");
    return;
  }
  Set all_Categories = {}; // to avoid category duplicate

  print("Do You want display:\n1:all category - 2: specific ");
  int choise = int.parse(stdin.readLineSync()!);

  if (choise == 1) {
    for (var element in library) {
      all_Categories.add(element.category);
    }
    print("Categories: ${all_Categories.toList()}");

  } else if (choise == 2) {
    bool find = false; // if it's still false , print a mesaage (NOT fount)
    print("write the category you want to display all books that belong to it ");
    String category = stdin.readLineSync()!;
    for (var element in library) {
      if (element.category == category) {
        find = true; // the category is correct
        all_Categories.add(element.title);
      }
    }
    if (find) {
      print("Books belong to category \'$category\' are: ${all_Categories.toList()}");
    } else {
      print("Sorry!! the category is not found");
    }
  } else {
    print("please enter the valid number");
  }
}

// (8): All purchased books from the library, and calculate their amount.
Reporting() {
  if (all_Purchase_book.length == 0) {
    print("No book have been Purchased yet");
    return;
  }
  print("all Purchase book:");
  int i = 1;
  for (var element in all_Purchase_book) {
    print("${i++}- title: ${element.title} - author: ${element.author} - category: ${element.category} - copies: ${element.copies} - price: ${element.price} | Total amount: ${element.price! * element.copies!} \$");
  }
  print("🡆  total purchased book: $Purchase_book and total cost is: $total_cost \$");
}