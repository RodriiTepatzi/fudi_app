// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/forms/quantity_form.dart';
import 'package:fudi_app/src/views/widgets/restaurant_view.dart';
import 'package:fudi_app/tests_vars.dart';

Widget LargeRestaurantCard(BuildContext context){
  return Container(
    margin: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(roundedCornersValue),
          child: const Image(
            width: 200.0,
            height: 250.0,
            fit: BoxFit.cover,
            image: NetworkImage('https://media.istockphoto.com/photos/fresh-homemade-pizza-margherita-picture-id1278998606?b=1&k=20&m=1278998606&s=170667a&w=0&h=BlXvVFfwLwD4ckIF_7sg_mis8ULaqy9sdPgA6grpSo4='),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text(
                'Pizza & Pizza Restaurante',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text(
                'Calle Número 10, Tlaxcala, Tlax',
                style: TextStyle(
                  color: disabledColorApp,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.0,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 16.0,
                ),
                const Text(
                  "4.8",
                  style: TextStyle(
                    color: accentColorApp,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                  ),
                ),
                const Text(
                  "(223 ratings)",
                  style: TextStyle(
                    color: accentColorApp,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.0,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: 80.0,
                  height: 20.0,
                  child: RaisedButton(
                    elevation: 0.5,
                    shape: const StadiumBorder(),
                    color: accentColorApp,
                    textColor: Colors.white,
                    onPressed: (){ },
                    child: const Text('Agregar', style: TextStyle(fontSize: 11.0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget SmallRestaurantCard(BuildContext context, RestaurantModel restaurant){
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantView(restaurant: restaurant, products: getTestProducts())));
      
      RestaurantView(restaurant: restaurant, products: getTestProducts());
    },
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgCardApp,
            borderRadius: BorderRadius.circular(roundedCornersValue),
          ),
          width: MediaQuery.of(context).size.width - 32,
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(roundedCornersValue),
                child: Image(
                  width: 100,
                  height: 75,
                  fit: BoxFit.cover,
                  image: NetworkImage(restaurant.restaurantUrl),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 158,
                    margin: const EdgeInsets.only(left: marginWidget),
                    child: Text(
                      restaurant.restaurantName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    margin: const EdgeInsets.only(left: marginWidget),
                    width: MediaQuery.of(context).size.width - 158,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                          child: Text(
                            restaurant.restaurantAddress,
                            style: const TextStyle(
                              color: textColorApp,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        _dotSpacer(),
                        Container(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 2.0),
                          margin: const EdgeInsets.only(left: marginTag),
                          child: const Icon(
                            Icons.star_outline_outlined,
                            color: accentColorApp,
                            size: 14.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                          child: Text(
                            restaurant.stars,
                            style: const TextStyle(
                              color: textColorApp,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        _dotSpacer(),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            restaurant.cost,
                            style: const TextStyle(
                              color: textColorApp,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        _dotSpacer(),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            restaurant.category,
                            style: const TextStyle(
                              color: textColorApp,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: marginWidget),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _discountTicket('2 x 1'),
                        _discountTicket('Ahorra hasta un 30%'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _dotSpacer(){
  return Container(
    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
    child: const Text(
      '•',
      style: TextStyle(
        color: disabledColorApp,
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
    ),
  );
}

Widget _discountTicket(String ticketText){
  return IntrinsicWidth(
    child: Container(
      margin: const EdgeInsets.only(right: marginTag),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: accentColorOpaApp,
        borderRadius: BorderRadius.circular(roundedCornersValue),
      ),
      child: Text(
        ticketText,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 12.0
        ),
      ),
    ),
  );
}

Widget ProductCard(BuildContext context, Product product){
  
  return GestureDetector(
    onTap: (){
      showModalBottomSheet(
        isScrollControlled: true,
        elevation: 1,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(roundedCornersValue),
            topRight: Radius.circular(roundedCornersValue)
          ),
        ),
        builder: (context){
          return QuantityForm(product: product);
        }
      );
    },
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgCardApp,
            borderRadius: BorderRadius.circular(roundedCornersValue),
          ),
          width: MediaQuery.of(context).size.width - 32,
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(roundedCornersValue),
                child: Image(
                  width: 100,
                  height: 75,
                  fit: BoxFit.cover,
                  image: NetworkImage(product.productUrl),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 158,
                    margin: const EdgeInsets.only(left: marginWidget),
                    child: Text(
                      product.productName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    margin: const EdgeInsets.only(left: marginWidget),
                    width: MediaQuery.of(context).size.width - 158,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                          child: Text(
                            "\$" + product.productPrice.toString(),
                            style: const TextStyle(
                              color: textColorApp,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        _dotSpacer(),
                        Container(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 2.0),
                          margin: const EdgeInsets.only(left: marginTag),
                          child: const Icon(
                            Icons.favorite,
                            color: accentColorApp,
                            size: 14.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                          child: Text(
                            product.productLikes,
                            style: const TextStyle(
                              color: textColorApp,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        _dotSpacer(),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            product.productUnit,
                            style: const TextStyle(
                              color: textColorApp,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: marginWidget),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _discountTicket('2 x 1'),
                        _discountTicket('Ahorra hasta un 30%'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}