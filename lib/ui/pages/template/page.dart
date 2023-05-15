part of pages;

class TemplatePageRoute extends StatelessWidget {
  const TemplatePageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template Page'),
      ),
      body: const Center(
        child: Text("Template"),
      ),
    );
  }
}
