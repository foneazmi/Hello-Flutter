part of '../screens.dart';

final List<ScreenData> screenList = [
  ScreenData(
    name: "Styling",
    path: "/styling",
    icon: Icons.style,
  ),
  ScreenData(
    name: "Animation",
    path: "/animation",
    icon: Icons.animation,
  ),
  // Add more items as needed
];

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of columns
        ),
        itemCount: screenList.length, // Number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          return ScreenIconWidget(data: screenList[index]);
        },
      ),
    );
  }
}
