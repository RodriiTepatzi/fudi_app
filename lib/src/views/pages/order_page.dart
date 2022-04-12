// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fudi_app/src/controllers/order_page_controller.dart';
import 'package:fudi_app/src/models/order.dart';

class OrderPage extends StatelessWidget {
  Order order;
  OrderPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrderPageController().getWidgetByStatus(context, order);
  }
}