import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/widgets/back_button.dart';
import 'package:fudi_app/tests_vars.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
class RestaurantView extends StatelessWidget {
  const RestaurantView({Key? key, required this.restaurant, required this.products}) : super(key: key);
  final RestaurantModel restaurant;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent
          )
        );

    return Scaffold(
      
      /*appBar: AppBar(
        backgroundColor: bgApp,
        elevation: 0.0,
        leading: Builder( 
          builder: (BuildContext context){
            return backButtonTransparent(context, Colors.black);
          }
        ),
      ),*/
      body: ListView(
        padding: const EdgeInsets.all(0.0),
        scrollDirection: Axis.vertical,
        children: [
          Container(
            color: accentColorApp,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // Make this server-side later for changing it using NetworkImage(url)
                          image: AssetImage('assets/images/food_slide1.jpg')
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0), 
                        child: Container(
                          color: Colors.black.withOpacity(0.6)
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25.0),
                      child: backButtonTransparent(context, Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0.0, -20.0),
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0.0, -60.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: marginWidget),
                        alignment: Alignment.center,
                        child: AnimationLimiter(
                          child: AnimationConfiguration.synchronized(
                            child: ScaleAnimation(
                              duration: animationDuration,
                              child: FadeInAnimation(
                                duration: animationDuration,
                                child: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: BorderRadius.circular(roundedCornersValue),
                                  child: Container(
                                    color: Colors.white,
                                    child: Image(
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      image: NetworkImage(restaurant.restaurantUrl),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      AnimationLimiter(
                        child: AnimationConfiguration.synchronized(
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              duration: animationDuration,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  restaurant.restaurantName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: marginWidget),
                        alignment: Alignment.center,
                        child: Text(
                          restaurant.restaurantAddress,
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height - 90,
                          decoration: BoxDecoration(
                            color: bgApp,  
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: AnimationLimiter(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index){
                                  return AnimationConfiguration.staggeredList(
                                    position: index, 
                                    duration: Duration(milliseconds: 500 + index*20) ,
                                    child: SlideAnimation(
                                      horizontalOffset: 50.0,
                                      child: FadeInAnimation(
                                        child: getSingleCardProduct(context),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}