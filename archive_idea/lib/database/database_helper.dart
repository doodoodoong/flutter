import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../data/idea_info.dart';

class DatabaseHelper {
  late Database database;

  Future<void> initDatabase() async {
    String path = join(await getDatabasesPath(), 'archive_idea');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE IF NOT EXISTS tb_idea(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            motive TEXT,
            content TEXT,
            priority INTEGER,
            feedback TEXT,
            createdAt INTEGER
        )
        ''');
      },
    );
  }

  Future<int> insertIdeaInfo(IdeaInfo idea) async {
    return await database.insert('tb_idea', idea.toMap());
  }

  Future<List<IdeaInfo>> getAllIdeaInfo() async {
    final List<Map<String, dynamic>> result = await database.query('tb_idea');
    return List.generate(
      result.length,
      (index) {
        return IdeaInfo.fromMap(result[index]);
      },
    );
  }

  Future<int> updateIdeaInfo(IdeaInfo idea) async {
    return await database.update(
      'tb_idea',
      idea.toMap(),
      where: 'id = ?',
      whereArgs: [idea.id],
    );
  }

  Future<int> deleteIdeaInfo(int id) async {
    return await database.delete(
      'tb_idea',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> closeDatabase() async {
    await database.close();
  }
}
