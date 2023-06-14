abstract class UseCase<Response, Request> {
  Future<Response> call(Request params);
}

class NoRequestParams {}
