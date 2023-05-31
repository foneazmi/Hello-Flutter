part of blocs;

class NoteCubit extends Cubit<NoteState> {
  // final DioHelper dioHelper;
  final HttpCrudRepository httpCrudRepository = HttpCrudRepository();

  NoteCubit() : super(InitialNoteState());

  void getAllNotes() async {
    emit(LoadingNoteState());
    try {
      var result = await httpCrudRepository.getNotes();
      emit(SuccessLoadAllNoteState(result));
    } on Error {
      emit(ErrorNoteState("Failed to fetch data. is your device online?"));
    }
  }

  void addNote(note) async {
    emit(LoadingNoteState());
    try {
      var result = await httpCrudRepository.addNote(note);
      if (result) {
        emit(SuccessSubmitNoteState());
        getAllNotes();
      } else {
        emit(ErrorNoteState("Failed to add data"));
      }
    } on Error {
      emit(ErrorNoteState("Failed to add data"));
    }
  }

  // void editNote(Note note) async {
  //   emit(LoadingNoteState());
  //   var result = await httpCrudRepository.editNote(note);
  //   result.fold(
  //     (errorMessage) => emit(FailureSubmitNoteState(errorMessage)),
  //     (_) => emit(SuccessSubmitNoteState()),
  //   );
  // }

  void deleteNote(id) async {
    emit(LoadingNoteState());
    try {
      var result = await httpCrudRepository.deleteNote(id);
      if (result) {
        getAllNotes();
      } else {
        emit(ErrorNoteState("Failed to delete data"));
      }
    } on Error {
      emit(ErrorNoteState("Failed to delete data"));
    }
  }
}
