import 'package:sqflite/sqflite.dart';

class LocalDataSource {
  static late Database _database;

  Future<void> init() async {
    try {
      _database = await openDatabase(
        "todoTasks.db",
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
              "create table tasks (id INTEGER PRIMARY KEY,title TEXT,time TEXT,date TEXT,status TEXT)");
        },
        onOpen: (db) {},
      );
    } catch (e) {
      rethrow;
    }
  }

  //==> insert into database

  Future<void> insertIntoDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await _database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO tasks (title,time,date,status) VALUES ('$title','$time','$date','new')");
    }).then((value) {});
  }

  //==> get data from database

  Future<List<Map<String, dynamic>>> getData() async {
    final res = await _database.rawQuery("SELECT * FROM tasks");
    return res;
  }

  //==> update data in database
  Future<void> updateDatabase({required String status, required int id}) async {
    _database
        .rawUpdate("UPDATE tasks SET status=? WHERE id=?", [status, '$id']);
  }

  //==> delete from database
  Future<void> deleteDatabase({required int id}) async {
    _database.rawDelete("DELETE FROM tasks  WHERE id=?", ['$id']);
  }
}