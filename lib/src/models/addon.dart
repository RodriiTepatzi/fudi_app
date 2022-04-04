class Addon{
  String addonSection;
  List<String> addons;
  bool allowMultiple;

  Addon(
    {
      required this.addonSection,
      required this.addons,
      required this.allowMultiple,
    }
  );

  Addon.fromJson(Map<String, dynamic> json)
    : this(
      addonSection: json['addonSection'],
      addons : _parseJsonToList(json['addons']),
      allowMultiple : json['allowMultiple'],
  );

  Map<String, dynamic> toJson(){
    return{
      "addonSection" : addonSection,
      "addons" : addons,
    };
  }

  static List<String> _parseJsonToList(List<dynamic> json){
    List<String> itemsList = List<String>.from(json.map((i) => i));

    return itemsList;
  }
}