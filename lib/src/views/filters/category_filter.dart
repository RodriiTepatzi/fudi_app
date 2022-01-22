import 'package:flutter/material.dart';
import 'package:fudi_app/src/widgets/header.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({Key? key, required this.categoryName}) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        headerText(categoryName, Colors.black, 28.0, FontWeight.bold),
      ],
    );
  }
}