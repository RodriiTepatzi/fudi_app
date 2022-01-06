class Validations {

  String? validateUsername(String input){
    if(!Validations().validateMinLength(input)){
      return "Minímo 8 caracteres";
    }

    if(Validations().validateSpecialChars(input)){
      return "Sólo se permiten los caracteres !, @, #, \\, \$, &, *, ~";
    }

    return null;
  }

  bool validateMinLength(String input){
    return RegExp(
            r'/^.{8,}$/')
        .hasMatch(input);
  }

  bool validateSpecialChars(String input){
    return RegExp(r'^(?=.*?[!@#\$&*~])$').hasMatch(input);
  }
}