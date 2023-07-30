import 'dart:io';
import '../ViewModels/BooksViewModel.dart';

class EnchantedBookLibraryViewModel extends BooksViewModel{


EnchantedBookLibraryViewModel(String jsonFilePath) : super(jsonFilePath);


  void displayWelcomeMenu()  {
    print("Welcome to the Enchanted Book Library, where stories come to life!\n");
    stdout.flush();
    sleep(Duration(seconds:1));
    print("Embark on a magical journey by choosing one of the following options:\n");
    stdout.flush();
    sleep(Duration(seconds:1));
    print("1: Explore Books \n- Uncover the secrets of our vast collection of books, where each tome holds its own adventure and wonder!\n");

    print("2: Manage Library \n- Become the master librarian and wield the power to organize and curate the enchanted shelves!\n");

    print("3: Purchase and Reports \n- Delight in a mystical buying experience, and witness your collection grow with each acquisition! \nAlso, receive mystical reports on your literary quests!\n");

    print("4: Quit \n- Return to the mortal realm and exit the enchanted realm of books.\n");


    displayMenuInstructions();

  }

  void displayExplorationMenu()  {
    print("Welcome to the Enchanted Book Library's Exploration Menu!\n");
    stdout.flush();
    sleep(Duration(seconds:1));
    print("Unravel the mysteries of our mystical collection by choosing one of the following paths:\n");
    stdout.flush();
    sleep(Duration(seconds:1));
    print("1: Search by Title \n- Embark on a quest to find books by their captivating titles!\n");

    print("2: Seek by Author \n- Uncover the mystical tomes authored by the greatest minds of \nboth past and present!\n");

    print("3: Journey by Category \n- Traverse through enchanted realms by exploring books categorized \nby their magical themes!\n");

    print("4: List All \n- Discover the entire collection of books in our mystical library!\n");

    print("5: Back \n- Return to the main menu and continue your adventure.\n");
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
    print("Choose one of the following spells to weave the magic of order:\n");
    stdout.flush();
    sleep(Duration(seconds:1));
    print("1: Add New Book \n- Conjure a new book into existence and add it to our mystical collection. \nProvide the book's details to give it life!\n");

    print("2: Delete Book \n- Unravel the pages of a book and remove it from the enchanted shelves. \nDouble-check the title before casting this spell.\n");

    print("3: Editing Capability \n- Harness the magic of words to update book information, such as title, author, and price. \nEnsure your enchantments are accurate!\n");

    print("4: Back \n- Return to the main menu and continue your magical adventure.\n");
    stdout.flush();

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
    print("Choose one of the following options to witness the magic unfold:\n");
    stdout.flush();
    sleep(Duration(seconds:3));
    print("1: Purchase \n- Embark on a journey of acquiring captivating books from our enchanted shelves. Watch your collection grow with each acquisition!\n");

    print("2: Reporting \n- Unveil magical reports on your literary quests, showing the number of books purchased and the total amount spent.\n");

    print("3: Back \n- Return to the main menu and continue your magical adventure.\n");

    stdout.flush();
    sleep(Duration(seconds:1));
    displayMenuInstructions();
  }

  void displayMenuInstructions() {
    print("To select an option, simply utter the corresponding number and press Enter.");
  

    print("May the magic of words guide you on this enchanting quest! Happy reading!\n");
    stdout.flush();
    sleep(Duration(seconds:1));

    print("Your choise is:  ");
    
  }

  void quitProgram() {

    print("Thank you for visiting the Enchanted Book Library! \nMay the magic of words continue to guide you on your adventures. \nHappy reading! ✨📚");
  
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
          stdout.flush();
          
          sleep(Duration(seconds:1));
          
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
        searchBooksByTitle();
      break;

    case '2':
        searchBooksByAuthor();
      break;


    case '3':
        searchBooksByCategory();
      break;

    case '4':
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
      createBook();
      break;

    case '2':
      updateBookInfo();
      break;

    case '3':
      deleteBook();
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
      purchaseBook();
      break;

    case '2':
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



