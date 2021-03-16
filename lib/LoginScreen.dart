import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket/HomePage.dart';
import 'package:socket/ListedUsers.dart';
import 'package:socket/LoginController.dart';

class LoginScreen extends StatelessWidget {

  final loginController = Get.put(LoginController());
  TextEditingController userName = new TextEditingController();
  Color customGreen = new Color(0xff24B58F);
  Users loggedUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 240,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 50,
                child: TextField(
                  controller: userName,
                  decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 25, left: 30),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email or Name",
                      hintStyle: TextStyle(color: customGreen),
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: customGreen, width: 1),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: customGreen, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: double.maxFinite,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    loginController.login(userName.text);
                  },
                  color: customGreen,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}


