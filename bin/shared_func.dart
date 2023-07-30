import 'data.dart';

//Books class
class Books{
  late String? title;
  late List? authors;
  late List? categories;
  late int? price;
  late String? descrip; //Book description
  late int? copies;
  // static int bookCount = bookInStore();// The number of the books
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


//Function to count all existing books number
bookInStore(){
  num allBooks = 0;
  for(int i = 0; i < myData.length; i++){
    allBooks += myData[i]['copies'];//Summ all copies number
  }
  return allBooks; // return the number of copies
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
