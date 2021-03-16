import 'package:get/get.dart';

import 'ChatController.dart';
import 'LoginController.dart';
import 'LoginScreen.dart';
import 'package:flutter/material.dart';

class ListOfUsersScreen extends StatelessWidget {
  final controller = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: [
            // Expanded(child: ListView.builder(
            //   // itemCount: controller.chatUsers.length,
            //   itemBuilder: (context, index){
            //     // Users user = controller.chatUsers[index];
            //     return ListTile(
            //       leading: Text(controller.chatUsers[index].id.toString()),
            //       title: Text(controller.chatUsers[index].userName),
            //     );
            //   },
            // ),)
          ],
        ),
        ),
    );
  }
}




class ListedUsers {
  static Users users;
  static List<Users> dummyUsers;

  static void initDummyUsers() {
    Users Azeem = Users(
        id: 1, email: "Azeemkalwar51@gmail.com", userName: "Mohammad Azeem");
    Users Manan = Users(id: 2, email: "Manan@gmail.com", userName: "Manan Ali");
    dummyUsers = List();
    dummyUsers.add(Azeem);
    dummyUsers.add(Manan);
  }

  static List<Users> getUserFor(Users users) {// if azeem is logged in then should see massages of Manan and vise versa.
    List<Users> filteredUsers = dummyUsers
        .where((element) => (!element.userName
            .toLowerCase()
            .contains(users.userName.toLowerCase())))
        .toList();
    return filteredUsers;
  }
}
