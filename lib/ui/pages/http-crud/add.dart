part of pages;

class HttpCrudAddPageRoute extends StatefulWidget {
  const HttpCrudAddPageRoute({super.key});

  @override
  State<HttpCrudAddPageRoute> createState() => _HttpCrudAddPageRouteState();
}

class _HttpCrudAddPageRouteState extends State<HttpCrudAddPageRoute> {
  NoteCubit noteCubit = NoteCubit();
  final formState = GlobalKey<FormState>();
  final focusNodeButtonSubmit = FocusNode();
  var controllerTitle = TextEditingController();
  var controllerContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: BlocProvider<NoteCubit>(
        create: (_) => noteCubit,
        child: BlocListener<NoteCubit, NoteState>(
          listener: (_, state) {
            if (state is ErrorNoteState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            } else if (state is SuccessSubmitNoteState) {
              context.pop();
            }
          },
          child: Stack(
            children: [
              _buildWidgetForm(),
              _buildWidgetLoading(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetForm() {
    return Form(
      key: formState,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controllerTitle,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) {
                return value == null || value.isEmpty ? 'Enter a title' : null;
              },
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              controller: controllerContent,
              decoration: const InputDecoration(labelText: 'Content'),
              validator: (value) {
                debugPrint('value content: $value');
                return value == null || value.isEmpty ? 'Enter content' : null;
              },
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                focusNode: focusNodeButtonSubmit,
                onPressed: () {
                  focusNodeButtonSubmit.requestFocus();
                  var title = controllerTitle.text.trim();
                  var content = controllerContent.text.trim();
                  var body = <String, dynamic>{
                    "title": title,
                    "content": content
                  };
                  noteCubit.addNote(body);
                },
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetLoading() {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (_, state) {
        if (state is LoadingNoteState) {
          return Container(
            color: Colors.black.withOpacity(.5),
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
