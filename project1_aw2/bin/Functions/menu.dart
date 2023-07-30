// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings, prefer_is_empty, slash_for_doc_comments, unused_import, unnecessary_string_interpolations
// import 'dart:async';
// import 'package:path/path.dart';
import 'dart:convert';
import 'dart:io';
import 'extar_ideas_methods.dart';
import 'helper_functions.dart';
import 'main_functions.dart';
import '../project1_aw2.dart';


menu() async {

  // read all data from bookData list , and load it as an object in library list
  initial_library();

    do {
    print("\nEnter the service number form the list: ");
    print(
        "(1): Print library content (2): Add new book (3): Delete book (4): Search for book\n(5): buy a book (6): Edit book content (7): Display all Book Categories\n(8): show all purchased (0): Exit\n");
    try {
      int number = int.parse(stdin.readLineSync()!);
      switch (number) {
        case 1:
          print_library();
          break;
        case 2:
          Add_New_Book();
          break;
        case 3:
          Delete_Book();
          break;
        case 4:
          Query_Books();
          break;
        case 5:
          Purchase();
          break;
        case 6:
          Editing_Capability();
          break;
        case 7:
          Display_all_Book_Categories();
          break;
        case 8:
          Reporting();
          break;
        case 0:
          final file = File('bin/text2.txt');
          Stream<String> lines = file.openRead().transform(utf8.decoder).transform(LineSplitter());
          print('');
          try {
            await for (var line in lines) {
              print('$line');
            }
          } catch (e) {
            print('Error: $e');
          }
          exit(0);
        default:
          print("Invalid input");
          break;
      }
    } catch (erroe) {
      print("Invalid input");
    }
  } while (true);
}