import 'package:etoile_app/data/orders_api_call.dart';
import 'package:uuid/uuid.dart';

import '../models/order_model.dart';

class OrdersRepo {
  OrdersApiCall ordersApiCall;

  OrdersRepo({required this.ordersApiCall});

  String id = const Uuid().v4();

  Future<void> addOrder({required OrderModel orderModel}) async {
    await ordersApiCall.addOrder(order: orderModel, id: id);
  }

  Future<List<OrderModel>> getOrders() async {
    final response = await ordersApiCall.getOrders();
    return response.docs
        .map((order) => OrderModel.fromJson(order.data()))
        .toList();
  }
}
