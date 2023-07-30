import 'dart:io';

import 'data.dart';
class Book {
 late  String? title;
 late String? author;
 late String? description;
 late List? catagories;
 late int? copies;
 
 Book({
  required this.title,
  required this.author,
  required this.description,
  required this.catagories,
  required this.copies,
 });
 displayData() {print("title:$title author: $author description: $description catagories: $catagories copies: $copies");
  }

}
// book display function
displayItem() {
  List<Book> listItem = [];
  for (var element in Mybooks) {
    listItem.add(Book(
        title: element["title"],
        author: element["author"],
        description: element["description"],
        catagories: element["catagories"],
        copies: element["copies"],
        ));
  }
  for (var item in listItem) {
    print("------------");
    item.displayData();
  }
}
// adding a new book function 
addBook() {
print("enter the title");
String newTitle = stdin.readLineSync()!;

print("enter the author");
String newAuthor = stdin.readLineSync()!;

print("enter the description");
String newDescription = stdin.readLineSync()!;

print("enter 2 catagories sperated by enter");
List newCatagories = addingToList(2);



final newBook = {
"title" :newTitle,
"author":newAuthor,
"description":newDescription,
"catagories":newCatagories,
};

Mybooks.add(newBook);

}
// this loop to add the catagories to the list
addingToList(int num) {
List EmptyList = [] ;

int count = 0;
while(count < num){
  String input = stdin.readLineSync()!;
  EmptyList.add(input);
count++;
}
return EmptyList;
}

// search function

searchBook() {
print(" please enter the title or author for the book");
String search = stdin.readLineSync()!;
for(int i = 1 ; i < Mybooks.length ; i++){
if (Mybooks[i]["author"] == search || Mybooks[i]["title"] == search ){
  print(" we have this book");
  break;
}else{
  print("sorry ...");
}
}
}

numberOfCopies(){
 print(" please enter the title of the book");
String bookTitle = stdin.readLineSync()!;
for(int i = 1 ; i < Mybooks.length ; i++){
if ( Mybooks[i]["title"] == bookTitle ){
  return Mybooks[i]["copies"];
}else{
  print("wrong entry");
}
}

}

//search == Mybooks.contains({"title" :"$search"}) || search == Mybooks.contains({"author" :"$search"})