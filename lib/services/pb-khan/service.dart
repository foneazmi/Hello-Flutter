part of services;

class PBKhanService {
  final String baseUrl = "http://pb.khan.my.id";

  // Future<List<Profile>> getProfiles() async {
  //   final response = await client.get("$baseUrl/api/profile");
  //   if (response.statusCode == 200) {
  //     return profileFromJson(response.body);
  //   } else {
  //     return null;
  //   }
  // }

  Future<HelloResponse> getNotes() async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/collections/notes/records'));
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
