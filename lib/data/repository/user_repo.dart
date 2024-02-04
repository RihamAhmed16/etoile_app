import 'package:etoile_app/data/store_api_call.dart';
import 'package:etoile_app/data/models/user_model.dart';

class UserRepo {
  final ApiCall apiCall = ApiCall();

  Future<UserModel> geCurrentUserInformation() async {
    final response = await apiCall.getCurrentUserInformation();
    return UserModel.fromJson(response.data() ?? {});
  }
}
