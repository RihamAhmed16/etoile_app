import 'package:etoile_app/data/models/address_model.dart';
import 'package:uuid/uuid.dart';

import '../address_api_call.dart';

class AddressRepo {
  AddressApiCall addressApiCall;

  AddressRepo({required this.addressApiCall});

  String id = const Uuid().v4();

  Future<List<AddressModel>> getAddress() async {
    final response = await addressApiCall.getAddress();
    return response.docs
        .map((address) => AddressModel.fromJson(address.data()))
        .toList();
  }

  Future<void> addAddress({required AddressModel addressModel}) async {
    await addressApiCall.addAddress(addressModel: addressModel, id: id);
  }

  Future<void> deleteAddress({required String id}) async {
    await addressApiCall.deleteAddress(id: id);
  }


  Future<void> clearBasket() async {
    await addressApiCall.clearBasket();
  }
}
