import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudi_app/src/controllers/explore_controller.dart';
import 'package:fudi_app/src/models/category.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/services/category_service.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/pages/map_view.dart';
import 'package:fudi_app/src/views/tabs/filters/category_view.dart';
import 'package:fudi_app/src/views/tabs/filters/home_filter.dart';
import 'package:fudi_app/src/views/widgets/alert_dialog.dart';
import 'package:fudi_app/src/views/widgets/loader.dart';
import 'package:fudi_app/src/views/widgets/navbar_category_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:permission_handler/permission_handler.dart';

class ExploreTab extends StatefulWidget {
  UserApp? userApp;
  ExploreTab({Key? key, required this.userApp}) : super(key: key);

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {

  int _filterItemSelected = 0;
  final ScrollController _scrollController = ScrollController();
  bool _alreadySet = false;
  bool _colorBarSet = false;
  List<Widget> _recomended = [];
  List<Widget> _popular = [];
  List<Widget> filterSelectionWidget = [Container()];
  List<CategoryModel> _categories = [];

  @override
  void initState(){ 
    if(_recomended.isNotEmpty && _popular.isNotEmpty && _categories.isNotEmpty){
      filterSelectionWidget = [
        HomeFilter(popular: _popular, recomended: _recomended,),
      ];  
    }
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  Future<void> _checkPermission() async {
    final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;
    if (!isGpsOn) {
      print('Turn on location services before requesting permission.');
      return;
    }
    
    final status = await Permission.location.request();
    //await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      print('Permission granted');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MapView()
        ),
      );
    } 
    else if (status == PermissionStatus.denied) {
      showAlertDialog(context, Icons.gps_fixed, 'Active su ubicación', 'Es necesario tener acceso a su ubicación para ofrecerle una mejor experiencia de usuario.', 'Entendido');
      await openAppSettings();
    } 
    else if (status == PermissionStatus.permanentlyDenied) {
      showAlertDialog(context, Icons.gps_fixed, 'Active su ubicación', 'Es necesario tener acceso a su ubicación para ofrecerle una mejor experiencia de usuario.', 'Entendido');
      print('Take the user to the settings page.');
      await openAppSettings();
    }
  }
  
  Future setData(BuildContext context) async{
    if(!_alreadySet){
      var temp = await ExploreController().getRecomendations(context, widget.userApp!);
      var temp2 = await ExploreController().getRecomendations(context, widget.userApp!);
      var categoriesTemp = await CategoryService().getCategories();
      setState(() {
        _recomended = temp;
        _popular = temp2;
        _categories = categoriesTemp;
        if(_recomended.isNotEmpty && _popular.isNotEmpty && _categories.isNotEmpty){
          filterSelectionWidget = [
            HomeFilter(popular: _popular, recomended: _recomended,),
          ];  
          _alreadySet = true;
        }
      });
    }
  }

  void setFilterIndex(int index){
    setState(() {
      _filterItemSelected = index;  
    });
  }

  _scrollListener() {
    if (_scrollController.offset >= 235 && !_scrollController.position.outOfRange) {
      setState(() {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent
          )
        );
      });
    }
    else if(_scrollController.offset  < 235){
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: accentColorApp,
        )
      );
    }
  }

  void setBar(){
    if(!_colorBarSet){
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: accentColorApp,
        )
      );
      _colorBarSet = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    setData(context);
    if(_popular.isNotEmpty && _recomended.isNotEmpty){
      return SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                AnimationLimiter(
                  child: Column(
                    children: [
                      ...AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 100),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          )
                        ),
                        children: [
                          _topBar(context),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: _navBar(context)
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: filterSelectionWidget.elementAt(_filterItemSelected)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],),
            ),
          ],
        ),
      );
    }
    else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: loader(),
          ),
        ],
      );
    }
  }

  Widget _topBar(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        color: accentColorApp,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(roundedCornersValue), bottomRight: Radius.circular(roundedCornersValue))
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Container(
                  margin: const EdgeInsets.only(top: marginWidget * 3, bottom: marginWidget, left: marginWidget * 2, right: marginWidget * 2),
                  child: Text(
                    "Bienvenido, ${_getFirstName(widget.userApp?.fullname)}\n ¿Qué ordenarás hoy?",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              _checkPermission();
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapView()
                ),
              );*/
            },
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: marginWidget, left: marginWidget * 2, right: marginWidget * 2),
              padding: const EdgeInsets.all(marginWidget),
              decoration: BoxDecoration(
                color: accentColorLightApp,
                borderRadius: BorderRadius.circular(roundedCornersValue),
              ),
              child: const Text(
                "Francisco I. Madero 150, Contla de Juan Cuamatzi",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _navBar(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: marginWidget*2),
      height: 34.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            decoration: BoxDecoration(
              color: accentColorApp,
              borderRadius: BorderRadius.circular(roundedCornersValue),
            ),
            child: IconButton(
              onPressed: (){
              },
              splashRadius: 2,
              icon: const Icon(
                  Icons.tune,
                  color: Colors.white,
                  size: 17,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: marginWidget),
            decoration: BoxDecoration(
              color: accentColorApp,
              borderRadius: BorderRadius.circular(roundedCornersValue),
            ),
            child: IconButton(
              onPressed: (){
                setFilterIndex(0);
              },
              splashRadius: 2,
              icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 17,
              ),
            ),
          ),
          ...generateCategories(),
        ],
      ),
    );
  }

  List<Widget> generateCategories(){

    List<Widget> categoryItems = <Widget>[];
    int counter = 1;

    for (var item in _categories) {
      categoryItems.add(NavbarCategoryButton(
        item.name,
        counter, 
        setFilterIndex)
      );
      counter++;
    }

    _generateCategoriesFilters(_categories);
    return categoryItems;
  }

  void _generateCategoriesFilters(List<CategoryModel> categories){
    for (var item in categories) {
      filterSelectionWidget.add(CategoryView(categoryModel: item, user: widget.userApp!));
    }
  }

  String _getFirstName(String? fullname){
    return fullname != null ? fullname.split(" ").elementAt(0).toString() : "";
  }
  Future _askLocation(BuildContext context) async{
    showAlertDialog(context, Icons.gps_fixed, 'Active su ubicación', 'Es necesario tener acceso a su ubicación para ofrecerle una mejor experiencia de usuario.', 'Entendido');
    
  }
}

