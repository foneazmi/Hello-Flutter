part of models;

class HelloResponse {
  final String hello;

  const HelloResponse({
    required this.hello,
  });

  factory HelloResponse.fromJson(Map<String, dynamic> json) {
    return HelloResponse(
      hello: json['hello'],
    );
  }
}
