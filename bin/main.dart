import 'admin_func.dart';
import 'user_func.dart';
import 'dart:io';


void main(List<String> args) {
  try{
    //Check who want to do a process, Library admin or Customer?
    print("\nFor Admin enter 'A or a', for Customr enter 'C or c', and 'E or e' to exit");
    String choice = stdin.readLineSync()!.toLowerCase();
    //when Admine want to make an action
    if(choice == 'a'){
      admin();
    }
    else if(choice == 'c'){
      user();
    }
    else{
      exit(0);
    }

  }catch(error){
    print("ERROR, somthing went wrong!");
  }
  

}