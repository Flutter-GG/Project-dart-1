import 'dart:io';
import 'AdminFunction.dart';
import 'EndUserFunction.dart';

switchcase() {
  /**
   * his function is used in the main function
   * The choice of the user if he Admin User or End User
   */
  var count = 0;
  while (count < 10) {
    print("------------");
    print("Welcome to Abdulelah Library");
    print("please select from menu:");
    print("1:Admin User\n2:End User\nQ:Quite");
    String selected = stdin.readLineSync()!;
    switch (selected) {
      case "1":
        adminUser();
        break;

      case "2":
        endUser();
        break;

      case "Q" || "q":
        exit(0);

      default:
        print("wrong entry");
    }
  }
}
