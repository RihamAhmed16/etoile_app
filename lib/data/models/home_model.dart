class HomeModel {
  late final String? name;
  late final String? description;
  late final String? image;

  late final String? catName;
  late final String? price;

  HomeModel(
      {required this.name,
      required this.description,
      required this.image,
      required this.catName,
      required this.price});

  HomeModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    description = json['description'] ?? '';
    catName = json['catname'] ?? '';
    price = json['price'] ?? '';
  }
}
