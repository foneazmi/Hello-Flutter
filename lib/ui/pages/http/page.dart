part of pages;

class HttpPageRoute extends StatefulWidget {
  const HttpPageRoute({super.key});

  @override
  State<HttpPageRoute> createState() => _HttpPageRouteState();
}

class _HttpPageRouteState extends State<HttpPageRoute> {
  late Future<HelloResponse> hello;

  @override
  void initState() {
    super.initState();
    hello = HttpService().getHello();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Page'),
      ),
      body: Center(
        child: FutureBuilder<HelloResponse>(
          future: hello,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.hello);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
