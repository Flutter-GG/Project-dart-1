import 'dart:io';
import '../ViewModels/BooksViewModel.dart';

class EnchantedBookLibraryViewModel extends BooksViewModel{


EnchantedBookLibraryViewModel(String jsonFilePath) : super(jsonFilePath);


  void displayWelcomeMenu()  {
    print("Welcome to the Enchanted Book Library, where stories come to life!\n");
    stdout.flush();
    sleep(Duration(seconds:1));
    print("Embark on a magical journey by choosing one of the following options:\n\n\n");
    stdout.flush();
    sleep(Duration(seconds:1));

    print("1: Explore Books \n- Uncover the secrets of our vast collection of books.\n");
    print("2: Manage Library \n- Become the master librarian and wield the power to organize and curate the enchanted shelves!\n");
    print("3: Purchase and Reports \n- Witness your collection grow with each acquisition!\n");
    print("4: Quit \n- Return to the mortal realm and exit the enchanted realm of books.\n");

    displayMenuInstructions();

  }

  void displayExplorationMenu()  {
    print("Welcome to the Enchanted Book Library's Exploration Menu!\n");
    stdout.flush();
    sleep(Duration(seconds:1));
    print("Unravel the mysteries of our mystical collection by choosing one of the following paths:\n\n\n");
    stdout.flush();
    sleep(Duration(seconds:1));
    print("1: Search by Title\n");
    print("2: Seek by Author\n");
    print("3: Journey by Category\n");
    print("4: List All\n");
    print("5: Back \n- Return to the main menu.\n");
    stdout.flush();

    displayMenuInstructions();

        var userInput = stdin.readLineSync();
    processExplorationMenuUserInput(userInput);
    
  }

  void displayManagementMenu()  {
    print("Welcome to the Enchanted Book Library's Management Menu!\n");
    stdout.flush();
    sleep(Duration(seconds:1));
    print("You will enter the realm of the master librarian. Here's what happens next:\n");
    stdout.flush();
    sleep(Duration(seconds:1));
    print("As the master librarian, you hold the key to organizing and curating the enchanted shelves.\n");
    stdout.flush();
    sleep(Duration(seconds:1));
    print("Choose one of the following spells to weave the magic of order:\n\n\n");
    stdout.flush();
    sleep(Duration(seconds:1));

    print("1: Add New Book\n");
    print("2: Delete Book\n");
    print("3: Editing Capability\n");
    print("4: Back \n- Return to the main menu.\n");
  
    displayMenuInstructions();

     var userInput = stdin.readLineSync();
     processManagementMenuUserInput(userInput);
  }

  void displayPurchasingMenu()  {
    print("Welcome to the Enchanted Book Library's Purchasing Menu!\n");
    stdout.flush();
    sleep(Duration(seconds:3));
    print("Delight in a mystical buying experience as you add enchanting books to your collection.\n");
    stdout.flush();
    sleep(Duration(seconds:3));
    print("Choose one of the following options to witness the magic unfold:\n\n\n");
    stdout.flush();
    sleep(Duration(seconds:3));

    print("1: Purchase\n");
    print("2: Reporting \n");
    print("3: Back \n- Return to the main menu.\n");

    displayMenuInstructions();

    var userInput = stdin.readLineSync();
    processPurchasingMenuUserInput(userInput);
  }

  void displayMenuInstructions() {
    print("To select an option, simply utter the corresponding number and press Enter.");
    print("Happy reading!\n");
    print("Your choise is:  ");
  }

  void quitProgram() {
    print("Thank you for visiting the Enchanted Book Library! \nWe hope you enjoyed your stay.\n");
    exit(0); 

  }

  void start() async {
    while (true) {
      displayWelcomeMenu();
      var userInput = stdin.readLineSync();

      switch (userInput) {
        case '1':
          displayExplorationMenu();
          break;
        case '2':
          displayManagementMenu();
          break;
        case '3':
          displayPurchasingMenu();
          break;
        case '4':
          quitProgram();
          return;

        default:
          print("Invalid choice. Please choose a valid option.");
           break;
      }
    }
  }


 
void processExplorationMenuUserInput(String? userInput) {
  if (userInput == null) {
    print("Invalid input. Please try again.");
    return;
  }

  switch (userInput) {

    case '1':
    print("Embark on a quest to find books by their captivating titles!");
        searchBooksByTitle();
      break;

    case '2':
    print("Seek out books by their enchanting authors!");
        searchBooksByAuthor();
      break;


    case '3':
    print("Journey through the mystical categories of books!");
        searchBooksByCategory();
      break;

    case '4':
    print("Behold the entire collection of books in the Enchanted Book Library!");
      displayAllBooks();
      break;

    case '5':
      displayWelcomeMenu();
      break;

    default:
      print("Invalid choice. Please choose a valid option.");
      break;
  }
}

void processManagementMenuUserInput(String? userInput) {
  if (userInput == null) {
    print("Invalid input. Please try again.");
    return;
  }


  switch (userInput) {
    case '1':
    print("Conjure a new book into existence and add it to our mystical collection. \nProvide the book's details to give it life!");
      createBook();
      break;

    case '2':
    print("Unravel the pages of a book and remove it from the enchanted shelves. \nDouble-check the title before casting this spell.");
    deleteBook();
      break;

    case '3':
    print("Harness the magic of words to update book information, such as title, author, and price. \nEnsure your enchantments are accurate!");
      updateBookInfo();
      break;

    case '4':
      displayWelcomeMenu();
      break;

    default:
      print("Invalid choice. Please choose a valid option.");
      break;
  }
}


void processPurchasingMenuUserInput(String? userInput) {


  if (userInput == null) {
    print("Invalid input. Please try again.");
    return;
  }

  switch (userInput) {
    case '1':
    print("Embark on a journey of acquiring captivating books from our enchanted shelves. Watch your collection grow with each acquisition!\n");
      purchaseBook();
      break;

    case '2':
    print("Behold the books you have acquired from the Enchanted Book Library!\n");
      displayPurchases();
      break;

    case '3':
      displayWelcomeMenu();
      break;

    default:
      print("Invalid choice. Please choose a valid option.");
      break;
   }
  }
}



