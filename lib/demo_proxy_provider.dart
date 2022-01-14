class Counter{
  late int value;

  Counter({required this.value});

}

class Request{
  late Counter counter;

  Request({required this.counter});

}

class Repository{
  late Request request;

  Repository({required this.request});

}

