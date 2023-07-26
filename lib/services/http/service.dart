part of services;

class HttpService extends GetConnect {
  Future<Response> getHello() => get('https://api.khan.my.id/');
}
