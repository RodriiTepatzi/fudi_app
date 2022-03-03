class CategoryModel{
  String name;

  CategoryModel({required this.name});

  CategoryModel.fromJson(Map<String, dynamic> jsonData) : this(
    name : jsonData['name'],
  );
}