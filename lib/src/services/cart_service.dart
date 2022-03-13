import 'package:http/http.dart' as http;
import 'package:fudi_app/src/static/api_url.dart';
import 'dart:convert';

class CartService{
  Future<String> GetCart(String userId) async{
    final response = http.get(Uri.parse("$apiUrl/users/$userId/cart"));
    return "";
  }
}