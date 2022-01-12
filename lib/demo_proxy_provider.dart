class Api{
  late String baseurl;

  Api({required this.baseurl});
}

class Request{
  late Api api;

  Request({required this.api});

  String getData(){
    return "hello";
  }

}

class Repository{

  late Request request;

  Repository({required this.request});

  void handleData(){
    request.getData();
  }

}


void main(){

  Api api = Api(baseurl: "http://abc.com");
  Request request = Request(api: api);

  Repository repository = Repository(request: request);

}