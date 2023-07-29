import 'dart:io';

class EnchantedBookLibrary {

  void displayWelcomeMenu()  {
    print("Welcome to the Enchanted Book Library, where stories come to life!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("Embark on a magical journey through the written word by choosing one of the following options:\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("1: Explore Books - Uncover the secrets of our vast collection of books, where each tome holds its own adventure and wonder!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("2: Manage Library - Become the master librarian and wield the power to organize and curate the enchanted shelves!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("3: Purchase and Reports - Delight in a mystical buying experience, and witness your collection grow with each acquisition! Also, receive mystical reports on your literary quests!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("4: Quit - Return to the mortal realm and exit the enchanted realm of books.\n");
    stdout.flush();

    displayMenuInstructions();
  }

  void displayExplorationMenu()  {
    print("Welcome to the Enchanted Book Library's Exploration Menu!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("Unravel the mysteries of our mystical collection by choosing one of the following paths:\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("1: Search by Title - Embark on a quest to find books by their captivating titles!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("2: Seek by Author - Uncover the mystical tomes authored by the greatest minds of both past and present!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("3: Journey by Category - Traverse through enchanted realms by exploring books categorized by their magical themes!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("4: Back - Return to the main menu and continue your adventure.\n");
    stdout.flush();

    displayMenuInstructions();
  }

  void displayManagementMenu()  {
    print("Welcome to the Enchanted Book Library's Management Menu!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("You will enter the realm of the master librarian. Here's what happens next:\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("As the master librarian, you hold the key to organizing and curating the enchanted shelves.\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("Choose one of the following spells to weave the magic of order:\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("1: Add New Book - Conjure a new book into existence and add it to our mystical collection. Provide the book's details to give it life!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("2: Delete Book - Unravel the pages of a book and remove it from the enchanted shelves. Double-check the title before casting this spell.\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("3: Editing Capability - Harness the magic of words to update book information, such as title, author, and price. Ensure your enchantments are accurate!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("4: Back - Return to the main menu and continue your magical adventure.\n");
    stdout.flush();

    displayMenuInstructions();
  }

  void displayPurchasingMenu()  {
    print("Welcome to the Enchanted Book Library's Purchasing Menu!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("Delight in a mystical buying experience as you add enchanting books to your collection.\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("Choose one of the following options to witness the magic unfold:\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("1: Purchase - Embark on a journey of acquiring captivating books from our enchanted shelves. Watch your collection grow with each acquisition!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("2: Invoice - After making a purchase, receive a mystical invoice that reveals the books you've acquired, their prices, and the total cost of your literary treasures.\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("3: Reporting - Unveil magical reports on your literary quests, showing the number of books purchased and the total amount spent.\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("4: Back - Return to the main menu and continue your magical adventure.\n");
    stdout.flush();
    displayMenuInstructions();
  }

  void displayMenuInstructions() {
    print("To select an option, simply utter the corresponding number and press Enter.\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("If you ever desire to journey back to the previous menu, invoke the sacred word \"back\" and press Enter.\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("May the magic of words guide you on this enchanting quest! Happy reading!\n");
    stdout.flush();
    sleep(Duration(seconds:5));
    print("Your choise is:  ");
  }

  void quitProgram() {

    print("Thank you for visiting the Enchanted Book Library! \nMay the magic of words continue to guide you on your adventures. \nHappy reading! ✨📚\n");
  
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
}
