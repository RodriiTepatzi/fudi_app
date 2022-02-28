import 'dart:convert';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/static/api_url.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> getProductsFromRestaurantId(String uid) async{
    // We make the call to the API
    final response = await http.get(Uri.parse(apiUrl + '/products/$uid'));

    // If success then.
    if(response.statusCode == 200){
      // Initialize an empty list of Product. Could be or not filled later.
      List<Product> products = [];

      var productsJson = json.decode(response.body)['\$values'] as List;

      List<dynamic> productsFromJson = productsJson.map((modelJson) => Product.fromJson(jsonDecode(modelJson))).toList();

      for(int i = 0; i < productsFromJson.length; i++){
        if (productsFromJson[i] is Product){
          if(productsFromJson[i] != null){
            products.add(productsFromJson[i]);
          }
        }
      }

      return products;
    }
    else{
      throw Exception("Failed on getting the product data from API");
    }
  }
}