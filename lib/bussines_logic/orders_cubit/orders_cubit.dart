import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/order_model.dart';
import '../../data/repository/orders_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;

  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  List<OrderModel> orders = [];

  Future<void> getOrders() async {
    emit(GetOrdersLoading());
    await ordersRepo.getOrders().then((value) {
      orders = value;
      print(orders[0].totalAMount);
      emit(GetOrdersSuccess());
    });
  }
}
