// import 'package:flutter/material.dart';

part of pages;

class StatePageRoute extends StatefulWidget {
  const StatePageRoute({Key? key}) : super(key: key);

  @override
  State<StatePageRoute> createState() => _StatePageRouteState();
}

class _StatePageRouteState extends State<StatePageRoute> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Number"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
