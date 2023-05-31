part of repositories;

class HttpCrudRepository {
  final _provider = PBKhanService();

  Future<List<Note>> getNotes() {
    return _provider.getNotes();
  }

  Future<bool> deleteNote(id) {
    return _provider.deleteNote(id);
  }

  Future<bool> addNote(body) {
    return _provider.addNote(body);
  }
}
