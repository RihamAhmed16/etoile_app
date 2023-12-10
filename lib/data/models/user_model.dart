class UserModel {
  late final String firstName;
  late final String lastName;
  late final String emailAddress;
  late final String? mobileNumber;
  late final String uId;

  UserModel({
    required this.firstName,
    required this.uId,
    required this.lastName,
    required this.emailAddress,
    this.mobileNumber,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    emailAddress = json['email'];
    mobileNumber = json['mobileNumber'] ?? '';
    firstName = json['firstName'];
    lastName = json['lastName'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'emailAddress': emailAddress,
      'mobileNumber': mobileNumber,
      'uId': uId,
    };
  }
}