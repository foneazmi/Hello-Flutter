part of pages;

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Init Page'),
      ),
      body: InitScreen(),
    );
  }
}
