import 'dart:io';
import 'data.dart';
import 'admin_func.dart';
import 'shared_func.dart';


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
    String title = stdin.readLineSync()!.toLowerCase();

    for(int i = 0 ; i < myData.length ; i++){
      if(myData[i]["title"].toString().toLowerCase() == title){///find the match title from myData
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
    }else{
      print("\nNo found book");
    }
    
  }
  else{
    return; //Return if user not confirm
  }
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
      String bookName = myInvoice[i].toString().toLowerCase();//collect all the needed books in a list
      int bookPrice = myData[j]['price']; //get each book price 
      if(bookName == (myData[j]['title']).toString().toLowerCase()){ //if the needed book found 
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


