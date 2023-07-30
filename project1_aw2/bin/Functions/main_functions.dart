// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings, prefer_is_empty, slash_for_doc_comments, unused_import, unnecessary_string_interpolations
// import 'dart:async';
// import 'package:path/path.dart';
import 'dart:convert';
import '../data/book.dart';
import 'dart:io';
import 'helper_functions.dart';



// (1): print library content
print_library() {
  print(
      "============================Library Content==================================");
  print_list(library);
  print("\n⚪ All books in library: $allCopies");
  print(
      "=============================================================================");
}


// (2): add a new book OR add some copy for specific book
Add_New_Book() {
  try {
    print("type of Adding :\n1: add new book - 2: add some copy:");
    int choice = int.parse(stdin.readLineSync()!);
    
    if (choice == 1) {
      print("Enter title:");
      String title = stdin.readLineSync()!;
      print("Enter author:");
      String author = stdin.readLineSync()!;
      print("Enter category:");
      String category = stdin.readLineSync()!;
      print("Enter copies:");
      int copies = int.parse(stdin.readLineSync()!);
      print("Enter price:");
      double price = double.parse(stdin.readLineSync()!);

      library.add(Book(title, author, category, copies, price));
      allCopies+= copies;
      print("Book Added successfully");
      return;

    } else if (choice == 2) {
      int item = choose_item_number(); // choose book form list (1 - n)
      if (item > 0) {
        print("How many copy do you want to add");
        int copy = int.parse(stdin.readLineSync()!);
        if (copy > 0) {
          library[item - 1].copies = library[item - 1].copies! + copy;
          allCopies += copy;
          print("Coppies Added successfully");
          return;
        }
      }
    }
  } catch (error) {
    print("Invalid input");
    return;
  }
  print("please enter the valid number ");
}


// (3): have to avoid redundancy => choose_item_number();
Delete_Book() {
  print(
      "type of Deleting :\n1: Delete all cpoies of book - 2: Delete some copy:");
  int choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    int item = choose_item_number(); // choose book form list (1 - n)
    if (item > 0) {
      allCopies -= library[item - 1].copies!;
      library.removeAt(item - 1);
      print("book($item) Deleted successfully");
      return;
    }
  } else if (choice == 2) {
    int item = choose_item_number(); // choose book form list (1 - n)
    if (item > 0) {
      print("How many copy do you want to delete");
      int copy = int.parse(stdin.readLineSync()!);
      if (copy > 0 && copy <= library[item - 1].copies!) { // check if it is less than or equal to available copies
        library[item - 1].copies = library[item - 1].copies! - copy;
        allCopies -= copy;
        if (library[item - 1].copies == 0) {
          library.removeAt(item - 1); // if copies equal 0 , remove a book from the library
          print("book($item) Deleted form library");
        }else{
          print("$copy copies of book($item) Deleted");

        }
        return;
      }
    }
  }
  print("please enter the valid number ");
}



// (4): search for title , author and category 
Query_Books() {
  print("Enter type of search  \n1:title  2:author  3:category");
  int choice = int.parse(stdin.readLineSync()!);

  print("write the value of the search");
  String value = stdin.readLineSync()!; // value : name of item user want to find it (java , mark or programming)

  int all_copies = 0; // if found value , count all copies to print it
  for (var element in library) {
    switch (choice) {
      case 1: // title
        if (element.title == value) {
          all_copies += element.copies!;
        }
        break;
      case 2: // author
        if (element.author == value) {
          all_copies += element.copies!;
        }
        break;
      case 3: // category
        if (element.category == value) {
          all_copies += element.copies!;
        }
        break;
      default:
        print("Invalid input");
        return; // check it later
    }
  }
  // print type of search and print number of copies
  String type = (choice == 1)? "title": (choice == 2)? "author": "category";
  print(all_copies > 0? "$type: $value has $all_copies (copy/copies)": "sorry don't find it");
}


// (5): buy a book 
Purchase() {
  int item = choose_item_number(); // choose book form list (1 - n)
  if (item > 0) {
    print("How many copy do you want");
    int copy = int.parse(stdin.readLineSync()!);
    if (copy <= library[item - 1].copies! && copy > 0) { // check valid number of copy
      total_cost = total_cost + (library[item - 1].price! * copy);
      Purchase_book += copy; // increase the number of all books has been Purchased
      allCopies -= copy; // decrease the number of library book
      library[item - 1].copies = library[item - 1].copies! - copy;

      Invoice(item, copy); // Display a detailed invoice after the purchase
      add_Purchased_Book(library[item - 1], copy); // add the book to the Purchase list

      if (library[item - 1].copies == 0) {
        // if user purches all copies , we delete it form library
        print("book \"${library[item - 1].title}\" is sold out");
        library.removeAt(item - 1); // if the user buys all copies, remove a book from the library
      }
      return;
    }
  }
  print("please enter the valid number ");
}

// (5.1): Display a detailed invoice after the purchase
Invoice(int item, int copy) {
  print("($copy) copy/ies of book \"${library[item - 1].title}\" have been successfully purchased with total amount : ${library[item - 1].price! * copy} \$ ");
}


// (6): Edit some information of book 
Editing_Capability() {
  int item = choose_item_number(); // choose book form list (1 - n)
  if (item > 0) {
    print("choose the lable you want to edit it (1 - 3)\n1:title - 2:author - 3:price");
    int label = int.parse(stdin.readLineSync()!); // title, author, and price
    switch (label) {
      case 1: // title
        print("write new title:");
        String newData = stdin.readLineSync()!;
        library[item - 1].title = newData;
        print("title of book ($item) changed to \"$newData\"");
        return;
      case 2: // author
        print("Enter new author:");
        String newData = stdin.readLineSync()!;
        library[item - 1].author = newData;
        print("author of book ($item) changed to \"$newData\"");
        return;
      case 3: // price
        print("Enter new price:");
        double newData = double.parse(stdin.readLineSync()!);
        library[item - 1].price = newData;
        print("price of book ($item) changed to \"$newData\"");
        return;
      default:
        print("please enter the valid number ");
        return;
    }
  }
  print("please enter the valid number ");
}
