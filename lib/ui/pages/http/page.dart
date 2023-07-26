part of pages;

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  late Future hello;

  @override
  void initState() {
    super.initState();
    // hello = HttpService().getHello();
    // print(hello);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Page'),
      ),
      body: Center(
          // child: FutureBuilder(
          //   future: hello,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Text(snapshot.data!.hello);
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }
          //     return const CircularProgressIndicator();
          //   },
          // ),
          ),
    );
  }
}
