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
          title: Text('Flutter My Appbar'),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text('elevatedbutton')),
            OutlinedButton(onPressed: () {}, child: Text('outlineddbutton')),
            TextButton(onPressed: () {}, child: Text('textbutton')),
            GestureDetector(onTap: () {}, child: Text('gesturedetector')),
          ],
        ));
  }
}
