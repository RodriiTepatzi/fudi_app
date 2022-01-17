import 'package:flutter/material.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';

Widget LargeRestaurantCard(BuildContext context){
  return Container(
    margin: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
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

Widget SmallRestaurantCard(BuildContext context, String restaurantName, String restaurantAddress, String imageURL, String starsValue, String ratingValue, String categoryValue, String costValue){
  return Row(
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
                image: NetworkImage(imageURL),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 158,
                  margin: const EdgeInsets.only(left: marginWidget),
                  child: Text(
                    restaurantName,
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
                          restaurantAddress,
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
                          starsValue,
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
                          costValue,
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
                          categoryValue,
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