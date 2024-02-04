part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}
class GetOrdersLoading extends OrdersState {}
class GetOrdersSuccess extends OrdersState {}
class GetOrdersFailure extends OrdersState {
  final String error;

  GetOrdersFailure({required this.error});
}