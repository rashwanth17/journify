// // import 'package:new_journal/data.dart';
// // import 'package:sqflite/sqflite.dart';
// // import 'package:sqflite/sqlite_api.dart';
// // import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Import for FFI support
// //
// // class DbHelper {
// //   static Database? _db;
// //   static final int _version = 1;
// //   static final String _tableName = "data";
// //   static String get tableName => _tableName;
// //
// //   static Future initDb() async {
// //     if (_db != null) return; // Return if already initialized
// //
// //     // Initialize the database
// //     String _path = await getDatabasesPath() + 'data.db';
// //     _db = await openDatabase(
// //       _path,
// //       version: _version,
// //       onCreate: (db, version) {
// //         print("Creating database");
// //         return db.execute(
// //           "CREATE TABLE $_tableName("
// //           "id INTEGER PRIMARY KEY AUTOINCREMENT, "
// //           "title STRING, date STRING, "
// //           "time STRING, mood STRING)",
// //         );
// //       },
// //     );
// //   }
// //
// //   static Future<int> insert(Data? data) async {
// //     print("insert func called");
// //     return await _db?.insert(_tableName, data!.toJson()) ?? 1;
// //   }
// //
// //   static Future<List<Map<String, dynamic>>> query() async {
// //     print("Query function called");
// //     return await _db!.query(_tableName);
// //   }
// //
// //   static Future<List<Map<String, dynamic>>> queryByDate(String date) async {
// //     print("Query by date function called");
// //     return await _db!.query(_tableName, where: "date = ?", whereArgs: [date]);
// //   }
// //
// //   static delete(Data data) async {
// //     return await _db!.delete(_tableName, where: 'id=?', whereArgs: [data.id]);
// //   }
// //
// //   static Future<int> update(String table, Map<String, dynamic> data,
// //       {String? where, List<dynamic>? whereArgs}) async {
// //     final db = await initDb(); // Initialize the database before updating
// //     return await db.update(table, data, where: where, whereArgs: whereArgs);
// //   }
// // }
//
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'data.dart';
//
// class DbHelper {
//   static final DbHelper _instance = DbHelper._internal();
//   static Database? _database;
//
//   DbHelper._internal();
//
//   factory DbHelper() {
//     return _instance;
//   }
//
//   static const String tableName = 'journal';
//
//   static Future<Database> initDb() async {
//     if (_database != null) return _database!;
//     _database = await openDatabase(
//       join(await getDatabasesPath(), 'journal.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, time TEXT, date TEXT, mood INTEGER)',
//         );
//       },
//       version: 1,
//     );
//     return _database!;
//   }
//
//   static Future<int> insert(Data? data) async {
//     final db = await initDb();
//     return await db.insert(tableName, data!.toJson());
//   }
//
//   static Future<List<Map<String, dynamic>>> query() async {
//     final db = await initDb();
//     return await db.query(tableName);
//   }
//
//   static Future<List<Map<String, dynamic>>> queryByDate(String date) async {
//     final db = await initDb();
//     return await db.query(tableName, where: 'date = ?', whereArgs: [date]);
//   }
//
//   static Future<int> delete(Data data) async {
//     final db = await initDb();
//     return await db.delete(tableName, where: 'id = ?', whereArgs: [data.id]);
//   }
// }

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'data.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  DbHelper._internal();

  factory DbHelper() {
    return _instance;
  }

  static const String tableName = 'journal';

  static Future<Database> initDb() async {
    if (_database != null) return _database!;
    _database = await openDatabase(
      join(await getDatabasesPath(), 'journal.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, time TEXT, date TEXT, mood INTEGER)',
        );
      },
      version: 1,
    );
    return _database!;
  }

  static Future<int> insert(Data? data) async {
    final db = await initDb();
    return await db.insert(tableName, data!.toJson());
  }

  static Future<List<Map<String, dynamic>>> query() async {
    final db = await initDb();
    return await db.query(tableName);
  }

  static Future<List<Map<String, dynamic>>> queryByDate(String date) async {
    final db = await initDb();
    return await db.query(tableName, where: 'date = ?', whereArgs: [date]);
  }

  static Future<int> delete(Data data) async {
    final db = await initDb();
    return await db.delete(tableName, where: 'id = ?', whereArgs: [data.id]);
  }

  static Future<int> update(Data data) async {
    final db = await initDb();
    return await db.update(
      tableName,
      data.toJson(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }
}
