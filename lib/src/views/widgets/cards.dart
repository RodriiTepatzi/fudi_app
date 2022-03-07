// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/order.dart';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/forms/quantity_form.dart';
import 'package:fudi_app/src/views/pages/order_page.dart';
import 'package:fudi_app/src/views/pages/restaurant_view.dart';
import 'package:intl/intl.dart';

Widget LargeRestaurantCard(BuildContext context){
  return IntrinsicHeight(
    child: Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: bgCardApp,
        borderRadius: BorderRadius.circular(roundedCornersValue),
        boxShadow: [ 
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(roundedCornersValue),
            child: const Image(
              width: 300.0,
              height: 150.0,
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
              /*Row(
                children: const[
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16.0,
                  ),
                  Text(
                    "4.8",
                    style: TextStyle(
                      color: accentColorApp,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),*/
            ],
          ),
        ],
      ),
    ),
  );
}

Widget SmallRestaurantCard(BuildContext context, RestaurantModel restaurant){
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantView(restaurant: restaurant, products: restaurant.products!)));

    },
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgCardApp,
            borderRadius: BorderRadius.circular(roundedCornersValue),
            boxShadow: [ 
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
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
                  height: 100,
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
                              color: textColorApp2,
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
                            Icons.star,
                            color: accentColorApp,
                            size: 14.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                          child: Text(
                            restaurant.stars,
                            style: const TextStyle(
                              color: textColorApp2,
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
                              color: textColorApp2,
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
                              color: textColorApp2,
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
        enableDrag: true,
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

Widget OrderCard(BuildContext context, Order order){
  final doubleFormater = NumberFormat("#####.00");
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(order: order)));
    },
    child: Container(
      /*margin: const EdgeInsets.all(marginWidget),
      decoration: BoxDecoration(
        color: bgCardApp,
        borderRadius: BorderRadius.circular(roundedCornersValue),
      ),
      child: Container(
        padding: const EdgeInsets.all(marginWidget),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              order.orderStatus,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(marginWidget),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(roundedCornersValue),
                    child: Image(
                      width: 40,
                      height: 40,
                      image: NetworkImage(order.orderItem[0].restaurant.restaurantUrl),             
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: marginWidget),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.orderItem[0].restaurant.restaurantName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: marginWidget/2),
                          padding: const EdgeInsets.all(marginWidget/2),
                          decoration: BoxDecoration(
                            color: accentColorApp,
                            borderRadius: BorderRadius.circular(roundedCornersValue),
                          ),
                          child: Text(
                            order.orderItem[0].restaurant.status,
                            style: const TextStyle(
                              fontSize: 10.0,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(marginWidget),
              child: Text(
                buildTotalProducts(order),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(marginWidget),
              child: Row(
                children: [
                  Text(
                    DateFormat("dd-MM-yyyy hh:mm a").format(order.dateCreated),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                  "MXN \$" + doubleFormater.format((double.parse(order.total))),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),*/
    ),
  );
}

String buildTotalProducts(Order order){

  int totalProducts = 0;

  for (var item in order.orderItem){
    totalProducts += item.products.length;
  }

  if(totalProducts == 1){
    return  totalProducts.toString() + ' producto';
  }
  else {
    return totalProducts.toString() + ' productos';
  }
    
}