class Product{
  String productId;
  String productName;
  String productDescription;
  String productPrice;
  String productUrl;
  String productLikes;
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
    productId : json['productId']! as String,
    productName : json['productName'] as String,
    productDescription : json['productDescription']! as String,
    productPrice : json['productPrice']! as String,
    productUrl : json['productUrl']! as String,
    productLikes : json['productLikes']! as String,
    productUnit : json['productUnit']! as String,
  );
}