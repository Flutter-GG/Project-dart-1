import 'dart:io';
import '../ViewModels/BooksViewModel.dart';

class EnchantedBookLibraryViewModel extends BooksViewModel{


EnchantedBookLibraryViewModel(String jsonFilePath) : super(jsonFilePath);


  void displayWelcomeMenu()  {

    sleep(Duration(seconds:2));
    print("\n\n1: Explore Books \n- Uncover the secrets.\n");
    print("2: Manage Library \n- wield the power of the master librarian.\n");
    print("3: Purchase and Reports \n- Witness your collection grow with each acquisition!'\n");
    print("4: Quit \n- Return to the mortal realm.\n");

    displayMenuInstructions();

  }

  void displayWelcomStatement(){
        print("Welcome to the Enchanted Book Library!\n");
    stdout.flush();
    sleep(Duration(seconds:3));
    print("choosing one of the following options:\n");

  }

  void displayExplorationMenu()  {
    print("\n\nWelcome to the Enchanted Book Library's Exploration Menu!\n");
    print("Unravel the mysteries of our mystical collection by choosing one of the following paths:\n");
    stdout.flush();
    sleep(Duration(seconds:2));

    print("1: Search by Title");
    print("2: Seek by Author");
    print("3: Journey by Category");
    print("4: List All");
    print("5: Back - Return to the main menu.");

    displayMenuInstructions();

        var userInput = stdin.readLineSync();
    processExplorationMenuUserInput(userInput);
    
  }

  void displayManagementMenu()  {
    print("\n\nWelcome to the Enchanted Book Library's Management Menu!\n");
    print("As the master librarian, you hold the key to organizing and curating the enchanted shelves.\n");
    stdout.flush();
    sleep(Duration(seconds:3));
    print("Choose one of the following spells to weave the magic of order:\n\n");

    print("1: Add New Book");
    print("2: Delete Book");
    print("3: Editing Capability");
    print("4: Back - Return to the main menu.");
  
    displayMenuInstructions();

     var userInput = stdin.readLineSync();
     processManagementMenuUserInput(userInput);
  }

  void displayPurchasingMenu()  {
    print("\n\nWelcome to the Enchanted Book Library's Purchasing Menu!\n");
    print("Delight in a mystical buying experience as you add enchanting books to your collection.\n");
    stdout.flush();
    sleep(Duration(seconds:3));
    print("Choose one of the following options to witness the magic unfold:\n\n");

    print("1: Purchase");
    print("2: Reporting ");
    print("3: Back - Return to the main menu.");

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
        displayExplorationMenu();
      break;

    case '2':
    print("Seek out books by their enchanting authors!");
        searchBooksByAuthor();
        displayExplorationMenu();
      break;


    case '3':
    print("Journey through the mystical categories of books!");
        searchBooksByCategory();
        displayExplorationMenu();
      break;

    case '4':
    print("Behold the entire collection of books in the Enchanted Book Library!");
      displayAllBooks();
      displayExplorationMenu();
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
      displayManagementMenu();
      break;

    case '2':
    print("Unravel the pages of a book and remove it from the enchanted shelves. \nDouble-check the title before casting this spell.");
    deleteBook();
    displayManagementMenu();
      break;

    case '3':
    print("Harness the magic of words to update book information, such as title, author, and price. \nEnsure your enchantments are accurate!");
      updateBookInfo();
      displayManagementMenu();
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
      displayPurchasingMenu();
      break;

    case '2':
    print("Behold the books you have acquired from the Enchanted Book Library!\n");
      displayPurchases();
      displayPurchasingMenu();
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



