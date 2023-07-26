part of pages;

class StatePage extends StatefulWidget {
  const StatePage({Key? key}) : super(key: key);

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
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
