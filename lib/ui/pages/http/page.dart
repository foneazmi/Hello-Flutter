part of pages;

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  late Future hello;

  final data = Get.put(HttpController());

  @override
  void initState() {
    super.initState();
    //? already called when init HttpController
    // data.hello();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Page'),
      ),
      body: Center(
        child: Obx(
          () {
            if (data.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (data.isError.value.isNotEmpty) {
              return Center(
                child: Text(data.isError.value),
              );
            } else {
              return Center(
                child: Text(data.result.value),
              );
            }
          },
        ),
      ),
    );
  }
}
