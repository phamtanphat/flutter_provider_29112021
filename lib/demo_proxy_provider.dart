import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Counter{
  late int value;

  Counter({required this.value});

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
          Provider(create: (context) => Counter(value: 10)),
          ProxyProvider<Counter,Request>(
            create: (context) => Request(),
            update: (context,counter,request){
              request!.updateCounter(counter);
              return request;
            },
          ),
          ProxyProvider<Request,Repository>(
              create: (context) => Repository(),
              update: (context , request , repository){
                repository!.updateRequest(request);
                return repository;
              }
          )
        ],
        child: Consumer<Repository>(
          builder: (context , repository , child){
            return Container(
              constraints: BoxConstraints.expand(),
              child: Center(
                child: Text(repository.request.counter.value.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
