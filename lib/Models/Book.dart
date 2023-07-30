
class Book {
  String title;
  String author;
  String briefDescription;
  int publicationDate;
  String category;
  double price;
  int availableCopies;

  Book({
    required this.title,
    required this.author,
    required this.briefDescription,
    required this.publicationDate,
    required this.category,
    required this.price,
    required this.availableCopies,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      briefDescription: json['briefDescription'],
      publicationDate: json['publicationDate'],
      category: json['category'],
      price: json['price'],
      availableCopies: json['availableCopies'],
    );
  }
}
