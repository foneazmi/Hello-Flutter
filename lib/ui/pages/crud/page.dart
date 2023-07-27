part of pages;

class CrudPage extends StatelessWidget {
  const CrudPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Page'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/crud/add');
              },
              child: const Icon(
                Icons.add,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: const CrudScreen(),
    );
  }
}

class CrudAddPage extends StatelessWidget {
  const CrudAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Add Page'),
      ),
      body: const CrudAddScreen(),
    );
  }
}

class CrudEditPage extends StatelessWidget {
  const CrudEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Edit Page'),
      ),
      body: const CrudEditScreen(),
    );
  }
}
