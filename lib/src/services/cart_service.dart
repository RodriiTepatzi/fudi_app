import 'package:fudi_app/src/models/cart.dart';
import 'package:fudi_app/src/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:fudi_app/src/static/api_url.dart';
import 'dart:convert';

class CartService{
  
  Future<Cart> getCartAsync(String userId) async{
    final response = await http.get(Uri.parse("$apiUrl/users/$userId/cart"));
    if(response.statusCode == 200){
      List<Cart> carts = [];

      var tagsJson = json.decode(response.body)['\$values'];

      List<dynamic> cartsFromJson = tagsJson.map((modelJson) => Cart.fromJson(jsonDecode(modelJson))).toList();
    
      for(int i = 0; i < cartsFromJson.length; i++){
        // We check if the content at this position is a Cart
        if (cartsFromJson[i] is Cart){
          // We check that the Cart is not null
          if(cartsFromJson[i] != null){
            // At this point everything is validated and can be added to list.
            carts.add(cartsFromJson[i]);
          }
        }
      }
      return carts.isNotEmpty ? carts[0] : throw Exception("Failed on getting the user data from API");
    }
    else{
      throw Exception("Failed on getting the user data from API");
    }
  }

  void addOrderAsync(String userId, Order order) async{
    final jsonData = order.toJson();
    final jsonEncoded = json.encode(jsonData).replaceAll(r"\", "").replaceAll("\"[", "[").replaceAll("]\"", "]");
    //print(jsonEncoded);
    final response = await http.post(Uri.parse("$apiUrl/users/$userId/cart/add"),
    headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncoded,
    );

    if(response.statusCode == 200 || response.statusCode == 201){
      
    }
    else{
      throw Exception("Failed on adding a new order to cart.");
    }

  }
}