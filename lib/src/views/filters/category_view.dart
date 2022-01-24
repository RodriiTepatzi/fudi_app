import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/category.dart';
import 'package:fudi_app/src/views/widgets/header.dart';
import 'package:fudi_app/tests_vars.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key, required this.categoryModel}) : super(key: key);

  // here goes something to get the category.
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
        ...getTestCards(context, categoryModel.categoryName),
      ],
    );
  }
}