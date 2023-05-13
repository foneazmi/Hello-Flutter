part of pages;

class Transition {
  final String title;
  final String subtitle;
  final PageRouteBuilder page;
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
      "FadeRoute",
      "",
      FadeRoute(page: const SubTransitionPageRoute(title: 'FadeRoute')),
    ),
    Transition(
      "ScaleRotateRoute",
      "",
      ScaleRotateRoute(
          page: const SubTransitionPageRoute(title: 'ScaleRotateRoute')),
    ),
    Transition(
      "SizeRoute",
      "",
      SizeRoute(page: const SubTransitionPageRoute(title: 'SizeRoute')),
    ),
    Transition(
      "RotationRoute",
      "",
      RotationRoute(page: const SubTransitionPageRoute(title: 'RotationRoute')),
    ),
    Transition(
      "ScaleRoute",
      "",
      ScaleRoute(page: const SubTransitionPageRoute(title: 'ScaleRoute')),
    ),
    Transition(
      "SlideRightRoute",
      "",
      SlideRightRoute(
          page: const SubTransitionPageRoute(title: 'SlideRightRoute')),
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
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.push(context, listTransition[index].page);
                });
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
