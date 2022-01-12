import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter1 extends ChangeNotifier{
  late int value;

  Counter1({required this.value});

  void inCrease(){
    value += 1;
    notifyListeners();
  }
}

class Counter2 extends ChangeNotifier{
  late int value;

  Counter2({required this.value});

  void deCrease(){
    value -= 1;
    notifyListeners();
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
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => Counter1(value: 0),
            ),
            ChangeNotifierProvider(
              create: (context) => Counter2(value: 0),
            )
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Child1Widget(),
              Child2Widget()
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
    return Container(
      child: Consumer<Counter1>(
        builder: (context , counter1 , child){
          return Column(
            children: [
              Text("Counter 1 = ${counter1.value}", style: TextStyle(fontSize: 20)),
              ElevatedButton(onPressed: (){
                counter1.inCrease();
              }, child: Text("InCrease"))
            ],
          );
        },
      ),
    );
  }
}

class Child2Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<Counter2>(
        builder: (context , counter2 , child){
          return Column(
            children: [
              Text("Counter 2 = ${counter2.value}", style: TextStyle(fontSize: 20)),
              ElevatedButton(onPressed: (){
                counter2.deCrease();
              }, child: Text("InCrease"))
            ],
          );
        },
      ),
    );
  }
}



