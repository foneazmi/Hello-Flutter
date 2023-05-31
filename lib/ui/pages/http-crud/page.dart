part of pages;

class HttpCrudPageRoute extends StatefulWidget {
  const HttpCrudPageRoute({super.key});

  @override
  State<HttpCrudPageRoute> createState() => _HttpCrudPageRouteState();
}

class _HttpCrudPageRouteState extends State<HttpCrudPageRoute> {
  NoteCubit noteCubit = NoteCubit();

  @override
  void initState() {
    noteCubit.getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HttpCrud Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push('/http-crud/add'),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => noteCubit,
          child: BlocListener<NoteCubit, NoteState>(
            listener: (context, state) {
              print(state);
              if (state is ErrorNoteState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              } else if (state is SuccessSubmitNoteState) {
                noteCubit.getAllNotes();
              }
            },
            child: BlocBuilder<NoteCubit, NoteState>(
              builder: (context, state) {
                if (state is LoadingNoteState) {
                  return _buildLoading();
                } else if (state is SuccessLoadAllNoteState) {
                  return _buildCard(state.notes);
                } else if (state is ErrorNoteState) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildCard(List<Note> notes) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          Note note = notes[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      note.title,
                    ),
                    Text(note.content),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            noteCubit.deleteNote(notes[index].id);
                          },
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
