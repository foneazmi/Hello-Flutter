part of 'widgets.dart';

class ScreenIconWidget extends StatelessWidget {
  final ScreenData data;

  const ScreenIconWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(data.path);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(data.icon),
            Text(data.name),
          ],
        ),
      ),
    );
  }
}
