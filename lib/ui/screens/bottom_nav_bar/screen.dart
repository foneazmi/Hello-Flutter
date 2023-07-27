part of screens;

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Back!'),
        ),
    );
  }
}
