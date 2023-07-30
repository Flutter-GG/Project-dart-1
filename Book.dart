class Book{

  late String bookTitle;
  late String bookAuthorName;
  late String category;
  late int availableCopies;
  late int price;

  Book(String bookTitle, String bookAuthorName, 
    String category, int availableCopies, int price){
      
      this.bookTitle = bookTitle;
      this.bookAuthorName = bookAuthorName;
      this.category = category;
      this.availableCopies = availableCopies;
      this.price = price;   
  }

  addBook (){

    availableCopies ++;
  }

  removeBook (){

    availableCopies--;
  }

  @override
  String toString() {
    
    String bookAsString = "Book title - $bookTitle   Author- $bookAuthorName  Price- $price";

    return bookAsString;
  }

}