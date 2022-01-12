import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DemoBasicProvider extends StatefulWidget {

  @override
  _DemoBasicProviderState createState() => _DemoBasicProviderState();
}

class _DemoBasicProviderState extends State<DemoBasicProvider> {

  String text = "Phat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Basic Provider"),
      ),
      body: Container(
        child: Provider.value(
          value: text,
          child: Column(
            children: [
              Child1Widget(),
              Child2Widget(),
            ],
          ),
        ),
      ),
    );
  }
}


class Child1Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String text = Provider.of(context);
    return Container(
      child: Text(text),
    );
  }
}

class Child2Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<String>(
          builder: (context , text , child){
            return Text(text);
          }
      ),
    );
  }
}



