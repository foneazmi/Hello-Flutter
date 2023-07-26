part of services;

class PocketBaseService {
  final String baseUrl = "https://pb.khan.my.id";
  Future<List<Note>> getNotes() async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/collections/notes/records'));
    if (response.statusCode == 200) {
      return notesFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<bool> addNote(data) async {
    var body = jsonEncode(data);
    final response = await http.post(
      Uri.parse('$baseUrl/api/collections/notes/records'),
      headers: {"content-type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteNote(id) async {
    final response = await http
        .delete(Uri.parse('$baseUrl/api/collections/notes/records/$id'));
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}
