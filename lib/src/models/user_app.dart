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
  String birthday;

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

  UserApp.fromJson(Map<String, Object?> json)
    : this(
      uid: json['uid'] as String,
      username: json['username'] as String,
      fullname: json['fullname'] as String,
      birthday: json['birthday'] as String,
      email: json['email'] as String,
      photoURL: json['photoURL'] as String,
      telephone: json['telephone'] as String,
    );

  Map<String, dynamic> toJson(){
    return{
      'uid' : uid,
      'username' : username,
      'fullname' : fullname,
      'birthday' : birthday,
      'email' : email,
      'photoURL' : photoURL,
      'telephone' : telephone,
    };
  }
}
