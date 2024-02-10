import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/sub');
                Navigator.pushNamed(context, '/sub', arguments: 'hello');
              },
              child: const Text('Click to Sub Screen'))
        ],
      ),
    );
  }
}
