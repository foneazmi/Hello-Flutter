part of screens;

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Column(
              children: [
                Text("just and ordinary text"),
                Text(
                  "Text with style Bold",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Text with red color",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Text(
                  "Text with red color and bold",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Text with red color, italic, and bold",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "Text with size 20, with height 2",
                  style: TextStyle(
                    fontSize: 20.0,
                    height: 2,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text("More Style Text"),
                Text(
                  'Greetings, planet!',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = ui.Gradient.linear(
                          const Offset(0, 20),
                          const Offset(150, 20),
                          <Color>[
                            Colors.red,
                            Colors.yellow,
                          ],
                        )),
                ),
                RichText(
                  text: const TextSpan(
                    text: "Don't tax the South ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'cuz',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationStyle: TextDecorationStyle.wavy,
                        ),
                      ),
                      TextSpan(
                        text: ' we got it made in the shade',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    // style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: "You don't have the votes.\n",
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                      TextSpan(
                        text: "You don't have the votes!\n",
                        style: TextStyle(color: Colors.black.withOpacity(0.8)),
                      ),
                      TextSpan(
                        text:
                            "You're gonna need congressional approval and you don't have the votes!\n",
                        style: TextStyle(color: Colors.black.withOpacity(1.0)),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
