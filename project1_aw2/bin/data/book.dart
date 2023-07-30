// ignore_for_file: non_constant_identifier_names, prefer_is_empty, slash_for_doc_comments, unused_import

import 'dart:io';
import 'data.dart';
import 'book.dart';
import '../project1_aw2.dart';
import '../Functions/main_functions.dart';

int Purchase_book = 0; // all book purched in the library
double total_cost = 0; // costs for all purchase
int allCopies = 0; // all copies in the library
List<Book> library = []; // library content
List<Book> all_Purchase_book = []; // books purchased with detailed information

class Book {
  String? title;
  String? author;
  String? category;
  int? copies;
  double? price;

  Book(this.title, this.author, this.category, this.copies, this.price);
}
















