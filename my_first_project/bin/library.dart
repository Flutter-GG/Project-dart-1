import 'book.dart';

class Library {
  List<Book> books = [
    Book(
      bookTitle: "The Blue Elephant",
      authorName: "Ahmed Mourad",
      briefDescription:
          "A novel narrating the story of a psychiatrist dealing with a mysterious case at a mental hospital.",
      publicationDate: 2014,
      category: "Mystery/Thriller",
      availableCopies: 5,
      price: 10,
    ),
    Book(
      bookTitle: "The Handmaid's Tale",
      authorName: "Margaret Atwood",
      briefDescription:
          "A dystopian novel depicting a future characterized by oppression and persecution",
      publicationDate: 1985,
      category: "Science Fiction/Dystopian",
      availableCopies: 3,
      price: 8,
    ),
    Book(
      bookTitle: "The Invisible Man",
      authorName: "Mohamed Reda",
      briefDescription:
          "A collection of short stories addressing identity and existence.",
      publicationDate: 2021,
      category: "Short Stories/Fiction",
      availableCopies: 8,
      price: 12,
    ),
    Book(
      bookTitle: "Memory of the Body",
      authorName: "Ahlam Mosteghanemi",
      briefDescription:
          "A novel revolving around a woman living between the past and the present",
      publicationDate: 1993,
      category: "Fiction/Romance",
      availableCopies: 2,
      price: 7,
    ),
    Book(
      bookTitle: "The Alchemist",
      authorName: "Paulo Coelho",
      briefDescription:
          "A symbolic novel shedding light on the journey in search of true treasure.",
      publicationDate: 1988,
      category: "Fiction/Self-Help",
      availableCopies: 6,
      price: 9,
    ),
  ];

  addBook(Book book) {
    books.add(book);
  }

  List<Book> searchBooks(String keyword) {
    return books.where((book) => 
    book.bookTitle.contains(keyword) || 
    book.authorName.contains(keyword)||
    book.category.contains(keyword)).toList();
  }

  deleteBook(String title) {
    for (int i = 0; i < books.length; i++) {
      if (books[i].bookTitle == title) {
        books.removeAt(i);
        return true;
      }
    }
    return false;
  }
  purchaseBook(String title) {
    for (int i = 0; i < books.length; i++) {
      if (books[i].bookTitle == title) {
        if (books[i].availableCopies > 0) {
          books[i].availableCopies--;
          return true;
        }
        return false;
      }
    }
    return false;
  }

  Book? getBookByTitle(String title) {
    for (int i = 0; i < books.length; i++) {
      if (books[i].bookTitle == title) {
        return books[i];
      }
    }
    return null;
  }

  displayAllBooks() {
    if (books.isNotEmpty) {
      print("All Books:");
      for (var book in books) {
        print("----------------");
        book.displayData();
      }
    } else {
      print("No books in the library.");
    }
  }
}
