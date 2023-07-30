import 'dart:io';
import 'data.dart';
import 'shared_func.dart';
import 'user_func.dart';


admin(){
  while(true){
      //Display available actions
      print("\nChoose an action: ");
      print("\t1- Add new Book");
      print("\t2- Modifiy on existing Book 'Delete or Update' ");
      print("\t3- Number of books in the library");
      print("\t4- Number of Purches");
      print("\t5- Change to user side");
      print("\t6- Exit");

      //Ask admine to enter his choic
      print("\nEnter your choice: ");
      int selection = int.parse(stdin.readLineSync()!);

      switch(selection){
        case 1: 
          addNewBook(); //If admin need to add new book -> Call addNewBook() function
          break;

        case 2: 
          modifyBook(); //If admin/staff want to delete a book -> Call deleteBook() function
          break;

        case 3:
          //show the number of books by calling bookCount variable from Books class
          print("\tThere are ${bookInStore()} books found in the library\n");
          break;

        case 4:
          //Show the number of pruches that done by the user
          print("\t\n There are ${Books.pruchaseNumber} pruches done from the library");
          break;

        case 5:
          //Switch to user menu
          user();
          break;

        case 6:
          exit(0);// Otherwise exit form program

        default:
          print("\n\tSorry, something went wrong! ");// For unpredictable actions print msg
      }
    }
}

// Adding new books function:
addNewBook(){
  //Take the new book info from the admin user
  print("\nBook Title: ");
  String newTitle = stdin.readLineSync()!;

  print("\nGive a brife description about the book:");
  String descrip = stdin.readLineSync()!;

  print("\nHow many copeis you want to add? ");
  int copyNum = int.parse(stdin.readLineSync()!);

  print("\nHow much does it cost? ");
  int price = int.parse(stdin.readLineSync()!);

  print("\nNumber of Authors: ");
  int numContrib = int.parse(stdin.readLineSync()!);

  print("\nEnter AUTHORS name: 'Hit enter after each name' ");
  List contrib = addItemLoop(numContrib); //Enter names depending on the number owner want

  print("\nNumber of Related Categories: ");
  int numCategory = int.parse(stdin.readLineSync()!);

  print("\nEnter related CATEGORIES: 'Hit enter after each name' ");
  List typs = addItemLoop(numCategory); //Enter names depending on the number owner want

  //then store all collected information as a map
  final newBook = {
    "title": newTitle,
    "authors": contrib,
    "categories": typs,
    'price': price,
    'description': descrip,
    "copies": copyNum
    };

    myData.add(newBook);// add the new info to myData
    // Books.bookCount ++;
    displayItem();// then display all books with new ones
}


//A function to add any new items as a list  'its for adding multiple Authors or Categories
addItemLoop(int numberOfItems){
  List list = []; //Empty list to store info
  int counter = 0;// loop counter
  while(counter < numberOfItems){ //loop until the counter == to number of items
    String named = stdin.readLineSync()!; // Read Author/Category name
    list.add(named); //Add name to the list
    counter++;//increas counter
  }
  return list; //Return the list
}


//Delete or Update on the books function
modifyBook(){
  print("\nFor deleting a book enter 'D or d', for update book information enter 'U or u':");
  String selection = stdin.readLineSync()!.toLowerCase();
  String choice;

  //Determaine the choice of the user to print sutiable msg
  if(selection == 'd'){
    choice = "Deleted";
  }
  else{
    choice = "Updated";
  }
  //If the user choose a selection print a msg
  if(choice.isNotEmpty){
    // Ask the user to enter the needed title
    print("\nPleas enter book title to be $choice: ");
    String title = stdin.readLineSync()!.toLowerCase();

    int exist = 0;//for a future msg

    //Search for matched title in myData file
    for(int i = 0 ; i < myData.length ; i++){
      if(myData[i]["title"].toString().toLowerCase() == title){
        if(selection == 'd'){
          //if the user want to delete a book -> remove it from the list
          myData.remove(myData[i]);
          // Books.bookCount -= myData[i]['copies']; //Decreas the number of books and print a confirmation msg
          print("\n\tBook with title '$title' removed successfully ");
          displayItem(); // then display all books to show the changes
        }
        else if(selection == 'u'){
          //if the user want to update a book -> call update function
          updateBook(i);
          displayItem(); // then display all books to show the changes
        }
        exist++;
      }
    }


    if(exist == 0){ //check if there is any changes by checking the number of counter
      print("\nSorry there is no book with title '$title' in the library :(");
    }else{
      print("\n\tModification succeeded"); // print confirmation msg
    }

  }
  else{
    print("\n\tSorry there are no entered choice!!");// Show alert msg if there is no selection 
  }
    
}

//Updating function 
updateBook(int index){ //take the direct index of the item in myData list
  //Ask the user for the needed part to be update by displaying a menu
  print("\nWhat do you want to modify? \n");
  print("\t1- Title");
  print("\t2- Authors");
  print("\t3- Categories");
  print("\t4- Description");
  print("\t5- Price");
  print("\t6- Number of copies");
  print("Enter yor choice:");
  int choice = int.parse(stdin.readLineSync()!);

  //Go in a case depending on the choice
  switch(choice){
    case 1:
      print("Enter new title");
      String newTitle = stdin.readLineSync()!;
      //change the title by assigning the new one dirctly
      myData[index]['title'] = newTitle;
      break;

    case 2:
      print("Enter the number of Authors");
      int authors = int.parse(stdin.readLineSync()!);// Enter the number of authors
      print("Enter AUTHORS name: 'Hit enter after each name' ");
      List contrib = addItemLoop(authors); //Enter names depending on the number owner want
      myData[index]['authors'] = contrib;//Assigning the authors insted of registerd one
      break;

    case 3:
      print("Enter the number of categories");
      int categ = int.parse(stdin.readLineSync()!);// Enter the number of categories
      print("Enter CATEGORIES name: 'Hit enter after each name' ");
      List type = addItemLoop(categ); //Enter names depending on the number owner want
      myData[index]['categories'] = type; //Assigning the category insted of registerd one
      break;

    case 4:
      print("Enter new description");
      String descrip = stdin.readLineSync()!;
      myData[index]['description'] = descrip; //Assigning the new description 
      break;

    case 5:
      print("Enter new price");
      int price = int.parse(stdin.readLineSync()!);
      myData[index]['price'] = price;//Assigning the new price 
      break;

    case 6:
      print("Enter new numbers of copies");
      int copy = int.parse(stdin.readLineSync()!);
      myData[index]['copies'] = copy; //Assigning the new number of copies 
      break;

    default:
      print("Wrong choice!!");
  }

}
