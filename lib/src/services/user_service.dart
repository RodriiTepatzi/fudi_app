import 'dart:convert';

import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/static/api_url.dart';
import 'package:http/http.dart' as http;

class UserService{
  
  static Future<UserApp> fetchUser(String uid) async{
    final response = await http.get(Uri.parse(apiUrl + '/users/$uid'));
    if(response.statusCode == 200){
      return UserApp.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Failed on getting the user data from API");
    }
  }

  static Future<UserApp> createUser(UserApp data) async{
    final response = await http.post(Uri.parse(apiUrl + 'users/'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data.toJson(),
    );

    if(response.statusCode == 201){
      return UserApp.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Failed to create user");
    }
  }

  static Future<UserApp> updateUser(UserApp user) async{
    final response = await http.put(Uri.parse(apiUrl + 'users/${user.uid}'),
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
}