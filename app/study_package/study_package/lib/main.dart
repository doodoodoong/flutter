import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:study_package/page/home_page.dart';
import 'package:study_package/page/image_page.dart';
import 'package:study_package/page/user_list_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await _initHive();
  runApp(const MyApp());
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  await Hive.openBox('darkModeBox');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('darkModeBox').listenable(keys: ['darkMode']),
      builder: (context, box, widget) {
        final darkMode = box.get('darkMode', defaultValue: false);
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            home: const UserListPage());
      },
    );
  }
}
