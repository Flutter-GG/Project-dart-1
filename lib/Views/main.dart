
import '../ViewModels/EnchantedBookLibraryViewModel.dart';

void main()  {
  EnchantedBookLibraryViewModel library = EnchantedBookLibraryViewModel( '/Users/lemon.labours/Desktop/FlutterBootcamp/Projects/Project-dart-1/Assets/Data/books.json');
  library.displayWelcomStatement();
  library.start();

}
