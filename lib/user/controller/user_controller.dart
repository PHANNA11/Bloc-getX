import 'package:get/get.dart';
import 'package:ui_state/user/model/user_model.dart';

class UserController extends GetxController {
  RxList<UserModel> lists = <UserModel>[].obs;
  Future<bool> addUser({required UserModel user}) async {
    lists.add(user);
    update();
    return true;
  }
}
