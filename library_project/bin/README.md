## In this readme file I will talked about what di you expected to see from this app

## The 'main' section:

#### you will see something like this, this is the main section:

Please select:

```
(base) ~$ dart run main.dart

1- To 'view the library'
2- To 'search in the library'
3- To 'edit the library'
4- To 'buy a book'
5- To 'show what you bought'

(or press 'q' to exit)
```

#### if you type 'q' in the keyboard you will quit from the app.

\_\_

## The 'view the library' section:

#### if you type '1' in the keyboard you will go to viewing the library section:

```
1- To view 'available copies'
2- To view 'categories'
3- To view all 'books'

(or press 'q' to exit):
```

#### if you type '1' in the keyboard the program will show the name of the book and the available copies and go to the main section:

```
The book: Clean Code: A Handbook of Agile Software Craftsmanship,
has '5' Avalibale copies.

The book: Agile Principles, Patterns, and Practices in C#,
is only has '1' Avalibale copies!!!.

The book: Automate the Boring Stuff with Python: Practical Programming for Total Beginners,
is only has '2' Avalibale copies!!!.

The book: اقتصاديات القرض والبيع,
is sold out.
```

#### if you type '2' in the keyboard the program will show all the categories of the books and go to the main section:

```
We have categories: [Programming, Clean Code, C#, Python, Automation, Problem Solving, Finance]
```

#### if you typed '3' in the keyboard the program will show all the books with details and go to the main section:

```
The book name: Clean Code: A Handbook of Agile Software Craftsmanship
For author: Robert C. Martin
First published: January 1, 2007
Categories: [Programming, Clean Code]
Price: 99.99$
avalibale copies: 5
```

\_\_

## The 'search in the library' section:

#### if you typed '2' in the main section you will go to the 'search in the library' section and you will see

```
Please select what you want to search by:

1: by title name
2: by author name
3: by category
```

#### if you select 'by the title name' you can write the full name or any thing that you remmber in the name, for this example I write 'clean code' and get the books contain clean code in their title:

```
Write the 'title' of the book:
clean code

Book name: Clean Code: A Handbook of Agile Software Craftsmanship
For author: Robert C. Martin
First published: January 1, 2007
Categories: [Programming, Clean Code]
Price: 99.99$
Avalibale copies: 5


Book name: Beyond the Basic Stuff with Python: Best Practices for Writing Clean Code
For author: Al Sweigart
First published: December 16, 2020
Categories: [Python, Clean Code]
Price: 74.99$
Avalibale copies: 1
```

#### if the book or author does not exist it wont crash but it will return to the main section without printing anythin,

\_\_

## The 'edit the library' section:

#### if you select 'edit the library' the program will ask you if you are from the staff of the library or not, if it is, you can enter to add, delete or eedit book details, for delete and edit detail you need to select the book with the correct name and spiling.

```
Are you from the staff? Y/N

y

1- To 'add new book'
2- To 'delete a book'
3- To 'edit a book'

(or press 'q' to exit):
2
Write the 'title' of the book that you want to 'delete'
(or press 'q' to exit):

1: Clean Code: A Handbook of Agile Software Craftsmanship
2: Agile Principles, Patterns, and Practices in C#
3: Automate the Boring Stuff with Python: Practical Programming for Total Beginners
4: Beyond the Basic Stuff with Python: Best Practices for Writing Clean Code
5: Think Like a Programmer: An Introduction to Creative Problem Solving
6: اقتصاديات القرض والبيع
e
Book with title 'e' does not exist.
Is there any other book?
(type 'q' to exit):
q
```

#### after quiting it will print the new book list without the books that you deleted.

\_\_

## The 'buy a book' section:

#### here you will buy a book, if the avaliable copies is 0 the book will be sold out and you cant but it, if you buy more than availbale copies the app wont let you buy the book.

```
What book do you want to buy (or press 'q' to exit):
1: Agile Principles, Patterns, and Practices in C#

2: Automate the Boring Stuff with Python: Practical Programming for Total Beginners

3: Beyond the Basic Stuff with Python: Best Practices for Writing Clean Code

4: Think Like a Programmer: An Introduction to Creative Problem Solving

5: اقتصاديات القرض والبيع, is sold out

Enter the number of the book you want to buy
(or press 'q' to exit):
1
Selected Book: Agile Principles, Patterns, and Practices in C#
Enter the number of copies you want to purchase:
1
You purchased '1' copy/copies of 'Agile Principles, Patterns, and Practices in C#'.
Total Price: 94.99 $

The remaining copies '0'
```

#### if you tried to but it again:

```
Enter the number of the book you want to buy
(or press 'q' to exit):
1
Selected Book: Agile Principles, Patterns, and Practices in C#
Enter the number of copies you want to purchase:
1
The book 'Agile Principles, Patterns, and Practices in C#' is sold out.
```

\_\_

## The 'show what you bought' section:

#### after make a purchase and then select 'show what you bought' you will see something like this:

```
(or press 'q' to exit)
5

Your Purchases:

Title: Agile Principles, Patterns, and Practices in C#
Author: Robert C. Martin
Number of Copies: 1
Total Price: $94.99


Title: Automate the Boring Stuff with Python: Practical Programming for Total Beginners
Author: Al Sweigart
Number of Copies: 2
Total Price: $299.98


Total Amount Spent: $394.97

```

\_\_

# Image shows how to use this script

![alt text](Data/Assets/projectDart.png)
