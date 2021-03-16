import 'package:flutter/material.dart';
import 'package:socket/HomePage.dart';
import 'package:get/get.dart';

void main() => runApp(Socket());

class Socket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyApp(),
    );
  }
}
