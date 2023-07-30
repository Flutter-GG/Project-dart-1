class Book {
  late String title;
  late String author;
  late List <String> category;
  late int numCopies; // number of avaliable books
  late double price;

  //constructor ..
  Book(
      {required this.title,
      required this.author,
      required this.category,
      required this.numCopies,
      required this.price});

// a method to display the books
  display() {
    print('Title: $title, Author: $author, Category: $category, Avaliable copies: $numCopies, Price: $price');
  }
}
