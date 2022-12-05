import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var titleSection = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Oeschinen Lake Campground',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: <Widget>[Icon(Icons.star, color: Colors.red), Text('41')],
          )
        ],
      ),
    );
    var buttonSection = Row(
      children: <Widget>[
        Column(
          children: <Widget>[Icon(Icons.call), Text('CALL')],
        ),
        Column(
          children: <Widget>[Icon(Icons.navigation), Text('ROUTE')],
        ),
        Column(
          children: <Widget>[Icon(Icons.share), Text('SHARE')],
        )
      ],
    );
    var textSection = Container(
      child: Row(
        children: <Widget>[Text('카리나 존나 이쁘네 ㅋㅋㅋㅋㅋ')],
      ),
    );
    return Scaffold(
        body: Column(
      children: <Widget>[
        Image.network(
            'https://www.allkpop.com/upload/2022/02/content/181550/web_data/allkpop_1645217742_untitled-1.jpg'),
        titleSection,
        buttonSection,
        textSection
      ],
    ));
  }
}
