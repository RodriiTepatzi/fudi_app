// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers, deprecated_member_use, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/category.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:fudi_app/src/views/filters/category_filter.dart';
import 'package:fudi_app/src/views/filters/home_filter.dart';
import 'package:fudi_app/src/widgets/navbar_items.dart';


class ExploreTab extends StatefulWidget {
  ExploreTab({Key? key}) : super(key: key);

  @override
  _ExploreTabState createState() => _ExploreTabState();
  
}

class _ExploreTabState extends State<ExploreTab> {

  int _filterItemSelected = 0;

  List<Widget> filterSelectionWidget = [
    HomeFilter(),
    
  ];

  void setFilterIndex(int index){
    setState(() {
      _filterItemSelected = index;  
    });
  }

  Function()? callSetFilterIndex(int index){
    setFilterIndex(index);
    return null;
  }

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
                    _navBar(context),
                    filterSelectionWidget.elementAt(_filterItemSelected),
                  ],
                ),
              ),
            ],),
          ),
        ],
      ),
    );
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
              color: textFieldColorApp,
              border: Border.all(
                color: textFieldColorApp,
              ),
              borderRadius: BorderRadius.circular(roundedCornersValue),
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

  Widget _navBar(BuildContext context){
    var categoriesWidgets = generateCategories();
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
      CategoryModel(categoryName: "Categoria 1"),
      CategoryModel(categoryName: "Categoria 2"),
      CategoryModel(categoryName: "Categoria 3"),
      CategoryModel(categoryName: "Categoria 4"),
      CategoryModel(categoryName: "Categoria 5"),
      CategoryModel(categoryName: "Categoria 6")
    ];

    List<Widget> categoryItems = <Widget>[];
    int counter = 1;

    for (var item in categories) {
      categoryItems.add(CategoryItem(item.categoryName, counter, callSetFilterIndex(counter)));
      counter++;
    }

    return categoryItems;
  }

  void generateCategoriesFilters(List<CategoryModel> categories){
    for (var item in categories) {
      filterSelectionWidget.add(CategoryFilter(categoryName: item.categoryName));
    }
  }
}
