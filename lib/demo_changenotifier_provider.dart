import 'package:flutter/material.dart';

class DemoChangeNotifier extends StatefulWidget {

  @override
  _DemoChangeNotifierState createState() => _DemoChangeNotifierState();
}

class _DemoChangeNotifierState extends State<DemoChangeNotifier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Basic Provider"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(),
            ButtonWidget()
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}


class ButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){

        },
        child: Text("Increase")
    );
  }
}


