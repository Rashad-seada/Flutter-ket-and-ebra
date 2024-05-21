import 'package:regexpattern/regexpattern.dart';

class ValidatePasswordUseCase {

  RegExp specialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>\$]');

  String? call(String text){
    if(text.trim().isEmpty){
      return "Please enter your password";
    } else if(!text.isPasswordEasy()) {
      return "Please enter a correct password form";
    } else if(!specialChars.hasMatch(text)){
      return "must contain a special character (ex : @, #, %, ^, &, * )";
    } else {
      return null;
    }
  }

}