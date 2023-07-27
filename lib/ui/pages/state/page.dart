part of pages;

class StatePage extends StatelessWidget {
  const StatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Page'),
      ),
      body: const StateScreen(),
    );
  }
}
