import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fudi_app/src/views/widgets/cards.dart';
import 'package:fudi_app/src/views/widgets/header.dart';
import 'package:fudi_app/tests_vars.dart';

class HomeFilter extends StatelessWidget {
  const HomeFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          alignment: Alignment.centerLeft,
          child: headerText('Descubre lugares nuevos', Colors.black, 30.0, FontWeight.bold)
        ),
        _sliderLargeCards(),
        _headers(context, 'Populares esta semana', 'Mostrar todo'),
        SmallRestaurantCard(context, restaurantModel),
        SmallRestaurantCard(context, restaurantModel),
        SmallRestaurantCard(context, restaurantModel),
        _headers(context, 'Categorias', 'Mostrar todo'),
        _sliderCollections(context, 'https://media.istockphoto.com/photos/closeup-of-home-made-tasty-burger-on-wooden-table-picture-id1300482641?b=1&k=20&m=1300482641&s=170667a&w=0&h=4wmDNS7Y3X_bxnUXUNykuLDf7yt_4ZhbqP3bPkhWFsg='),
      ],
    );
  }
}

Widget _sliderLargeCards(){
  return SizedBox(
    height: 350.0,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index){
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){
            return LargeRestaurantCard(context);
          },
        );
      },
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

Widget _sliderCollections(BuildContext context, String pictureURL){
  return SizedBox(
    height: 280.0,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index){
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){
            return _collection(context);
          },
        );
      },
    ),
  );
}

Widget _collection(BuildContext context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.all(10.0),
        child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: const Image(
            width: 300,
            height: 200,
            fit: BoxFit.cover,
            image: NetworkImage('https://media.istockphoto.com/photos/neapolitan-pizza-on-black-background-picture-id1295797149?b=1&k=20&m=1295797149&s=170667a&w=0&h=pvcxQRi0VJvzSr6VW6UBH-TfBEamd_fM5dPpYzUGNg4='),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: const Text(
          'Pizza',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ),
      const SizedBox(height: 20.0,),
    ],
  );
}
