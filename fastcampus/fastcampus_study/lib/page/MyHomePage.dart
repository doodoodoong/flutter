import 'package:fastcampus_study/page/page2.dart';
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
        title: const Text('Flutter Appbar'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Hello',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Page2(),
                    ));
              },
              child: Text('Go to 2!'))
        ],
      ),
    );
  }
}
