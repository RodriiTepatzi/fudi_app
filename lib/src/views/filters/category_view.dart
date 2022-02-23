import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/category.dart';
import 'package:fudi_app/src/views/widgets/header.dart';
import 'package:fudi_app/tests_vars.dart';

// This class represents the partial-view when clicking on x category button at ExploreTab()

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key, required this.categoryModel}) : super(key: key);

  // Here goes something to get the category.

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          alignment: Alignment.centerLeft,
          child: headerText(categoryModel.categoryName, Colors.black, 28.0, FontWeight.bold)
        ),

        //...categoryModel.items,

        // Here we get the widgets to display. It must be all the restaurants that match this category.
        ...getTestCards(context, categoryModel.categoryName),
      ],
    );
  }
}