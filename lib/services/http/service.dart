part of services;

class HttpService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.khan.my.id';
    httpClient.defaultContentType = "json";
    httpClient.timeout = const Duration(seconds: 30);
    super.onInit();
  }

  Future<HttpModel> hello() async {
    var res = await get("/");
    if (res.statusCode! < 205) {
      return HttpModel.fromJson(res.body);
    } else {
      throw "Error Occurred";
    }
  }
}
