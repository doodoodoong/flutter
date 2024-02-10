import 'package:flutter/material.dart';

class SubScreen extends StatelessWidget {
  String msg;
  SubScreen({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub Screen'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Sub Screen $msg'),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go to back'))
        ],
      ),
    );
  }
}
