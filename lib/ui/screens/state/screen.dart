part of screens;

class StateScreen extends StatefulWidget {
  const StateScreen({Key? key}) : super(key: key);

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
