import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
  late int value;

  Counter({required this.value});

  void inCreaseCount() {
    value += 1;
    notifyListeners();
  }
}

class DemoChangeNotifier extends StatefulWidget {
  @override
  _DemoChangeNotifierState createState() => _DemoChangeNotifierState();
}

class _DemoChangeNotifierState extends State<DemoChangeNotifier> {
  @override
  Widget build(BuildContext context) {
    print("Build Parent");
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Basic Provider"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: ChangeNotifierProvider<Counter>(
          create: (context) => Counter(value: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [TextWidget(), ButtonWidget()],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(builder: (context, counter, child) {
      return Text(counter.value.toString());
    });
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of(context);
    return ElevatedButton(
        onPressed: () {
          counter.inCreaseCount();
        },
        child: Text("Increase"));
  }
}
