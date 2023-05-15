part of models;

// class HelloResponse {
//   final String hello;

//   const HelloResponse({
//     required this.hello,
//   });

//   factory HelloResponse.fromJson(Map<String, dynamic> json) {
//     return HelloResponse(
//       hello: json['hello'],
//     );
//   }
// }

class Note {
  int id;
  String title;
  String content;
  String created;
  String content;

  Note(
      {this.id = 0,
      required this.name,
      required this.email,
      required this.age});

  factory Note.fromJson(Map<String, dynamic> map) {
    return Note(
        id: map["id"], name: map["name"], email: map["email"], age: map["age"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "age": age};
  }

  @override
  String toString() {
    return 'Note{id: $id, name: $name, email: $email, age: $age}';
  }
}

List<Note> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Note>.from(data.map((item) => Note.fromJson(item)));
}

String profileToJson(Note data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
