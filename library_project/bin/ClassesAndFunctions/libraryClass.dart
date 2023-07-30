import '../Data/libraryData.dart';

// TODO: database
class Library {
  String? title;
  String? author;
  List? categories;
  double? price;
  int? availableCopies;
  List? myLibrary;

  Library(
      {this.title,
      this.author,
      this.categories,
      this.price,
      this.availableCopies,
      this.myLibrary});
  static searchingByFunc({required String userInput, required String index}) {
    String book = "";
    if (userInput.toLowerCase() != 'q') {
      for (var item in theLibrary) {
        String theKey = item[index].toString().toLowerCase();
        if (theKey.contains(userInput.toLowerCase())) {
          book +=
              "\n Book name: ${item['title']}\n For author: ${item['author']}\n First published: ${item['First published']}\n Categories: ${item['categories']}\n Price: ${item['price'].toStringAsFixed(2)}\$\n Avalibale copies: ${item['avalibale copies']}\n___________________\n";
        }
      }
      print(book);
    } else if (userInput.toLowerCase() == 'q') {
      print('quit!');
      return;
    } else {
      print('not valid category');
    }
  }
}
