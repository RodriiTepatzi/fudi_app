import 'package:firebase_auth/firebase_auth.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/services/auth_service.dart';
import 'package:fudi_app/src/services/user_service.dart';

class OTPController{
  User? user;
  
  OTPController(this.user);

  Future<String> getUserPhonenumber() async {
    if(user != null){
      if(user?.phoneNumber != null && user?.uid != null){
        String? uid = user?.uid;
        UserApp userApp= await UserService().getUser(uid.toString());
        if(userApp.telephone.isNotEmpty){
          return userApp.telephone;
        }
      }
    }
    else{
      return "Usuario no encontrado.";
    }
    return "Error-117.";
  }
}