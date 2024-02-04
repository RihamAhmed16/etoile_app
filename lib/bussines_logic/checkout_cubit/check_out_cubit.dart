import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/core/helper/functions.dart';
import 'package:etoile_app/data/models/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/address_model.dart';
import '../../data/repository/address_repo.dart';
import '../../data/repository/orders_repo.dart';
import '../../helper/cach_helper.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
 final AddressRepo addressRepo;
final OrdersRepo ordersRepo;
  CheckOutCubit(this.addressRepo,this.ordersRepo) : super(CheckOutInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController buildingNumber = TextEditingController();
  TextEditingController apartmentNumber = TextEditingController();
  TextEditingController floorNumber = TextEditingController();
  String city = '';
  String orderPlace = '';
  List<AddressModel> address = [];
  int activeStep = 0;
  String choosenPaymentMethod = '';
  PaymentMethod? selectedPayment;

  Future<void> getAddress() async {
    emit(GetAddressLoading());
    addressRepo.getAddress().then((value) {
      address = value;
      emit(GetAddressSuccess());
    }).catchError((error) {
      emit(GetAddressFailure(error: error.toString()));
    });
  }

  Future<void> clearBasket() async {
    emit(DeleteBasketLoading());
    await addressRepo.clearBasket().then((value) {
      emit(DeleteBasketSuccess());
    }).catchError((error) {
      emit(DeleteBasketFailure(error: error.toString()));
    });
  }

  Future<void> addAddress() async {
    emit(AddAddressLoading());
    AddressModel addressModel = AddressModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        orderType: orderPlace,
        streetName: streetName.text,
        buildingNumber: int.parse(buildingNumber.text),
        floorNumber: int.parse(floorNumber.text),
        apartmentNumber: apartmentNumber.text,
        city: city,
        phoneNumber: mobileNumberController.text,
        id: addressRepo.id,
        isDefault: address.isEmpty ? true : false);
    await addressRepo.addAddress(addressModel: addressModel).then((value) {
      CashHelper.saveData(key: 'isMakedAddress', value: true);
      emit(AddAddressSuccess());
    }).catchError((error) {
      emit(AddAddressFailure(error: error.toString()));
    });
  }

  Future<void> deleteAddress({required String id}) async {
    emit(RemoveAddressLoading());
    addressRepo.deleteAddress(id: id).then((value) {
      getAddress();
      emit(RemoveAddressSuccess());
    }).catchError((error) {
      emit(RemoveAddressFailure(error: error.toString()));
    });
  }

  void emitStateToUpdateUI() {
    emit(ChangeDefaultAddress());
  }

  Future<void> addOrder(
      {required BuildContext context, required double totalAmount}) async {
    emit(AddOrderLoading());
    OrderModel orderModel = OrderModel(
        orderId: addressRepo.id,
        address: address.firstWhere((element) => element.isDefault == true),
        basketItems: context.read<StoreCubit>().basketProducts,
        createdAt: Timestamp.now(),
        status: 'inStore',
        orderNumber: generateRandomOrderNumber(),
        paymentMethod: selectedPayment == PaymentMethod.cashOnDelivery
            ? 'Cash On Delivery'
            : 'Visa',
        totalAMount: totalAmount);
    await ordersRepo.addOrder(orderModel: orderModel).then((value) {
      emit(AddOrderSuccess());
    }).catchError((error) {
      emit(AddOrderFailure(error: error.toString()));
    });
  }



  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    streetName.dispose();
    mobileNumberController.dispose();
    buildingNumber.dispose();
    apartmentNumber.dispose();
    activeStep = 0;
    return super.close();
  }
}

enum PaymentMethod {
  creditCard,
  cashOnDelivery,
}
