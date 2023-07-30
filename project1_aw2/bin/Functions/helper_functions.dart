// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings, prefer_is_empty, slash_for_doc_comments, unused_import, unnecessary_string_interpolations
// import 'dart:async';
// import 'package:path/path.dart';
import 'dart:convert';
import 'dart:io';
import '../data/book.dart';
import '../data/data.dart';
import 'main_functions.dart';
// import '../project1_aw2.dart';
// import 'main_functions.dart';

// read all data from bookData list , and load it as an object in library list
initial_library() {
  for (var i = 0; i < bookData.length; i++) {
    library.add(Book(bookData[i]["title"], bookData[i]["author"],
        bookData[i]["category"], bookData[i]["copies"], bookData[i]["price"]));
    allCopies += library[i].copies!;
  }
}


// print a book deatiled for any list
print_list(List list) {
  int i = 1;
  for (var element in list) {
    print("${i++}- title: ${element.title} - author: ${element.author} - category: ${element.category} - copies: ${element.copies} - price: ${element.price}");
  }
}


// - add new book Purchased to the purchased list (all_Purchase_book).
// - first of all, check if the book has been purchased or not,
//   if yes, have to increment copies if no, add a new Book to the purchased list
add_Purchased_Book(Book book, int newCopy) {
  for (var element in all_Purchase_book) {
    if (element.title == book.title && element.author == book.author && element.category == book.category && element.price == book.price) { 
      element.copies = element.copies! + newCopy; // if yes , book is already added to the list , increament a copies
      return;
    }
  }
  // if No , book have not purchased before , add it to the list
  all_Purchase_book.add(Book(book.title, book.author, book.category, newCopy, book.price));
}


// helper function to display ordered menu
int choose_item_number() {
  print_library();
  print("choose the item number (1 - ${library.length})");
  int item = int.parse(stdin.readLineSync()!);
  if (item > 0 && item <= library.length) {
    return item;
  }
  return -1;
}