import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController introduceController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Introduce Me',
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.accessibility_new,
          color: Colors.black,
          size: 32,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              height: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/IMG_5635.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('Kim')
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Age',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('38')
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Hobby',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('Game')
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Job',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('Teacher')
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Study',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('Gwangju teaching university ')
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'MBTI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('ISTJ')
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 16),
              child: const Text(
                'Introduce Myself',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffd9d9d9),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: introduceController,
                maxLines: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
