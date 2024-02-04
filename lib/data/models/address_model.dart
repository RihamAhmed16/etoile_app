class AddressModel {
  late final String firstName;
  late final String id;
  late final String lastName;
  late final String orderType;
  late final String streetName;
  late final int buildingNumber;
  late final int floorNumber;
  late final String apartmentNumber;
  late final String city;
  late final String phoneNumber;
   bool? isDefault;

  AddressModel(
      {required this.firstName,
      required this.lastName,
      required this.orderType,
      required this.streetName,
      required this.buildingNumber,
      required this.floorNumber,
      required this.apartmentNumber,
      required this.city,
      required this.phoneNumber,
      required this.id,
      required this.isDefault});

  AddressModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    orderType = json['orderType'];
    streetName = json['streetName'];
    buildingNumber = json['buildingNumber'];
    floorNumber = json['floorNumber'];
    apartmentNumber = json['apartmentNumber'];
    city = json['city'];
    phoneNumber = json['phoneNumber'];
    id = json['id'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'isDefault': isDefault,
      'lastName': lastName,
      'orderType': orderType,
      'streetName': streetName,
      'buildingNumber': buildingNumber,
      'floorNumber': floorNumber,
      'apartmentNumber': apartmentNumber,
      'city': city,
      'phoneNumber': phoneNumber,
      'id': id,
    };
  }
}
