part of screens;

class HttpScreen extends StatefulWidget {
  const HttpScreen({super.key});

  @override
  State<HttpScreen> createState() => _HttpPageScreen();
}

class _HttpPageScreen extends State<HttpScreen> {
  final data = Get.put(HttpController());

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
