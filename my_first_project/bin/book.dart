class Book {
  String bookTitle;
  String authorName;
  String briefDescription;
  int publicationDate;
  String category;
  int availableCopies;
  int price;

  Book({
    required this.bookTitle,
    required this.authorName,
    required this.briefDescription,
    required this.publicationDate,
    required this.category,
    required this.availableCopies,
    required this.price,
  });

 displayData() {
    print(
        "Book Title: $bookTitle ,Author Name: $authorName ,Brief Description: $briefDescription ,Publication Date: $publicationDate ,Category: $category ,Available Copies: $availableCopies ,Price: $price");
  }
}
