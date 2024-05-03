part of 'check_out_cubit.dart';

@immutable
abstract class CheckOutState {}

class CheckOutInitial extends CheckOutState {}

class GetAddressLoading extends CheckOutState {}

class GetAddressSuccess extends CheckOutState {}

class GetAddressFailure extends CheckOutState {
  final String error;

  GetAddressFailure({required this.error});
}

class AddAddressLoading extends CheckOutState {}

class ChangeDefaultAddress extends CheckOutState {}

class AddAddressSuccess extends CheckOutState {}

class AddAddressFailure extends CheckOutState {
  final String error;

  AddAddressFailure({required this.error});
}

class RemoveAddressLoading extends CheckOutState {}

class RemoveAddressSuccess extends CheckOutState {}

class RemoveAddressFailure extends CheckOutState {
  final String error;

  RemoveAddressFailure({required this.error});
}

class AddOrderLoading extends CheckOutState {}

class AddOrderSuccess extends CheckOutState {}

class AddOrderFailure extends CheckOutState {
  final String error;

  AddOrderFailure({required this.error});
}

class GetAddressDetailsLoading extends CheckOutState {}

class GetAddressDetailsSuccess extends CheckOutState {
  final AddressModel addressModel;

  GetAddressDetailsSuccess({required this.addressModel});
}

class GetAddressDetailsFailure extends CheckOutState {
  final String error;

  GetAddressDetailsFailure({required this.error});
}
class EditAddressLoading extends CheckOutState {}
class EditAddressSuccess extends CheckOutState {}
class EditAddressFailure extends CheckOutState {
  final String error;

  EditAddressFailure({required this.error});
}
class DeleteBasketLoading extends CheckOutState {}

class DeleteBasketSuccess extends CheckOutState {}

class DeleteBasketFailure extends CheckOutState {
  final String error;

  DeleteBasketFailure({required this.error});
}
