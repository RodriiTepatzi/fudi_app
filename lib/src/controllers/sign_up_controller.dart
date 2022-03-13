import 'package:flutter/cupertino.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:fudi_app/src/services/user_service.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpController{
  registerNewUser(){

  }

  String? validateUsername(String username){
    if(username.isNotEmpty){
      if(!RegExp(r'[\/~`@#%\^\*\(\)_=\{\}\[\]\|;\<\>\\]').hasMatch(username)){
        if(username.length < 8){
          return "Minímo 8 carácteres.";
        }
      }
      else{
        return "No se permiten carácteres especiales.";
      }
    }
  }

  String? validateEmail(String email){
    if(email.isNotEmpty){
      if(!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
        ).hasMatch(email)){
          return "Formato no válido.";
      }
    }
  }

  String? validateFullname(String fullname){
    if(fullname.isNotEmpty){
      if(RegExp(r'^[a-zA-Z]+$').hasMatch(fullname)){
        if(fullname.length < 12){
          return "Minímo 12 carácteres.";
        }
      }
      else{
        return "Sólo se permiten letras";
      }
    }
  }

  MaskTextInputFormatter phoneFormatter(){
    return MaskTextInputFormatter(mask: ' ###-###-####', filter: { "#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);
  }

  Future<String?> validateUserBeforeCreating(BuildContext context, String email, String fullname, String username, String telephone, DateTime birthday, String password, String countryCode) async{
    // In this case we check that username and telephone number are available.
    // So for that we use the UsersService to consume the API.
    String newNumber = countryCode + telephone;
    newNumber = newNumber.replaceAll('-', "");
    newNumber = newNumber.replaceAll('+', "");
    newNumber = newNumber.replaceAll(" ", "");
    birthday = birthday.toUtc();
    if(!await UserService().isUsernameRegistered(username)){
      if(!await UserService().isNumberRegistered(newNumber)){
        await AuthService.createNewUser(context, email, fullname, username, countryCode + telephone, birthday, password);
      }
      else{
        return "El número ya se encuentra registrado";
      }
    }
    else {
      return "El nombre de usuario ya se encuentra registrado";
    }
    
    
  }

  String? validatePhone(String phone){

  }

  

}