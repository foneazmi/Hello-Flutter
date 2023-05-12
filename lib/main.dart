import 'package:flutter/material.dart';
import 'package:hello/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        // colorSchemeSeed: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Flutter"),
        ),
        body: ListViewHome(),
      ),
    );
  }
}

class Menu {
  final String title;
  final String subtitle;
  final Widget page;
  Menu(this.title, this.subtitle, this.page);
}

class ListViewHome extends StatelessWidget {
  //? Add here if there new menu
  final listMenu = [
    Menu("Init", "Just a new page", const InitPageRoute()),
    Menu("Text", "playing with text", const TextPageRoute()),
    Menu("Container", "playing with container", const ContainerPageRoute()),
    Menu("State", "playing with State", const StatePageRoute()),
    Menu("Bottom Nav Bar", "Material You 3 Bottom Nav Bar",
        const BottomNavBarPageRoute()),
  ];

  ListViewHome({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listMenu.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => listMenu[index].page),
              );
            },
            title: Text(listMenu[index].title),
            subtitle: Text(listMenu[index].subtitle),
            trailing: const Icon(Icons.arrow_right_rounded),
          ),
        );
      },
    );
  }
}
