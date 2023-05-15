part of pages;

class HttpCrudPageRoute extends StatefulWidget {
  const HttpCrudPageRoute({super.key});

  @override
  State<HttpCrudPageRoute> createState() => _HttpCrudPageRouteState();
}

class _HttpCrudPageRouteState extends State<HttpCrudPageRoute> {
  late Future<List<Note>> notes;

  @override
  void initState() {
    super.initState();
    notes = PBKhanService().getNotes();
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
        child: FutureBuilder<List<Note>>(
          future: notes,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return _buildListView(snapshot.data!);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}",
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildListView(List<Note> notes) {
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
                    // Text(note.created),
                    // Text(note.updated),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {},
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
