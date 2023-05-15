part of pages;

class HttpCrudPageRoute extends StatelessWidget {
  const HttpCrudPageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HttpCrud Page'),
      ),
      body: const Center(
        child: Text("HttpCrud"),
      ),
    );
  }
}
