import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Counter1 extends ChangeNotifier{
  late int value;

  Counter1({required this.value});

  void inCrease(){
    value += 1;
  }
}

class Counter2 extends ChangeNotifier{
  late int value;

  Counter2({required this.value});

  void inCrease(){
    value -= 1;
  }
}

class DemoMultipleProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Multiple Provider"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Child1Widget(),
            Child2Widget()
          ],
        ),
      ),
    );
  }
}

class Child1Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Counter 1 = 0", style: TextStyle(fontSize: 20)),
          ElevatedButton(onPressed: (){}, child: Text("InCrease"))
        ],
      ),
    );
  }
}

class Child2Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Counter 2 = 0" , style: TextStyle(fontSize: 20)),
          ElevatedButton(onPressed: (){}, child: Text("DeCrease"))
        ],
      ),
    );
  }
}



