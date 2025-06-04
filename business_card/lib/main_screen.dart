import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController introduceController = TextEditingController();
  bool isEditMode = false;
  @override
  void initState() {
    super.initState();
    getIntroduceData();
  }

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  child: const Text(
                    'Introduce Myself',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (isEditMode == false) {
                      setState(() {
                        isEditMode = true;
                      });
                    } else {
                      if (introduceController.text.isEmpty) {
                        const snackBar = SnackBar(
                          content: Text('Introduce input empty'),
                          duration: Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }
                      final sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setString(
                          'introduce', introduceController.text);

                      setState(() {
                        isEditMode = false;
                      });
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16, top: 16),
                    child: Icon(
                      Icons.mode_edit,
                      color:
                          isEditMode == true ? Colors.blueAccent : Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                enabled: isEditMode,
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

  Future<void> getIntroduceData() async {
    final sharedPref = await SharedPreferences.getInstance();
    String? introduceMsg = sharedPref.getString('introduce');
    introduceController.text = introduceMsg ?? "";
  }
}
