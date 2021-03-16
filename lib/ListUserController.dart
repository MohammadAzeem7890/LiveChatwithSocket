import 'package:get/get.dart';
import 'package:socket/ListedUsers.dart';
import 'package:socket/LoginScreen.dart';

class ListUserController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ListedUsers.initDummyUsers();
  }
}