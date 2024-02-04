import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etoile_app/data/models/address_model.dart';
import 'package:etoile_app/data/models/cart_model.dart';

class OrderModel {
  String orderId;
  AddressModel address;
  List<CartModel> basketItems;
  Timestamp createdAt;
  String status;
  String paymentMethod;
  double totalAMount;
  int orderNumber;

  OrderModel(
      {required this.orderId,
      required this.address,
      required this.basketItems,
      required this.createdAt,
      required this.status,
      required this.orderNumber,
      required this.paymentMethod,
      required this.totalAMount});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> basketItemsJson = json['basketItems'];
    List<CartModel> basketItems =
        basketItemsJson.map((item) => CartModel.fromJson(item)).toList();

    return OrderModel(
      orderId: json['orderId'],
      address: AddressModel.fromJson(json['address']),
      basketItems: basketItems,
      createdAt: json['createdAt'],
      totalAMount: json['totalAmount'],
      orderNumber: json['orderNumber'],
      paymentMethod: json['paymentMethod'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> basketItemsJson =
        basketItems.map((item) => item.toJson()).toList();

    return {
      'orderId': orderId,
      'address': address.toJson(),
      'basketItems': basketItemsJson,
      'totalAmount': totalAMount,
      'orderNumber': orderNumber,
      'paymentMethod': paymentMethod,
      'status': status,
      'createdAt': createdAt,
    };
  }
}
