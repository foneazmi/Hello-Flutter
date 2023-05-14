part of pages;

class Transition {
  final String title;
  final String subtitle;
  final Widget page;
  Transition(this.title, this.subtitle, this.page);
}

class SubTransitionPageRoute extends StatelessWidget {
  final String title;
  const SubTransitionPageRoute({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page $title'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pop();
            });
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class TransitionPageRoute extends StatelessWidget {
  final listTransition = [
    Transition(
      "ScaleRotateRoute",
      "",
      const SubTransitionPageRoute(title: 'ScaleRotateRoute'),
    ),
  ];

  TransitionPageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transition Page'),
      ),
      body: ListView.builder(
        itemCount: listTransition.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => listTransition[index].page,
                    transitionDuration: const Duration(seconds: 2),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              },
              title: Text(listTransition[index].title),
              subtitle: Text(listTransition[index].subtitle),
              trailing: const Icon(Icons.arrow_right_rounded),
            ),
          );
        },
      ),
    );
  }
}
