import 'package:fastcampus_study/page/MyHomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(backgroundColor: Colors.orange.shade100)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
