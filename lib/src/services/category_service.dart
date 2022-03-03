import 'dart:convert';

import 'package:fudi_app/src/models/category.dart';
import 'package:fudi_app/src/static/api_url.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<CategoryModel>> _getCategories() async{
    // We make the call to the API
    final response = await http.get(Uri.parse(apiUrl + '/category/'));

    // If the response has statusCode of 200
    if(response.statusCode == 200){
      // Initialize an empty category list. This could or not be filled later.
      List<CategoryModel> categories = [];

      // We get the data from json. List<String>
      var tagsJson = json.decode(response.body)['\$values'];

      // We map the data to get a dynamic List from the map.
      List<dynamic> restaurantsFromJson = tagsJson.map((modelJson) => CategoryModel.fromJson(jsonDecode(modelJson))).toList();

      // We iterate to set the models to our List of CategoryModel
      for(int i = 0; i < restaurantsFromJson.length; i++){
        // We check if the content at this position is a CategoryModel
        if (restaurantsFromJson[i] is CategoryModel){
          // We check that the CategoryModel is not null
          if(restaurantsFromJson[i] != null){
            // At this point everything is validated and can be added to list.
            categories.add(restaurantsFromJson[i]);
          }
        }
      }

      return categories;
    }
    else{
      // If not then we throw and exception.
      throw Exception("Failed on getting the categories data from API");
    }
  }

  Future<List<CategoryModel>> getCategories() async{
    List<CategoryModel> categories = await _getCategories();
    return categories;
  }
}