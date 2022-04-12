// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/cupertino.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:fudi_app/src/services/user_service.dart';

class SignUpController{

  /// Method to validate the Username Field at SignUpPage.
  /// 
  /// It returns a String? that contains a error message to be displayed.
  String? validateUsername(String username){
    // To validate we check that the string is not empty
    if(username.isNotEmpty){
      // If not, then we check if it contains special characters.
      // If so, then we remove them using a Reg Expression
      if(!RegExp(r'[\/~`@#%\^\*\(\)_=\{\}\[\]\|;\<\>\\]').hasMatch(username)){
        // We check that the username is min 8 length
        if(username.length < 8){
          // If not we return this error message.
          return "Minímo 8 carácteres.";
        }
      }
      else{
        // If the Regex Expression has a match, then
        // that means the username contains a special character.
        // We return this message.
        return "No se permiten carácteres especiales.";
      }
    }
  }


  /// This methods validates that the email is actually an email.
  /// 
  /// It returns an error message in case.
  String? validateEmail(String email){
    // We check that the email is not empty.
    if(email.isNotEmpty){
      // We check that the email has an email format.
      if(!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
        ).hasMatch(email)){
          // We return an error message if not.
          return "Formato no válido.";
      }
    }
  }

  /// This methods validates that the fullname does not contain anything else than letters.
  String? validateFullname(String fullname){
    // We check that the fullname is not empty
    if(fullname.isNotEmpty){
      // We check if it only matchs letters and spaces.
      if(RegExp(r'^[a-zA-Z\s]+$').hasMatch(fullname)){
        // We check that has a length over 12 digits.
        if(fullname.length < 12){
          // If not, we return an error message.
          return "Minímo 12 carácteres.";
        }
      }
      else{
        // If the regex doesn't match we return an error message.
        return "Sólo se permiten letras";
      }
    }
  }

  /// This method should be called when the signUp Form has been submitted. So we check
  /// every field.
  /// 
  /// In this method we also check that the phonenumber, email or username are not repeated.
  Future<String?> validateUserBeforeCreating(BuildContext context, String email, String fullname, String username, String telephone, DateTime birthday, String password, String countryCode) async{
    // In this case we check that username and telephone number are available.
    // So for that we use the UsersService to consume the API.
    String newNumber = countryCode + telephone;

    // The following are to make a number from +52 55-444-3333 to 52554443333.
    // We pass the number like that when calling the API.
    // We delete every - character.
    newNumber = newNumber.replaceAll('-', "");
    // We delete the + character
    newNumber = newNumber.replaceAll('+', "");
    // We delete extra spaces.
    newNumber = newNumber.replaceAll(" ", "");

    // We parse the Date to UTC. So it can be converted in a Timestamp on Firestore.
    birthday = birthday.toUtc();

    // We check if the username is registered.
    if(!await UserService().isUsernameRegistered(username)){
      // If not we check the phonenumber.
      if(!await UserService().isNumberRegistered(newNumber)){
        // If not we proceed to create the new user.
        await AuthService.createNewUser(context, email, fullname, username, countryCode + telephone, birthday, password);
      }
      else{
        // We return a message error
        return "El número ya se encuentra registrado";
      }
    }
    else {
      // We return a message error
      return "El nombre de usuario ya se encuentra registrado";
    }
    
    
  }  
}