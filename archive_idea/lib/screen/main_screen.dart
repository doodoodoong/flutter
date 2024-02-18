import 'package:archive_idea/data/idea_info.dart';
import 'package:archive_idea/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<IdeaInfo> listIdeaInfo = [];
  var dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();

    getIdeaInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Archive Idea',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: listIdeaInfo.length,
          itemBuilder: (context, index) {
            return listItem(index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff7f52fd).withOpacity(0.7),
        child: Image.asset(
          'assets/light-bulb.png',
          width: 48,
          height: 48,
        ),
      ),
    );
  }

  Widget listItem(int index) {
    return Container(
      height: 82,
      margin: const EdgeInsets.only(top: 16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xffd9d9d9), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              listIdeaInfo[index].title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 16, bottom: 8),
              child: Text(
                DateFormat("yyyy.MM.dd.HH:mm").format(
                  DateTime.fromMillisecondsSinceEpoch(
                      listIdeaInfo[index].createdAt),
                ),
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xffaeaeae),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 16, bottom: 8),
              child: RatingBar.builder(
                initialRating: listIdeaInfo[index].priority.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                itemSize: 16,
                itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                ignoreGestures: true,
                updateOnDrag: false,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getIdeaInfo() async {
    await dbHelper.initDatabase();
    listIdeaInfo = await dbHelper.getAllIdeaInfo();
    listIdeaInfo.sort(
      (a, b) => b.createdAt.compareTo(a.createdAt),
    );
    setState(() {});
  }

  Future setInsertIdeaInfo() async {
    await dbHelper.initDatabase();
    await dbHelper.insertIdeaInfo(
      IdeaInfo(
          title: '#환경 보존 문제해결 앱 아이디어',
          motive: 'ggg',
          content: 'detail',
          createdAt: DateTime.now().millisecondsSinceEpoch,
          feedback: 'Feedback',
          priority: 5),
    );
  }
}
