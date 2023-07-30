import 'dart:io';

class Books {
  String title;
  String author;
  int copies;

  Books({required this.title, required this.author, required this.copies});

  static Books display() {
    print('Enter the title of the book:');
    final title = stdin.readLineSync()!;
    print('Enter book author:');
    final author = stdin.readLineSync()!;
    print('Enter number of copies:');
    final copies = int.parse(stdin.readLineSync()!);
    return Books(title: title, author: author, copies: copies);
  }

  static void delete(List<Books> books) {
    print('Enter the title of the book to delete:');
    final titleToDelete = stdin.readLineSync()!;
    final bookToDelete = books.firstWhere(
      (book) => book.title == titleToDelete,
      orElse: () => Books(title: '', author: '', copies: 0),
    );
    if (bookToDelete.title.isNotEmpty) {
      books.remove(bookToDelete);
      print('Book deleted successfully.');
    } else {
      print('Book not found.');
    }
   
  }
    static void edit(List<Books> books) {
    print('Enter the title of the book to edit:');
    final titleToEdit = stdin.readLineSync()!;
    final bookToEdit = books.firstWhere(
      (book) => book.title == titleToEdit,
      orElse: () => Books(title: '', author: '', copies: 0),
    );
    if (bookToEdit.title.isNotEmpty) {
      print('Enter the new title:');
      final newTitle = stdin.readLineSync()!;
      print('Enter the new author:');
      final newAuthor = stdin.readLineSync()!;
      print('Enter the new number of copies:');
      final newCopies = int.parse(stdin.readLineSync()!);
      bookToEdit.title = newTitle;
      bookToEdit.author = newAuthor;
      bookToEdit.copies = newCopies;
      print('Book updated successfully.');
    } else {
      print('Book not found.');
    }
  }
}
