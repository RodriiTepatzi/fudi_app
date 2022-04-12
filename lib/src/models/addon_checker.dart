import 'package:fudi_app/src/models/addon_checker_item.dart';

class AddonChecker {
  String addonSection;
  List<AddonCheckerItem> selectedValues = [];

  AddonChecker({required this.addonSection, required this.selectedValues});

  List<String> convertToList(){
    List<String> list = [];
    for (var item in selectedValues) {
      list.add(item.addonName);
    }

    return list;
  }
}