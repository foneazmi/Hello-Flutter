part of pages;

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});
  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Back!'),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: page,
        onDestinationSelected: (int index) {
          setState(() {
            page = index;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Learn',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.engineering),
            icon: Icon(Icons.engineering_outlined),
            label: 'Relearn',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Unlearn',
          ),
        ],
      ),
    );
  }
}
