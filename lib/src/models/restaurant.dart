class RestaurantModel {
  String? id;
  String restaurantName;
  String restaurantAddress;
  String restaurantUrl;
  String restaurantSlogan;
  String stars;
  String cost;
  String category;
  String status;
  DateTime startDate;


  RestaurantModel({
    this.id,
    required this.restaurantName, 
    required this.restaurantAddress, 
    required this.restaurantSlogan, 
    required this.restaurantUrl,
    required this.stars,
    required this.cost,
    required this.category,
    required this.status,
    required this.startDate,
  });

  RestaurantModel.fromJson(Map<String, Object?> json)
    : this(
      id : json['id']! as String,
      restaurantName: json['restaurantName']! as String,
      restaurantAddress: json['restaurantAddress']! as String,
      restaurantSlogan: json['restaurantSlogan']! as String,
      restaurantUrl: json['restaurantUrl']! as String,
      stars: json['stars']! as String,
      cost: json['cost']! as String,
      category: json['category']! as String,
      status: json['status']! as String,
      startDate: json['startDate']! as DateTime,
    );

  Map<String, Object?> toJson(){
    return{
      'restaurantName' : restaurantName, 
      'restaurantAddress' : restaurantAddress,
      'restaurantSlogan' : restaurantSlogan,
      'restaurantUrl': restaurantUrl,
      'stars' : stars,
      'cost' : cost,
      'category' : category,
      'status' : status,
      'startDate' : startDate,
    };
  }
}