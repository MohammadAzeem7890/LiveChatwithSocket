import 'package:get/get.dart';
import 'package:socket/ListedUsers.dart';
import 'package:socket/LoginScreen.dart';

class LoginController extends GetxController{
  @override

  var loggedUser = Users().obs;

  login(userName){
    if(userName == null || userName.isEmpty){
      return;
    }
    else if(userName == 'Mohammad Azeem'){
      Users me = ListedUsers.dummyUsers[0];
      loggedUser.value = me;
      print(loggedUser.value);
      Get.to(ListOfUsersScreen());
    }
    else if(userName == 'Manan Ali'){
      Users notMe = ListedUsers.dummyUsers[1];
      loggedUser.value = notMe;
      print(loggedUser.value);
      Get.to(ListOfUsersScreen());
    }
  }

  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ListedUsers.getUserFor(LoginScreen().loggedUser);
  }
}

class Users {
  int id;
  String userName;
  String email;
  Users({this.id, this.userName, this.email});
  Users.fromJson(Map<String, dynamic> json) {
    id = json['1'];
    email = json['Azeemkalwar51@gmail.com'];
    userName = json['Mohammad Azeem'];
  }

  Map<String, dynamic> toJson()  => {
    "id": id,
    "name": userName,
    "email": email
  };
}