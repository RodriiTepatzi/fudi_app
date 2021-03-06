import 'dart:convert';

import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/static/api_url.dart';
import 'package:http/http.dart' as http;

/// This class provides the connection to API.
/// 
/// Supported methods are:
/// 
/// - To get an user: 
/// ```dart
/// Future<UserApp> fetchUser(String uid)
/// ```
/// - To create an user: 
/// ```dart
/// Future<UserApp> createUser(UserApp data)
/// ```
/// - To update an user: 
/// ```dart
/// Future<UserApp> updateUser(UserApp user)
/// ```
class UserService{
  /// This method gets the data as json and return a Future<UserApp>
  Future<UserApp> _fetchUser(String uid) async{
    final response = await http.get(Uri.parse(apiUrl + '/users/$uid'));
    if(response.statusCode == 200){
      return UserApp.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Failed on getting the user data from API");
    }
  }

  /// This method gets the UserApp from so this method should be called 
  /// to get the user as UserApp properly since using the other method can cause errors.
  /// ```
  /// Future<UserApp> fetchUser(String uid)
  /// ```
  Future<UserApp> getUser(String uid) async {
    UserApp userApp = await _fetchUser(uid);
    return userApp;
  }

  /// This method creates a new user in the database.
  /// 
  /// `UserApp data` is required to convert it into json inside this method to send the POST call to API
  static Future<UserApp> createUser(UserApp data) async{
    final jsonData = data.toJson();
    final response = await http.post(Uri.parse(apiUrl + '/users'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(jsonData),
    );

    if(response.statusCode == 200 || response.statusCode == 201){
      return UserApp.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Failed to create user");
    }
  }

  /// This method updates the current user in the database.
  /// 
  /// `UserApp user` is required to convert it into json inside this method to send the PUT call to API
  static Future<UserApp> updateUser(UserApp user) async{
    final response = await http.put(Uri.parse(apiUrl + '/users/${user.uid}/'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: user.toJson(),
    );

    if(response.statusCode == 200){
      return UserApp.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Failed to update user");
    }
  }

  Future<bool> isNumberRegistered(String number) async {
    final response = await http.get(Uri.parse(apiUrl + '/users/telephone/$number'));
    if(response.statusCode == 200){
      UserApp user = UserApp.fromJson(jsonDecode(response.body));
      if(user.telephone.isNotEmpty){
        return true;
      }
      return false;
    }
    else{
      return false;
    }
  }
  Future<bool> isUsernameRegistered(String username) async {
    final response = await http.get(Uri.parse(apiUrl + '/users/username/$username'));
    if(response.statusCode == 200){
      UserApp user = UserApp.fromJson(jsonDecode(response.body));
      if(user.username.isNotEmpty){
        return true;
      }
      return false;
    }
    else{
      return false;
    }
  }
}