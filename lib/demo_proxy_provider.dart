import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Counter extends ChangeNotifier{
  late int value;
  late String text;

  Counter({required this.value});


  void increase(){
    value += 1;
    notifyListeners();
  }

  void decrease(){
    value -= 1;
    notifyListeners();
  }

}

class Request{
  late Counter counter;

  void updateCounter(Counter counter){
    this.counter = counter;
  }
}

class Repository{
  late Request request;

  void updateRequest(Request request){
    this.request = request;
  }

}


class DemoProxyProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Proxy Provider"),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Counter(value: 0)),
          ProxyProvider<Counter,Request>(
            create: (context) => Request(),
            update: (context,counter,requestPrevious){
              requestPrevious = Request()..updateCounter(counter);
              return requestPrevious;
            },
          ),
          ProxyProvider<Request,Repository>(
              create: (context) => Repository(),
              update: (context , request , repository){
                repository = Repository()..updateRequest(request);
                return repository;
              },
          )
        ],
        child: Consumer<Repository>(
          builder: (context , repository , child){
            return Container(
              constraints: BoxConstraints.expand(),
              child: Column(
                children: [
                  Text(repository.request.counter.value.toString()),
                  ElevatedButton(
                      onPressed: (){
                        repository.request.counter.increase();
                      },
                      child: Text("+")
                  ),
                  ElevatedButton(
                      onPressed: (){
                        repository.request.counter.decrease();
                      },
                      child: Text("-")
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
