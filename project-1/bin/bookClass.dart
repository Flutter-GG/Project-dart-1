class Book {
  late String title;
  late String author;
  late String category;
  late int price;
  late int numberOfCopies;
  String? description;
  String? publicationYear;

  /// counter for all purchase in the library
  static int counterForAllPurchase = 0;

  Book(
      {required this.title,
      required this.author,
      required this.category,
      required this.numberOfCopies,
      required this.price,
      this.description,
      this.publicationYear});

  getNumberOfCopies() {
    if (numberOfCopies <= 0) {
      numberOfCopies--;
      return "sold out";
    } else if (numberOfCopies <= 3) {
      return "Only left $numberOfCopies";
    } else {
      return "There is $numberOfCopies books";
    }
  }

  /// edit book attribute
  editBook({
    String? newTitle,
    String? newAuthor,
    String? newCategory,
    String? newDescription,
    String? newPublicationYear,
    int? newNumberOfCopies,
    int? newPrice,
  }) {
    if (newTitle != null) {
      title = newTitle;
    }
    if (newAuthor != null) {
      author = newAuthor;
    }
    if (newCategory != null) {
      category = newCategory;
    }
    if (newNumberOfCopies != null) {
      numberOfCopies = newNumberOfCopies;
    }
    if (newPrice != null) {
      price = newPrice;
    }
    if (newPrice != null) {
      price = newPrice;
    }
    if (newDescription != null) {
      description = newDescription;
    }
    if (newPublicationYear != null) {
      publicationYear = newPublicationYear;
    }
  }

  /// Decrease number of copies and then return message
  purchaseBook(int quantity) {
    if (numberOfCopies > 0) {
      numberOfCopies = numberOfCopies - quantity;
      return "The purchase was completed successfully";
    } else {
      return "Sorry, the book is sold out";
    }
  }

  /// print invoice details
  invoice(int quantity) {
    var totalPrice = price * quantity;
    print("Item    \t\t| Uint Price \t| quantity  \t| Total Price");
    print("$title  \t\t| $price     \t| $quantity \t| $totalPrice");
  }

  /// print all book attribute
  display() {
    print(
        " Book title: $title \n The author: $author \n Category: $category \n Description: $description \n Publication Year: $publicationYear \n Price: $price \n ${getNumberOfCopies()}");
  }
}
