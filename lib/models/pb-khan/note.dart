part of models;

class Note {
  final String id;
  final String title;
  final String content;
  final String created;
  final String updated;

  const Note({
    required this.id,
    required this.title,
    required this.content,
    required this.created,
    required this.updated,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      created: json['created'],
      updated: json['updated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "created": created,
      "updated": updated
    };
  }

  @override
  String toString() {
    return 'Note{id: $id, title: $title, content: $content, created: $created}, updated: $updated}';
  }
}

List<Note> notesFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Note>.from(data['items'].map((item) => Note.fromJson(item)));
}

String notesToJson(Note data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
