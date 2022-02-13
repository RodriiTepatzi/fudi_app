import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  getSingleRestaurantData(String id) async {
    await _firestore.collection("restaurants");
  }

  getMultipleRestaurants(int start, int end) async{
    await _firestore.collection("restaurants");
  }
}