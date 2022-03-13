import 'package:fudi_app/src/models/user_app.dart';

class ProfileController{
  final UserApp? _userApp;
  ProfileController(this._userApp);

  String getFullName(){
    if(_userApp?.fullname != null){
      String? fullname = _userApp?.fullname ?? "";
      return fullname.toString();
    }
    return "";
  }

  String getURLProfileImage(){
    if(_userApp?.photoURL != null){
      String? photoURL = _userApp?.photoURL ?? "";
      return photoURL.toString();
    }
    return "";
  }

  String getEmail(){
    if(_userApp?.email != null){
      String? email = _userApp?.email ?? "";
      return email.toString();
    }
    return "";
  }

  String getTelephone(){
    if(_userApp?.telephone != null){
      String? telephone = _userApp?.telephone ?? "";
      return telephone.toString();
    }
    return "";
  }
}