// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/widgets/cards.dart';
import 'package:fudi_app/src/views/widgets/header.dart';

// This widget represents the HomeFilter button.

class HomeFilter extends StatelessWidget {
  const HomeFilter({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    List<RestaurantModel> popular = [];
    List<RestaurantModel> recomendations = [];
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          alignment: Alignment.centerLeft,
          child: headerText('Ofertas', Colors.black, 30.0, FontWeight.bold)
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: marginWidget),
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(roundedCornersValue),
                child: const Image(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://images.unsplash.com/photo-1559613671-dfe2fb6a7680?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(marginWidget),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(roundedCornersValue),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://images.unsplash.com/photo-1559613671-dfe2fb6a7680?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(roundedCornersValue),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://images.unsplash.com/photo-1559613671-dfe2fb6a7680?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          alignment: Alignment.centerLeft,
          child: headerText('Descubre lugares nuevos', Colors.black, 30.0, FontWeight.bold)
        ),
        _sliderLargeCards(),
        _headers(context, 'Populares esta semana', 'Mostrar todo'),
        SmallRestaurantCard(context, popular[0]),
        SmallRestaurantCard(context, popular[1]),
        SmallRestaurantCard(context, popular[2]),
        _headers(context, 'Nuestra selección', 'Mostrar todo'),
        SmallRestaurantCard(context, recomendations[0]),
        SmallRestaurantCard(context, recomendations[1]),
        SmallRestaurantCard(context, recomendations[2]),
      ],
    );
  }
}

Widget _sliderLargeCards(){
  return SizedBox(
    height: 260.0,
    child: Swiper(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index){
        return LargeRestaurantCard(context);/*ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){
            return LargeRestaurantCard(context);
          },
        );*/
      },
      viewportFraction: 0.7,
      scale: 0.9,
    ),
  );
}

Widget _headers(BuildContext context, String textHeader, String textAction){
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        width: MediaQuery.of(context).size.width / 2,
        child: headerText(textHeader, Colors.black, 24.0, FontWeight.bold),
      ),
      const Spacer(),
      GestureDetector(
        child: Row(
          children: [
            Text(
              textAction,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
            const Icon(Icons.play_arrow),
          ],
        ),
      ),
    ],
  );
}
