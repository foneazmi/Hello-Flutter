part of pages;

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template Page'),
      ),
      body: const TemplateScreen(),
    );
  }
}
