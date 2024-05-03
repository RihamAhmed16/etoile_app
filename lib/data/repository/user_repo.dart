import 'package:etoile_app/data/store_api_call.dart';
import 'package:etoile_app/data/models/user_model.dart';
import 'package:etoile_app/data/user_api_call.dart';

class UserRepo {
  final ApiCall apiCall;

  final UserApiCall userApiCall;

  UserRepo({required this.userApiCall, required this.apiCall});

  Future<UserModel> geCurrentUserInformation() async {
    final response = await apiCall.getCurrentUserInformation();
    return UserModel.fromJson(response.data() ?? {});
  }

  Future<void> deleteUserInformationFromDataBase() async {
    await userApiCall.deleteUserInformationFromDataBase();
  }

  Future<void> deleteUserAccount() async {
    await userApiCall.deleteUserAccount();
  }
}
