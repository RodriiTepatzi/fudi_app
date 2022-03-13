import 'package:cloud_firestore/cloud_firestore.dart';

/// This user class contains all the fields that are stored in the FireStore Database.
/// 
/// This should be exactly the same as the API model.

class UserApp{
  String uid;
  String username;
  String telephone;
  String photoURL;
  String fullname; 
  String email;
  DateTime birthday;

  UserApp({
    required this.uid,
    required this.username,
    required this.fullname,
    required this.birthday,
    required this.email,
    required this.photoURL,
    required this.telephone,
    }
  );

  UserApp.fromJson(Map<String, dynamic> json)
    : this(
      uid: json['uid'],
      username: json['username'],
      fullname: json['fullname'],
      birthday: DateTime.parse(json['birthday']),
      email: json['email'],
      photoURL: json['photoURL'],
      telephone: json['telephone'],
    );

  Map<String, dynamic> toJson(){
    return{
      'uid' : uid,
      'username' : username,
      'fullname' : fullname,
      'birthday' : birthday.toIso8601String(),
      'email' : email,
      'photoURL' : photoURL,
      'telephone' : telephone,
    };
  }
}
