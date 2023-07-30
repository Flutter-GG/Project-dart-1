import 'Books.dart';
  List<Books> books = [
    Books(title: 'The sky', author: 'Fahad', copies: 5),
    Books(title: 'nice map', author: 'Ahmed', copies: 3),
    Books(title: '1984', author: 'Salman', copies: 10),
    Books(title: 'Good point', author: 'Sara', copies: 2),
    Books(title: 'The Great Gatsby', author: 'Naser', copies: 4),
    Books(title: 'bath', author: 'Samar', copies: 2),

  ];

class Data1 {
  static bool containsTitle(String title) {
    return books.any((book) => book.title == title);
  }

  static Books search(String title) {
    return books.firstWhere(
      (book) => book.title == title,
      orElse: () => Books(title: '', author: '', copies: 0),
    );
  }
}
