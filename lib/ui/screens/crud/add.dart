part of screens;

class CrudAddScreen extends StatefulWidget {
  const CrudAddScreen({super.key});
  @override
  State<CrudAddScreen> createState() => _CrudAddScreenState();
}

class _CrudAddScreenState extends State<CrudAddScreen> {
  final data = Get.put(CrudController());

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void> submitData() async {
    try {
      if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
        return;
      }
      final body = <String, dynamic>{
        "title": titleController.text,
        "description": descriptionController.text
      };
      await data.createData(body);
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: TextField(
            controller: titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a title',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a description',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50), // NEW
            ),
            onPressed: submitData,
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }
}
