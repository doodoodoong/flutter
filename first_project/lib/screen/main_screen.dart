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
      drawer: Drawer(
          child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Header Section'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Main'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Sub'),
            onTap: () {},
          )
        ],
      )),
    );
  }
}
