import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fudi_app/src/models/addon.dart';
import 'package:fudi_app/src/models/addon_checker.dart';
import 'package:fudi_app/src/models/addon_checker_item.dart';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/models/restaurant.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';

// ignore: must_be_immutable
class AddonsForm extends StatefulWidget {
  final Product product;
  RestaurantModel restaurant;
  String userId;
  AddonsForm({Key? key, required this.product, required this.restaurant, required this.userId}) : super(key: key);

  @override
  State<AddonsForm> createState() => _AddonsFormState();
}

class _AddonsFormState extends State<AddonsForm> {

  List<AddonChecker> requiredSelectedValues = [];

  @override
  void initState() {
    super.initState();
    requiredSelectedValues = [];
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
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              for(AddonChecker addonChecker in requiredSelectedValues){
                widget.product.requiredAddons.where((element) => element.addonSection == addonChecker.addonSection).toList()[0].addons = addonChecker.convertToList();
              }
            },
            child: Container(
              margin: const EdgeInsets.only(left: marginWidget, right: marginWidget),
              padding: const EdgeInsets.only(left: marginWidget * 2, right: marginWidget * 2),
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                color: accentColorApp,
                borderRadius: BorderRadius.circular(roundedCornersValue),
              ),
              child: const Text(
                "Continuar",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
      if(addon.allowMultiple){
        widgets.add(
          Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: marginWidget, top: marginWidget),
                child: Text(
                  addon.addonSection,
                  style: const TextStyle(
                    color: accentColorApp,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: marginWidget),
                    child: const Text(
                      "Obligatorio",
                      style: TextStyle(
                        color: accentColorApp,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(right: marginWidget),
                    child: const Text(
                      "Multiple",
                      style: TextStyle(
                        color: accentColorApp,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              ...switchGenerator(addon),
            ],
          ),
        );
      }
      else{
        widgets.add(
          Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: marginWidget, top: marginWidget),
                child: Text(
                  addon.addonSection,
                  style: const TextStyle(
                    color: accentColorApp,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: marginWidget),
                    child: const Text(
                      "Opcional",
                      style: TextStyle(
                        color: accentColorApp,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(right: marginWidget),
                    child: const Text(
                      "Uno",
                      style: TextStyle(
                        color: accentColorApp,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              ...switchGenerator(addon),
            ],
          ),
        );
      }
    }
    return widgets;
  }

  List<Widget> switchGenerator(Addon addon){
    List<Widget> widgets = [];
    
    AddonChecker addonChecker = requiredSelectedValues.where((element) => element.addonSection == addon.addonSection).toList().isNotEmpty ? 
      requiredSelectedValues.where((element) => element.addonSection == addon.addonSection).toList()[0] : AddonChecker(addonSection: addon.addonSection, selectedValues: []);

    for (var item in addon.addons) {
      if(addon.allowMultiple){
        if(addonChecker.selectedValues.where((element) => element.addonName == item).toList().isEmpty){

          AddonCheckerItem addonCheckerItem = AddonCheckerItem(addonName: item, isSelected: false);
          addonChecker.selectedValues.add(addonCheckerItem);

          if(requiredSelectedValues.where((element) => element.addonSection == addon.addonSection).toList().isEmpty){
            setState(() {  
              requiredSelectedValues.add(addonChecker);
            });
          }
          
          widgets.add(
            Container(
              margin: const EdgeInsets.all(marginWidget),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item),
                  FlutterSwitch(
                    activeColor: accentColorApp,
                    value: requiredSelectedValues.where((element) => element.addonSection == addon.addonSection).toList()[0].selectedValues.where((element) => element.addonName == item).toList()[0].isSelected,
                    onToggle: (val) {
                      setState(() {
                        requiredSelectedValues.where((element) => element.addonSection == addon.addonSection).toList()[0].selectedValues.where((element) => element.addonName == item).toList()[0].isSelected = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        }
        else{
          widgets.add(
            Container(
              margin: const EdgeInsets.all(marginWidget),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item),
                  FlutterSwitch(
                    activeColor: accentColorApp,
                    value: requiredSelectedValues.where((element) => element.addonSection == addon.addonSection).toList()[0].selectedValues.where((element) => element.addonName == item).toList()[0].isSelected,
                    onToggle: (val) {
                      setState(() {
                        requiredSelectedValues.where((element) => element.addonSection == addon.addonSection).toList()[0].selectedValues.where((element) => element.addonName == item).toList()[0].isSelected = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        }
      }
      else{
        if(addonChecker.selectedValues.where((element) => element.addonName == item).toList().isEmpty){

          AddonCheckerItem addonCheckerItem = AddonCheckerItem(addonName: item, isSelected: false);
          addonChecker.selectedValues.add(addonCheckerItem);

          if(requiredSelectedValues.where((element) => element.addonSection == addon.addonSection).toList().isEmpty){
            setState(() {  
              requiredSelectedValues.add(addonChecker);
            });
          }
          
          widgets.add(
            Container(
              margin: const EdgeInsets.all(marginWidget),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item),
                  FlutterSwitch(
                    activeColor: accentColorApp,
                    value: requiredSelectedValues.where((element) => element.addonSection == addon.addonSection).toList()[0].selectedValues.where((element) => element.addonName == item).toList()[0].isSelected,
                    onToggle: (val) {
                      setState(() {
                        requiredSelectedValues.where((element) => element.addonSection == addon.addonSection).toList()[0].selectedValues.where((element) => element.addonName == item).toList()[0].isSelected = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        }
        else{
          widgets.add(
            Container(
              margin: const EdgeInsets.all(marginWidget),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item),
                  FlutterSwitch(
                    activeColor: accentColorApp,
                    value: requiredSelectedValues.where((element) => element.addonSection == addon.addonSection).toList()[0].selectedValues.where((element) => element.addonName == item).toList()[0].isSelected,
                    onToggle: (val) {
                      checkObligatory(addon.addonSection, item);
                    },
                  ),
                ],
              ),
            ),
          );
        }
      }
    }
    return widgets;
  }

  void checkObligatory(String section, String addonName){
    for (var item in requiredSelectedValues.where((element) => element.addonSection == section).toList()[0].selectedValues) {
      if(item.addonName != addonName){
        setState(() {
          item.isSelected = false;
        });
      }
      else{
        setState(() {
          item.isSelected = true;
        });
      }
    }
  }

}