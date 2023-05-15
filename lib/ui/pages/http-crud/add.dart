part of pages;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class HttpCrudAddPageRoute extends StatefulWidget {
  const HttpCrudAddPageRoute({super.key});

  @override
  State<HttpCrudAddPageRoute> createState() => _HttpCrudAddPageRouteState();
}

class _HttpCrudAddPageRouteState extends State<HttpCrudAddPageRoute> {
  bool _isLoading = false;
  PBKhanService pbKhanService = PBKhanService();
  bool _isFieldNameValid = true;
  bool _isFieldEmailValid = true;
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: const Text('Template Page'),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldTitle(),
                _buildTextFieldContent(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      String content = _controllerTitle.text.toString();
                      String title = _controllerContent.text.toString();
                      if (!content.isNotEmpty || !title.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all field"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                      var body = <String, dynamic>{
                        "title": title,
                        "content": content
                      };
                      try {
                        pbKhanService.addNote(body).then((ok) {
                          if (ok) {
                            context.pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Submit data failed"),
                              ),
                            );
                          }
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Submit data failed"),
                          ),
                        );
                      } finally {
                        setState(() => _isLoading = false);
                      }
                    },
                    child: Text("Submit".toUpperCase()),
                  ),
                )
              ],
            ),
          ),
          _isLoading
              ? const Stack(
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldTitle() {
    return TextField(
      controller: _controllerTitle,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Title",
        errorText: _isFieldNameValid ? null : "Full name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNameValid) {
          setState(() => _isFieldNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldContent() {
    return TextField(
      controller: _controllerContent,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Content",
        errorText: _isFieldEmailValid ? null : "Email is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldEmailValid) {
          setState(() => _isFieldEmailValid = isFieldValid);
        }
      },
    );
  }
}
