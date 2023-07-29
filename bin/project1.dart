import 'data.dart';
import 'dart:io';

void main(List<String> args) {
  try{
    //Check who want to do a process, Library admin or Customer?
    print("For Admin enter 'A or a', for Customr enter 'C or c', and 'E or e' to exit");
    String choice = stdin.readLineSync()!.toLowerCase();
    //when Admine want to make an action
    if(choice == 'a'){
      admin();
    }
    else if(choice == 'c'){
      user();
    }
    else{
      exit(0);
    }

  }catch(error){
    print("ERROR, somthing went wrong!");
  }
  

}

//Books class
class Books{
  late String? title;
  late List? authors;
  late List? categories;
  late int? price;
  late String? descrip; //Book description
  late int? copies;
  static int bookCount = bookInStore();// The number of the books
  static int pruchaseNumber = 0; //number of paid books
  static List? invoice;

  //Class Book constractor
  Books({
    this.title ,
    this.authors,
    this.categories,
    this.price,
    this.descrip,
    this.copies
    });

    //Method to display an information about any book
    displayData() {
       print("Title:$title, Authours: $authors, \nCategories: $categories, Copies: $copies Price: $price\nDescription: $descrip");
  }
}





//Functions:

//Function for searching for a specific book, it will take the way to search from the user & info about title, author, or category
searchBy(String wayToSearch, String info){
  List allBooks = []; //List to store all books realted to Author, Title, or Category
  int? copy = 0; //To check for any existing copies

  if(wayToSearch == 'title'){ // check if the user will search by book title
    for(int i =0 ; i < myData.length ; i++){ //enter a loop for searching im myData
      if((myData[i]['title']).toString().toLowerCase() == info.toLowerCase()){ //Ignore the case in searching to return accurate info
        allBooks.add(myData[i]['title']);// if there is any matching store the book in a list
        copy = myData[i]['copies']; //and get the number of copies
      }
    }
    return ("There are $copy copies of Book named '$info'"); //Info msg 
  }

  else{// if user search by either Author or Categories
    for (int i =0 ; i< myData.length ; i++) { 
      List temp = myData[i][wayToSearch]; //Store each list insid Category or Author list as a temprary list
      if((temp.toString().toLowerCase()).contains(info.toLowerCase())){//Check if its containe the searched info
        allBooks.add(myData[i]['title']);
      }
    }
   
    if(allBooks.isEmpty){
      return ("Sorry, there is no found book :( ");// If there are no book found, the list will be empty
    }else{
      return ("Books with similer $wayToSearch are : $allBooks");//Otherwise show an information about the book
    }
    
  }
  
}


// Adding new books function:
addNewBook(){
  //Take the new book info from the admin user
  print("Book Title: ");
  String newTitle = stdin.readLineSync()!;

  print("Give a brife description about the book:");
  String descrip = stdin.readLineSync()!;

  print("How many copeis you want to add? ");
  int copyNum = int.parse(stdin.readLineSync()!);

  print("How much does it cost? ");
  int price = int.parse(stdin.readLineSync()!);

  print("Number of Authors: ");
  int numContrib = int.parse(stdin.readLineSync()!);

  print("Enter AUTHORS name: 'Hit enter after each name' ");
  List contrib = addItemLoop(numContrib); //Enter names depending on the number owner want

  print("Number of Related Categories: ");
  int numCategory = int.parse(stdin.readLineSync()!);

  print("Enter related CATEGORIES: 'Hit enter after each name' ");
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
    Books.bookCount ++;
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

//A function to display all books in the store
displayItem() {
  List<Books> listItem = []; // Create an empty list with type BOOKS
  for (var item in myData) { //loop for retrieving info from myData file 
  
  //Add a new object form book class each time, until finishing all stored books in data file
    listItem.add(Books( 
        title: item["title"],
        authors: item["authors"],
        categories: item["categories"],
        descrip: item["description"],
        price: item['price'],
        copies: item["copies"]));
  }

  for (var item in listItem) { //Go in another loop to display all stored data
    print("____________");
    item.displayData(); //call method from Books class
  }
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
          Books.bookCount --; //Decreas the number of books and print a confirmation msg
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
  print("\nWhat do you wand to modify? \n");
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

//Buying a book function 
purchase(){
  List myBooks = []; //Create an empty book to store chosen books
  bool flag = false;
  //Show the avilable books 
  print("Avilable Books in the store:");
  displayItem();

  print("\nHow many books you want to buy?");
  int bookToBuy = int.parse(stdin.readLineSync()!); //Ask for the number of needed books

  List index = []; //store the index of each needed book to facilitate future operations
  int counter = 0;
  while(counter < bookToBuy){ //loop untile counter become less than number of books
    print("\nEnter the ${counter+1} book title: ");//ask the user to enter the title of each needed book
    String title = stdin.readLineSync()!;

    for(int i = 0 ; i < myData.length ; i++){
      if(myData[i]["title"] == title){///find the match title from myData
        index.add(i);//store there indexes
        myBooks.add(title); //add the book need to buy
      }      
    }
    counter++;
  }

  //check if the user are sure about buying the books
  print("To confirm buying chosen books enter 'C or c', else 'N or n'");
  String confirmation = stdin.readLineSync()!.toLowerCase();

  if(confirmation == 'c'){
    //when order confirmed start reducing the number of copyies
    for(int x = 0; x < index.length; x++){
      if( myData[index[x]]['copies'] > 0){//At first check if there are enough copies
        myData[index[x]]['copies']--;
        Books.pruchaseNumber++;//Increase the pruches process
        flag = true;

      }else{
        print("Sorry, no enough copies to sale for ${myData[index[x]]['title']}"); //Show msg if no found copies
      }
    }
    
    if(flag){
      print("\nPurchase completed"); //Show confirmation msg
      invoice(myBooks);// Preduce an invoice for the user
    }
    
  }
  else{
    return; //Return if user not confirm
  }
}

//Function to count all existing books number
bookInStore(){
  num allBooks = 0;
  for(int i = 0; i < myData.length; i++){
    allBooks += myData[i]['copies'];//Summ all copies number
  }
  return allBooks; // return the number of copies
}

//Creat an invoice function
invoice(List myInvoice){
  //Print the structure of the invoice
  print("\n\tYOUR INVOICE");
  print("BOOKS \t\t\tPRICE\n");

  num totalPrice = 0;//to store the summtion of all prices
  List price = [];// to store each price

  for(int i = 0 ; i < myInvoice.length; i++){
    for(int j = 0 ; j < myData.length; j++){
      String bookName = myInvoice[i];//collect all the needed books in a list
      int bookPrice = myData[j]['price']; //get each book price 
      if(bookName == myData[j]['title']){ //if the needed book found 
        price.add(bookPrice);//take its price and add it to the list
        print('$bookName, \t$bookPrice');//show each book info individually
        print("___________");
      }
    }
  }

  //Sum the total price 
  for (num i in price) {
  totalPrice += i;
  }
  
  print("Total payment: $totalPrice");//Show the total
}



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
          print("\tThere are ${Books.bookCount} books found in the library\n");
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

user(){
  while(true){
      //Display available actions
      print("\nChoose from menu: ");
      print("\t1- Search for a Book");
      print("\t2- Buy a Book");
      print("\t3- Display all Books info");
      print("\t4- Display all categories");
      print("\t5- Change to admin side");
      print("\t6- Exit");
      print("\nEnter your choice number: ");
      int selection = int.parse(stdin.readLineSync()!); //take the selection
      String info;// will be used later

      switch(selection){
        case 1:
          //Display all avilable ways to search for a book
          print("\nI will search by: ");
          print("\t1- Title");
          print("\t2- Author");
          print("\t3- Category");
          print("\t4- Cancel & Exit");
          print("\nChoice: ");
          int searchWay = int.parse(stdin.readLineSync()!);

          switch(searchWay){
            case 1:
              //Take the book title info
              print("\nEnter book title: ");
              info = stdin.readLineSync()!;
              print(searchBy('title',info)); //call search function 
              break;
              
            case 2:
              //Take the book authors info
              print("\nEnter book author: ");
              info = stdin.readLineSync()!;
              print(searchBy('authors',info));//call search function 
              break;

            case 3:
              //Take the book categories info
              print("\nEnter book category: ");
              info = stdin.readLineSync()!;
              print(searchBy('categories',info));//call search function 
              break;

            case 4:
              exit(0);//end program

            default:
              print("\n\tSorry, something went wrong! ");
          }
          break;

        case 2:
          //Call purchase function to buy a book
          purchase();
          break;

        case 3:
          //Display all item in library by calling displayItem function
          displayItem();
          break; 

        case 4:
          //Show all avilable category using allCategory function
          print(allCategory());
          break;

        case 5:
          //Switch to admin/staff menu
          admin();
          break;

        case 6:
          exit(0);

        default:
              print("\n\tSorry, something went wrong! ");

      }
    }
}

//Extra
allCategory(){
  List allType = []; //List to store all categories

  for (int i =0 ; i< myData.length ; i++) { 
      List temp = myData[i]['categories']; //Store each list insid Category list 

      for(int j = 0 ; j < temp.length ; j++){//Another loop for the inner list
        allType.add(temp[j]); // Add each element insted of adding a list
      }  
  }
  return allType.toSet(); //Return list as a set to remove duplication
}

