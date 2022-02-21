import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudi_app/src/models/category.dart';
import 'package:fudi_app/src/models/user_app.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/filters/category_view.dart';
import 'package:fudi_app/src/views/filters/home_filter.dart';
import 'package:fudi_app/src/views/widgets/navbar_category_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ExploreTab extends StatefulWidget {
  UserApp userApp;
  ExploreTab({Key? key, required this.userApp}) : super(key: key);

  @override
  _ExploreTabState createState() => _ExploreTabState();
  
}

class _ExploreTabState extends State<ExploreTab> {

  int _filterItemSelected = 0;
  final ScrollController _scrollController = ScrollController();
  List<Widget> filterSelectionWidget = [
    const HomeFilter(),
  ];

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
            statusBarIconBrightness: Brightness.light,
            statusBarColor: bgApp,
          )
        );
      });
    }
    else if(_scrollController.offset < 235 && !_scrollController.position.outOfRange){
      setBar();
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    setBar();
    super.initState();
    
  }

  void setBar(){
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: accentColorApp,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: AnimationLimiter(
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
              ),
            ],),
          ),
        ],
      ),
    );
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
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Container(
                  margin: const EdgeInsets.only(top: marginWidget * 3, bottom: marginWidget * 3, left: marginWidget * 2, right: marginWidget * 2),
                  child: Text(
                    "Bienvenido, ${_getFirstName(widget.userApp.fullname)}\n ¿Qué ordenarás hoy?",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
              /*Container(
                width: 40.0,
                height: 40.0,
                margin: const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 20.0,
                    color: accentColorApp
                  ),
                  onPressed: (){

                  },
                ),
              ),*/
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: marginWidget, left: marginWidget * 2, right: marginWidget * 2),
            child: const Text(
              "Francisco I. Madero 150, Contla de Juan Cuamatzi",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.start,
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
    
    List<CategoryModel> categories = <CategoryModel>[
      CategoryModel(categoryName: "Pizzas"),
      CategoryModel(categoryName: "Hamburguesas"),
      CategoryModel(categoryName: "Comida Mexicana"),
      CategoryModel(categoryName: "Categoria 4"),
      CategoryModel(categoryName: "Categoria 5"),
      CategoryModel(categoryName: "Categoria 6")
    ];

    List<Widget> categoryItems = <Widget>[];
    int counter = 1;

    for (var item in categories) {
      categoryItems.add(NavbarCategoryButton(
        item.categoryName,
        counter, 
        setFilterIndex)
      );
      counter++;
    }

    _generateCategoriesFilters(categories);
    return categoryItems;
  }

  void _generateCategoriesFilters(List<CategoryModel> categories){
    for (var item in categories) {
      filterSelectionWidget.add(CategoryView(categoryModel: item));
    }
  }

  String _getFirstName(String fullname){
    return fullname.split(" ").elementAt(0);
  }
}
