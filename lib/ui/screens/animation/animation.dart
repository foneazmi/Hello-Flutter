part of '../screens.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Hello, World!'),
      ),
      body: Center(
        child: Text('Template Screen!'),
      ),
    );
  }
}
