// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings, prefer_is_empty, slash_for_doc_comments, unused_import, unnecessary_string_interpolations
// import 'dart:async';
// import 'package:path/path.dart';
import 'dart:convert';
import 'dart:io';
import 'Functions/menu.dart';
import 'data/data.dart';
import 'data/book.dart';



void main() async {

  // *********  Read form file *********
  final file = File('bin/text.txt');
  Stream<String> lines = file.openRead().transform(utf8.decoder).transform(LineSplitter());
  print('');
  try {
    await for (var line in lines) {
      print('$line');
    }
  } catch (e) {
    print('Error: $e');
  }
  // *********  End Read file *********

  menu(); // Display all choices for the library services

}
