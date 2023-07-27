part of screens;

class CrudScreen extends StatefulWidget {
  const CrudScreen({super.key});

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  final data = Get.put(CrudController());

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
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListView.builder(
                itemCount: data.result.length,
                itemBuilder: (context, index) {
                  final note = data.result[index].toString();
                  final parsedJson = jsonDecode(note);
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('${parsedJson["title"]}'),
                            Text('${parsedJson["description"]}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    data.delete('${parsedJson["id"]}');
                                  },
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
