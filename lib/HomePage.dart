import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:get/get.dart';

import 'ChatController.dart';

class HomePage extends StatelessWidget {
  final chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Center(child: textField(chatController.msg, "")),
            FlatButton(
                color: Colors.blue,
                onPressed: () {
                  // channel.sink.add(masg.text);
                  chatController.channel.sink.add(chatController.msg.text);
                  chatController.chatList(chatController.msg.text);
                },
                child: Text(
                  "Send",
                  style: TextStyle(color: Colors.white),
                )),
            StreamBuilder(
              stream: chatController.channel.stream,
              builder: (context, snapshot) {
                return Text("${snapshot.hasData ? snapshot.data : ''}");
              },
            ),
           Obx(() =>  Container(
               height: Get.height,
               child: ListView.builder(
                   itemCount: chatController.chat.value.length,
                   itemBuilder: (context, index){
                     return Padding(
                         padding: const EdgeInsets.symmetric(vertical: 3),
                         child: Container(
                           height: 35,
                           color: Colors.black26,
                           width: 80,
                           child: Padding(
                             padding: const EdgeInsets.only(top: 5, left: 20),
                             child: Text("${chatController.chat.value[index]}", style: TextStyle(color: Colors.black),),
                           ),
                         ));
                   })
           ))
          ],
        ),
      ),
    );
  }

  Widget textField(controller, errorText) {
    return Container(
      height: 40,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: TextFormField(
          controller: controller,
          decoration: new InputDecoration(
              errorText: errorText,
              errorStyle: TextStyle(color: Colors.red),
              hintText: "Enter your massage here...",
              contentPadding: const EdgeInsets.only(bottom: 10, top: 5),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              enabledBorder: new UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 2),
              ),
              focusedBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2)),
              focusedErrorBorder: new UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              )),
        ),
      ),
    );
  }
}
