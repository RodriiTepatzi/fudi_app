// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers, deprecated_member_use, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/widgets/cards.dart';
import 'package:fudi_app/src/widgets/header.dart';


class ExploreTab extends StatelessWidget {
  ExploreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _topBar(context),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      alignment: Alignment.centerLeft,
                      child: headerText('Descubre lugares nuevos', Colors.black, 30.0, FontWeight.bold)
                    ),
                    _sliderLargeCards(),
                    _headers(context, 'Populares esta semana', 'Mostrar todo'),
                    SmallRestaurantCard(context, 'Hot Dogs\' Restaurant', 'Calle 5 de Mayo #10','https://media.istockphoto.com/photos/hot-dogs-for-game-day-picture-id1326146587?b=1&k=20&m=1326146587&s=170667a&w=0&h=PXRYyxj4ZN5HXPzQIRG8t5a-B4Np0z-vqVWlRYDQ7g4=', '4.0'),
                    SmallRestaurantCard(context, 'Another Restaurant', 'Address Example 2','https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', '4.7'),
                    SmallRestaurantCard(context, 'Lincon Restaurant', 'Address Example 3','https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', '5.0'),
                    _headers(context, 'Categorias', 'Mostrar todo'),
                    _sliderCollections(context, 'https://media.istockphoto.com/photos/closeup-of-home-made-tasty-burger-on-wooden-table-picture-id1300482641?b=1&k=20&m=1300482641&s=170667a&w=0&h=4wmDNS7Y3X_bxnUXUNykuLDf7yt_4ZhbqP3bPkhWFsg='),
                  ],
                ),
              ),
            ],),
          ),
        ],
      ),
    );
  }
}


Widget _topBar(BuildContext context){
  return Row(
    children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'search'),
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          width: MediaQuery.of(context).size.width - 84,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(234, 236, 239, 1.0),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.search, 
                size: 20.0,
                color: Colors.grey,
              ),
              Container(
                margin: const EdgeInsets.only(left: 5.0),
                child: const Text(
                  'Buscar',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: 40.0,
        height: 40.0,
        margin: const EdgeInsets.only(left: 10.0, top: 10.0),
        decoration: BoxDecoration(
          color: accentColorApp,
          borderRadius: BorderRadius.circular(30),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.filter_list,
            size: 25.0,
            color: Colors.white
          ),
          onPressed: (){

          },
        ),
      ),
    ],
  );
}

Widget _sliderLargeCards(){
  return Container(
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
        child: Container(
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
      ),
    ],
  );
}

Widget _populares(BuildContext context, String restaurantName, String restaurantAddress, String imageURL){
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                image: NetworkImage(imageURL),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    restaurantName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    restaurantAddress,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        width: 80.0,
                        height: 20.0,
                        child: RaisedButton(
                          elevation: 0.5,
                          shape: const StadiumBorder(),
                          color: accentColorApp,
                          textColor: Colors.white,
                          onPressed: (){ },
                          child: const Text('Ver', style: TextStyle(fontSize: 11.0)),
                        ),
                      ),
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

Widget _sliderCollections(BuildContext context, String pictureURL){
  return Container(
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
  return Container(
    child: Column(
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
    ),
  );
}
