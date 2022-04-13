import 'package:flutter/cupertino.dart';
import 'package:fudi_app/src/models/addon.dart';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/views/forms/addons_form.dart';
import 'package:fudi_app/src/views/forms/quantity_form.dart';

class AddonController {

  AddonController._privateConstructor();
  static final AddonController _instance = AddonController._privateConstructor();
  static AddonController get instance => _instance;

  void setAddon(Addon addon){

  }

  static Widget getAddonForm(Product product, RestaurantModel restaurantModel, String userUid){
    if(product.optionalAddons.isNotEmpty && product.requiredAddons.isNotEmpty){
      return AddonsForm(product: product, restaurant: restaurantModel, userId: userUid);
    }
    else if(product.requiredAddons.isNotEmpty){
      return AddonsForm(product: product, restaurant: restaurantModel, userId: userUid);
    }
    else if(product.optionalAddons.isNotEmpty){
      return AddonsForm(product: product, restaurant: restaurantModel, userId: userUid);
    }
    else{
      return QuantityForm(
        product: product, 
        restaurant: restaurantModel, 
        userId: userUid,
      );
    }
  }

}