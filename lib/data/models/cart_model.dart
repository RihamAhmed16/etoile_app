class CartModel {
  late String productId;
  late String image;
  late int quantity;
  late double price;
  late String name;

  CartModel(
      {required this.image,
      required this.price,
      required this.productId,
      required this.quantity,required this.name});

  CartModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
    productId = json['product_id'];
    name = json['name'];
  }
}
