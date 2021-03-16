import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomePage extends StatelessWidget {
  final channel = IOWebSocketChannel.connect(Uri.parse("ws://echo.websocket.org"));
  TextEditingController masg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                return Text("${snapshot.hasData ? snapshot.data : ''}");
              },
            ),
            Center(child: textField(masg, "")),
            FlatButton(
                color: Colors.blue,
                onPressed: () {
                  channel.sink.add(masg.text);
                },
                child: Text(
                  "Send",
                  style: TextStyle(color: Colors.white),
                )),
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
            suffixIcon: Icon(Icons.send, color: Colors.blue,),
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
