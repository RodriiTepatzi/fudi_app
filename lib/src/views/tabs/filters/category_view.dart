import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fudi_app/src/controllers/explore_controller.dart';
import 'package:fudi_app/src/models/cart.dart';
import 'package:fudi_app/src/models/category.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/views/widgets/header.dart';
import 'package:fudi_app/src/views/widgets/loader.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  final UserApp user;
  const CategoryView({Key? key, required this.categoryModel, required this.user}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

// This class represents the partial-view when clicking on x category button at ExploreTab()
class _CategoryViewState extends State<CategoryView> {

  // Here goes something to get the category.
  bool _alreadySet = false;
  String _categoryName = "";
  List<Widget> _restaurants = [];
  
  @override
  void initState(){
    _categoryName = "";
    super.initState();
  }

  Future setData(BuildContext context) async{
    if(_categoryName != widget.categoryModel.name){
      _alreadySet = false;
    }

    if(!_alreadySet){
      if(mounted){
        _categoryName = widget.categoryModel.name;
        var categoriesTemp = await ExploreController().getCategoryRestaurants(context, _categoryName, widget.user);

        setState(() {
          _restaurants = categoriesTemp;
          if(_restaurants.isNotEmpty){
            _alreadySet = true;
          }  
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: accentColorApp,
      )
    );
    setData(context);
    if(_categoryName == widget.categoryModel.name && _restaurants.isNotEmpty && _alreadySet){
      return AnimationLimiter(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              alignment: Alignment.centerLeft,
              child: headerText(widget.categoryModel.name, Colors.black, 28.0, FontWeight.bold)
            ),
            ...AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                child: FadeInAnimation(
                  child: widget,
                )
              ),
              children: _restaurants,
            ),
          ],
        ),
      );
    }
    else{
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: loader(),
          )
        ],
      );
    }
  }
}