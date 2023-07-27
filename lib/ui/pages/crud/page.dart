part of pages;

class CrudPage extends StatelessWidget {
  const CrudPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Page'),
      ),
      body: const CrudScreen(),
    );
  }
}
