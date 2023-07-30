import 'dart:io';
import 'myBooks.dart';

void main() {
      // Displaying menu
     var count = 0;
     while (count < 10) {
     print("******************************************************************");
     print("********************  Welcome to Our library! ********************");
     print("--------------        ");
     print("        Select From menu: :");
     print("        1. Display All Books :                2. Add Books  :");
     print("        3. Delete Book:                       4. Search Book by Id:");
     print("        5. Buy a book :                       0. Close library :( ");
     print("--------------        ");
     print("******************************************************************");
    String selected = stdin.readLineSync()!;
    switch (selected) {
      case "1":
       displayBooks();
        break;

      case "2":
      addNewBook();
        break;

      case "3":
      deleteBookByIb();
        break;

      case "4":
       searchBookById();
        break; 
        
       case "5":
        buyBook();
        break;   

      case "0":
        exit(0);

      default:
        print("Choose again from the list ...");
    }
    count++;
  }
}
class Books {
   int? id;
   String? name;
   String? author;
   int amount =0;
   double price = 0.0;
  Books(
      { this.id,
       this.name,
       this.author,
       this.amount =0 ,
       this.price =0.0 ,});
  displayData() {
    print("        Id of book :$id                Name of book: $name ");
    print("        Author :$author                    amount of book : $amount ");
    print("        Price of book :$price SAR              ");
    
  }
}
 // funtion that display Books
displayBooks() {
    print("===================================================================");
    print("====================> Display All Books! <=========================");
  List<Books> listBooks = [];
 for (var element in myBooks) {
    listBooks.add(Books(
      id: element["id"] as int,
        name: element["name"] as String,
        author: element["author"] as String ,
        amount: element["amount"] as int,
        price: element["price"] as double ));
  } 
  for (var item in listBooks) {
    print("===================================================================");
    item.displayData();
  }
  
} 
   //funtion that add books
addNewBook() { 
      print("===================================================================");
      print("====================> Add Books ! <=================================");
  try {
    print("        Enter Book ID :");
    int addId = int.parse(stdin.readLineSync()!);
    print("        Enter name of Book :");
     String? addName = stdin.readLineSync()??"Abrar";
    print("        Enter name author of Book :");
     String addAuthor = stdin.readLineSync()??"Abrar";
    print("        Enter amount of Book :");
    int addAmount = int.parse(stdin.readLineSync()!);
    print("        Enter price of Book :");
    double addPrice = double.parse(stdin.readLineSync()!);
      print("        Done!!added Book ..");
    final  userMap  = {
      "id": addId,
      "name": addName,
      "author": addAuthor,
      "amount": addAmount ,
      "price": addPrice ,
    };
    myBooks.add(userMap);
  } catch (error) {
    print("error");
  }
   print("===================================================================");
}
// funtion that delete Book By Ib
deleteBookByIb(){
      print("===================================================================");
      print("====================> Delete Book ! <==============================");
  try {
    print("        Enter Book ID to delete :");
      int removeBookByIb = int.parse(stdin.readLineSync()!);
       List<Books> listBooks = [];
     for(int i =0 ;i<myBooks.length; i++){
          if(myBooks[i]['id']  == removeBookByIb ){
   print("        Do you want to delete ?(y/n):");
   String? inputYes = stdin.readLineSync();
   if(inputYes == 'y' || inputYes == 'Y'){
      var  listMyBooks = myBooks.removeWhere((x) => x['id'] == removeBookByIb );
   print("        Done!!the Book Deleted ..");
    break;
   } else{
    print("        Thank you!! Not Book Deleted ..");
   }  
          } else{       print("There is no such Book in Our library!!");
            break;   
}
     }
  
  } catch (error) {
    print("error");
  }
   print("===================================================================");
} 
 //funtion that search Book By Id
searchBookById() {
    print("===================================================================");
    print("====================> Search Book by Id! <=========================");
  
        print("        Enter Book ID to search :");
        int searchId = int.parse(stdin.readLineSync()!);
    List<Books> listBooks = [];
     for(int i =0 ;i<myBooks.length; i++ ){
          if(myBooks[i]['id']  == searchId ){
        var listMyBooks = myBooks.firstWhere((x) => x['id'] == searchId );
      print(listMyBooks); 
                            break;   

   }
    else{
    print("        There is no such Book in Our library!! ..");
                      break;   
   }  
   }     } 

    //funtion that buy Book
          buyBook(){
    print("===================================================================");
    print("====================> buy A Book! <=========================");
       try {
    print("        Enter ID of book do you want to buy :");
    int addId = int.parse(stdin.readLineSync()!);
    print("        Enter amount(number) of Book :");
    int addAmount = int.parse(stdin.readLineSync()!);  
   
   // myBooks.add(userMap);
     for (var element in myBooks) {
      Books book; Books(
        id: element["id"] as int,
        name: element["name"] as String,
        author: element["author"] as String ,
        amount: element["amount"] as int,
        price: element["price"] as double );
   
  } 


    
    //---
    
    List listPrice = [];
    int newPrice =0;
    for(int i = 0 ;i<myBooks.length; i++){
        Books book; Books(
        id: myBooks[i]["id"] as int,
        name: myBooks[i]["name"] as String,
        author: myBooks[i]["author"] as String ,
        amount: myBooks[i]["amount"] as int,
        price: myBooks[i]["price"] as double );
    if(myBooks[i]['id']  == addId ){
     if(myBooks[i]['amount']  == 0){
      print("There is no such Book in Our library!!");
                //  break;   
    return;
     } else{
         /// int newPrice =0;
       //  int newPrice = myBooks['price'] *  ;
              listPrice.add(addAmount);
              newPrice *= addAmount;
     print("Thank you!! Total Price: $newPrice SR");
            break;   


    } } else{
            print("There is no such Book in Our library!!");
                  break;   
    }
  
    }
  
  } catch (error) {
    print("error");
  }
   print("===================================================================");

          }
 