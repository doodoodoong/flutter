import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter My Appbar'),
        ),
        body: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                  disabledForegroundColor: Colors.purple.withOpacity(0.38),
                  disabledBackgroundColor: Colors.purple.withOpacity(0.12)),
              child: const Text(
                'elevatedbutton',
              ),
            ),
            GestureDetector(
                onTap: () {
                  print('gesturedetector');
                },
                child: Container(
                  color: Colors.yellow,
                  height: 100,
                )),
          ],
        ));
  }
}
