# Project #1 - Abdulelah Aljuraysi 

## How the program works in as admin user 


Please select:

```
(base) ~$ dart run main.dart
------------
Welcome to Abdulelah Library
please select from menu:
1:Admin User
2:End User
Q:Quite
```
If you choose 1 You will be logged in as the Admin user

User information is requested
Example\_\_

Email ```admin@gamil.com```
password ```123```
```
please enter admin Email?
admin@gmail.com
please enter admin Password?
123
Welcome Admin user admin@gmail.com
1:Add new book
2:Delete book
3:Update Book
Q:Quite
```
If option 1 is selected, a new book will be added after adding the book's information
```
Welcome to Abdulelah Library
please select from menu:
1:Admin User
2:End User
Q:Quite
1
please enter admin Email?
admin@gmail.com
please enter admin Password?
123
Welcome Admin user admin@gmail.com
1:Add new book
2:Delete book
3:Update Book
Q:Quite
1
please inter book name?
python
please inter Author Name?
Abdulelah
please inter Brief Description?
python Book
please inter PublicationDate?
2023
please inter Category?
programming books
please enter Available Copies?
5
please enter Price?
100
```
If option 2 is chosen, the book will be deleted after choosing its name
```
Welcome Admin user admin@gmail.com
1:Add new book
2:Delete book
3:Update Book
Q:Quite
2
Please enter the name of the book that you want to delete?
python
Book 'python' has been deleted successfully.
```
If option 3 is selected, the book information will be updated after choosing the name of the book and adding the new information
```
Welcome Admin user admin@gmail.com
1:Add new book
2:Delete book
3:Update Book
Q:Quite
3
Please enter the name of the book that you want to update?
1984
Please enter the updated book name?
python
Please enter the updated author name?
abdulelah
Please enter the updated brief description?
python book
Please enter the updated publication date?
2022
Please enter the updated category?
programming books
Please enter the updated available copies?
50
Please enter the updated price?
100
Book '1984' has been updated successfully.
```

## How the program works in as End user 
We choose option number A to log in as an end user
```
Welcome to Abdulelah Library
please select from menu:
1:Admin User
2:End User
Q:Quite
2
Welcome End User
1:Display Book
2:Search Book
3:Pay Book
4:Show Category
5:show Purchased Books
Q:quite
```
If entry number 1 is selected, all available books will be displayed
```
Welcome End User
1:Display Book
2:Search Book
3:Pay Book
4:Show Category
5:show Purchased Books
Q:quite
1
------------
Book Name: The Blue Elephant
Author Name: Ahmed Mourad
Brief Description: A novel narrating the story of a psychiatrist dealing with a mysterious case at a mental hospital.
Publication Date: 2014
Category: Mystery/Thriller
Available Copies: 5
Price: 10
------------
Book Name: The Handmaid's Tale
Author Name: Margaret Atwood
Brief Description: A dystopian novel depicting a future characterized by oppression and persecution.
Publication Date: 1985
Category: Science Fiction/Dystopian
Available Copies: 3
Price: 8
------------
Book Name: The Invisible Man
Author Name: Mohamed Reda
Brief Description: A collection of short stories addressing identity and existence.
Publication Date: 2021
Category: Short Stories/Fiction
Available Copies: 8
Price: 12
------------
Book Name: Memory of the Body
Author Name: Ahlam Mosteghanemi
Brief Description: A novel revolving around a woman living between the past and the present.
Publication Date: 1993
Category: Fiction/Romance
Available Copies: 2
Price: 7
------------
Book Name: The Alchemist
Author Name: Paulo Coelho
Brief Description: A symbolic novel shedding light on the journey in search of true treasure.
Publication Date: 1988
Category: Fiction/Self-Help
Available Copies: 6
Price: 9
------------
Book Name: A Brief History of Time
Author Name: Stephen Hawking
Brief Description: A scientific book explaining the theory of the Big Bang and the evolution of the universe.
Publication Date: 1998
Category: NonFiction/Science
Available Copies: 4
Price: 15
------------
Book Name: Nineteen Minutes
Author Name: Nineteen Minutes
Brief Description: A novel exploring themes of love, fate, and destiny.
Publication Date: 2004
Category: Fiction/Drama
Available Copies: 7
Price: 14
------------
Book Name: Pride and Prejudice
Author Name: Jane Austen
Brief Description: A classic romance novel depicting societal norms and prejudices.
Publication Date: 1813
Category: Fiction/Romance
Available Copies: 10
Price: 5
------------
Book Name: python
Author Name: abdulelah
Brief Description: python book
Publication Date: 2022
Category: programming books
Available Copies: 50
Price: 100
------------
Book Name: To Kill a Mockingbird
Author Name: Harper Lee
Brief Description: A coming-of-age novel addressing racial injustice in the American South.
Publication Date: 1960
Category: Fiction/Drama
Available Copies: 1
Price: 11
------------
```
If entry 2 is selected, books are searched
```
Welcome End User
1:Display Book
2:Search Book
3:Pay Book
4:Show Category
5:show Purchased Books
Q:quite
2
Please select from the menu:
1: Search Book by name, 2: Search Book by author name, 3: Search Book by category
```
Options such as option 1 to search by name are displayed \_\_ 

Option number 2 searches by the author's name\_\_ 

Option number 2 searches by the category\_\_ 

Let me try option #2, search by author name
```
Please select from the menu:
1: Search Book by name, 2: Search Book by author name, 3: Search Book by category
2
Please enter the author_Name of the book that you want to search?
abdulelah
Book Name: python
Author Name: abdulelah
Brief Description: python book
Publication Date: 2022
Category: programming books
Available Copies: 50
Price: 100
------------
```
If option number 3 is chosen, the user can purchase a book through the name of the book, then a message will appear if he agrees to the purchase, and if the approval is approved, a simplified invoice for the purchases will appear
```
Welcome End User
1:Display Book
2:Search Book
3:Pay Book
4:Show Category
5:show Purchased Books
Q:quite
3
Please enter the name of the book that you want to pay?
python
Are you sure you want to pay for python? The price is $100.00
Choose 'Y' to pay or 'N' to cancel.
y
Successfully paid This is your receipt:
Book: python
Price: 100
------------
```
If option number 4 is chosen, all Category will be displayed, and one of them can be selected to display all books belonging to this Category
```
Welcome End User
1:Display Book
2:Search Book
3:Pay Book
4:Show Category
5:show Purchased Books
Q:quite
4
Available Categories: Mystery/Thriller
 Science Fiction/Dystopian
 Short Stories/Fiction
 Fiction/Romance
 Fiction/Self-Help
 NonFiction/Science
 Fiction/Drama
 programming books
Please enter the Category of the book you want to search?
programming books
Books in Category 'programming books':
------------
Book Name: python
Author Name: abdulelah
Brief Description: python book
Publication Date: 2022
Category: programming books
Available Copies: 49
Price: 100
------------
```
If number 5 is chosen, all books that have been purchased are displayed, and the total amount of sales is displayed
```
Welcome End User
1:Display Book
2:Search Book
3:Pay Book
4:Show Category
5:show Purchased Books
Q:quite
5

-- Purchased Books --
Book: python, Price: 100$
Book: Pride and Prejudice, Price: 5$
Total Sales: 105$
------------
```
In all cases where the Q option appears, the program is closed if Q is selected
```
Welcome to Abdulelah Library
please select from menu:
1:Admin User
2:End User
Q:Quite
q
```
