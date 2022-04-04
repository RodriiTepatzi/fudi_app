class AddonChecker {
  String addonSection;
  List<String> selectedValues = [];

  AddonChecker(
    {
      required this.addonSection,
    }
  );

  addSelectedValue(String value){
    selectedValues.add(value);
  }
}