part of pages;

class BottomNavBarPageRoute extends StatefulWidget {
  const BottomNavBarPageRoute({super.key});
  @override
  State<BottomNavBarPageRoute> createState() => _BottomNavBarPageRouteState();
}

class _BottomNavBarPageRouteState extends State<BottomNavBarPageRoute> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: const Text('Bottom Nav Bar'),
      // ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
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
