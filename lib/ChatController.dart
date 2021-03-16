import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socket/ListedUsers.dart';
import 'package:socket/LoginScreen.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'LoginController.dart';

class ChatController extends GetxController{

  TextEditingController msg;
  WebSocketChannel channel;

  RxList chat = [].obs;

  chatList(String masg){
    chat.value.add(msg.text);
    print(chat.value);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    msg = TextEditingController();
    channel = IOWebSocketChannel.connect(Uri.parse("ws://echo.websocket.org"));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    channel.sink.close();
  }
}