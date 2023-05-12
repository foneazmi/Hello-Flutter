part of pages;

class StatePageRoute extends StatefulWidget {
  const StatePageRoute({Key? key}) : super(key: key);

  @override
  State<StatePageRoute> createState() => _StatePageRouteState();
}

class _StatePageRouteState extends State<StatePageRoute> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Number $number'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number = number - 1;
                    });
                  },
                  child: const Text('-'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number = number + 1;
                    });
                  },
                  child: const Text('+'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
