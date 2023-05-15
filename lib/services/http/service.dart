part of services;

class HttpService {
  Future<HelloResponse> getHello() async {
    final response = await http.get(Uri.parse('https://api.khan.my.id/'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return HelloResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
