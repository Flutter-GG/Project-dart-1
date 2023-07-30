class Book {
  late String book_Name;
  late String author_Name;
  late String brief_Description;
  late String publication_Date;
  late String Category;
  late int Available_Copies;
  late int Price;

  Book(
      {required this.book_Name,
      required this.author_Name,
      required this.brief_Description,
      required this.publication_Date,
      required this.Category,
      required this.Available_Copies,
      required this.Price});
  displayBook() {
    print("Book Name: $book_Name");
    print("Author Name: $author_Name");
    print("Brief Description: $brief_Description");
    print("Publication Date: $publication_Date");
    print("Category: $Category");
    print("Available Copies: $Available_Copies");
    print("Price: $Price");
  }
}
