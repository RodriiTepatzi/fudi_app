import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/addon.dart';
import 'package:fudi_app/src/models/addon_checker.dart';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AddonsForm extends StatefulWidget {
  final Product product;
  RestaurantModel restaurant;
  String userId;
  AddonsForm({Key? key, required this.product, required this.restaurant, required this.userId}) : super(key: key);

  @override
  State<AddonsForm> createState() => _AddonsFormState();
}

class _AddonsFormState extends State<AddonsForm> {

  List<AddonChecker> obligatoryAddonValues = [];

  void checkObligatory(){

  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.9) - 50,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Column(
                  children: [
                    requiredSections(widget.product),
                    Text("data")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget requiredSections(Product product){
    if(product.requiredAddons.isNotEmpty){
      return Column(
        children: [
          ...requiredAddons(product.requiredAddons),
        ],
      );
    }
    else{
      return Container();
    }
  }

  List<Widget> requiredAddons(List<Addon> addons){
    List<Widget> widgets = [];
    for (var addon in addons) {
      widgets.add(
        Column(
          children: [
            Container(
              margin: const EdgeInsets.all(marginWidget),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      addon.addonSection,
                      style: const TextStyle(
                        color: accentColorApp,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Obligatorio",
                      style: TextStyle(
                        color: accentColorApp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...generateRowAddon(addon.addons)
          ],
        )
      );
    }
  
    return widgets;
  }

  List<Widget> generateRowAddon(List<String> addonValues){
    List<Widget> widgets = [];
    for (var item in addonValues) {
      widgets.add(
        Container(
          margin: const EdgeInsets.all(marginWidget),
          child: Row(
            children: [
              Text(
                item,
                style: const TextStyle(
                  color: accentColorApp,
                ),
              ),
              const Spacer(),
              Switch(
                value: false, 
                onChanged: (value){
                  
                }
              ),
            ],
          ),
        ) 
      );
    }

    return widgets;
  }
  
}