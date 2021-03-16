import 'package:flutter/material.dart';
import 'package:socket/HomePage.dart';
import 'package:get/get.dart';
import 'package:socket/ListUserController.dart';
import 'package:socket/LoginScreen.dart';

import 'HomePage.dart';

void main() => runApp(Socket());

class Socket extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
