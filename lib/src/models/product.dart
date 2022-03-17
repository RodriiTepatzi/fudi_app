class Product{
  String productId;
  String productName;
  String productDescription;
  double productPrice;
  String productUrl;
  int productLikes;
  String productUnit;

  Product({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productUrl,
    required this.productLikes,
    required this.productUnit,
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
  );

  Map<String, dynamic> toJson(){
    return {
      "productId" : productId,
      "productName" : productName,
      "productDescription" : productDescription,
      "productPrice" : productPrice,
      "productUrl" : productUrl,
      "productLikes" : productLikes,
      "productUnit" : productUnit,
    };
  }
}