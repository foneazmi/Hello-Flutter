part of blocs;

abstract class NoteState {}

class InitialNoteState extends NoteState {}

class LoadingNoteState extends NoteState {}

class SuccessSubmitNoteState extends NoteState {}

class ErrorNoteState extends NoteState {
  final String errorMessage;
  ErrorNoteState(this.errorMessage);

  @override
  String toString() {
    return 'ErrorNoteState{errorMessage: $errorMessage}';
  }
}

class SuccessLoadAllNoteState extends NoteState {
  final List<Note> notes;

  SuccessLoadAllNoteState(this.notes);
  @override
  String toString() {
    return 'SuccessLoadAllNoteState{notes: $notes}';
  }
}
