part of pages;

class HttpPage extends StatelessWidget {
  const HttpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Page'),
      ),
      body: const HttpScreen(),
    );
  }
}
