import 'package:fudi_app/src/models/addon.dart';

class Product{
  String productId;
  String productName;
  String productDescription;
  double productPrice;
  String productUrl;
  int productLikes;
  String productUnit;
  List<Addon> requiredAddons;
  List<Addon> optionalAddons;

  Product({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productUrl,
    required this.productLikes,
    required this.productUnit,
    required this.requiredAddons,
    required this.optionalAddons
    }
  );

  Product.fromJson(Map<String, dynamic> json) : this(
    productId : json['productId'],
    productName : json['productName'],
    productDescription : json['productDescription'],
    productPrice : json['productPrice'],
    productUrl : json['productUrl'],
    productLikes : json['productLikes'],
    productUnit : json['productUnit'],
    requiredAddons : json['requiredAddons'] != null ? _parseJsonToList(json['requiredAddons']) : [],
    optionalAddons : json['optionalAddons'] != null ? _parseJsonToList(json['optionalAddons']) : [],
  );

  Map<String, dynamic> toJson(){
    return {
      'productId' : productId,
      'productName' : productName,
      'productDescription' : productDescription,
      'productPrice' : productPrice,
      'productUrl' : productUrl,
      'productLikes' : productLikes,
      'productUnit' : productUnit,
      'requiredAddons' : requiredAddons,
      'optionalAddons' : optionalAddons,
    };
  }

  static List<Addon> _parseJsonToList(List<dynamic> json){
    List<Addon> itemsList = List<Addon>.from(json.map((i) => Addon.fromJson(i)));

    return itemsList;
  }
}