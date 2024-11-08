// // import 'package:get/get.dart';
// // import 'package:intl/intl.dart';
// // import 'package:new_journal/data.dart';
// // import 'package:new_journal/db_helper.dart';
// //
// // class Datacontroller extends GetxController {
// //   @override
// //   void onReady() {
// //     super.onReady();
// //   }
// //
// //   var dataList = <Data>[].obs;
// //
// //   Future<int> addData({Data? data}) async {
// //     return await DbHelper.insert(data);
// //   }
// //
// //   // void getData() async {
// //   //   List<Map<String, dynamic>> datas =
// //   //       await DbHelper.query(); // Specify the type here
// //   //   dataList.assignAll(datas.map((data) => Data.fromJson(data)).toList());
// //   // }
// //   Future<void> getData() async {
// //     List<Map<String, dynamic>> datas =
// //         await DbHelper.query(); // Specify the type here
// //     dataList.assignAll(datas.map((data) => Data.fromJson(data)).toList());
// //   }
// //
// //   Future<void> getDataForDate(String date) async {
// //     List<Map<String, dynamic>> datas =
// //         await DbHelper.queryByDate(date); // Fetch data by date
// //     dataList.assignAll(datas.map((data) => Data.fromJson(data)).toList());
// //   }
// //
// //   void delete(Data data) {
// //     var val = DbHelper.delete(data);
// //     print("$val deleted");
// //   }
// //
// //   Future<int> updateData(Data data, int index) async {
// //     final db = await DbHelper.initDb();
// //     final result = await db.update(
// //       DbHelper.tableName,
// //       data.toJson(),
// //       where: 'id =?',
// //       whereArgs: [data.id],
// //     );
// //     print("Updated data in database: $result");
// //     dataList[index] = data; // Update the dataList with the new data
// //     await getDataForDate(DateFormat.yMMMMd().format(
// //         data.date as DateTime)); // Refresh the data list for the specific date
// //     return result;
// //   }
// // }
//
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'data.dart';
// import 'db_helper.dart';
//
// class Datacontroller extends GetxController {
//   @override
//   void onReady() {
//     super.onReady();
//     getData(); // Fetch initial data
//   }
//
//   var dataList = <Data>[].obs;
//
//   Future<int> addData({Data? data}) async {
//     return await DbHelper.insert(data);
//   }
//
//   Future<void> getData() async {
//     List<Map<String, dynamic>> datas = await DbHelper.query();
//     dataList.assignAll(datas.map((data) => Data.fromJson(data)).toList());
//   }
//
//   Future<void> getDataForDate(String date) async {
//     List<Map<String, dynamic>> datas = await DbHelper.queryByDate(date);
//     dataList.assignAll(datas.map((data) => Data.fromJson(data)).toList());
//   }
//
//   void delete(Data data) {
//     var val = DbHelper.delete(data);
//     print("$val deleted");
//   }
//
//   Future<int> updateData(Data data, int index) async {
//     final db = await DbHelper.initDb();
//     final result = await db.update(
//       DbHelper.tableName,
//       data.toJson(),
//       where: 'id =?',
//       whereArgs: [data.id],
//     );
//     print("Updated data in database: $result");
//     dataList[index] = data; // Update the dataList with the new data
//     await getDataForDate(DateFormat.yMMMMd().format(
//         data.date as DateTime)); // Refresh the data list for the specific date
//     return result;
//   }
// }

import 'package:flutter/foundation.dart';
import 'data.dart';
import 'db_helper.dart';

class Datacontroller with ChangeNotifier {
  List<Data> _dataList = [];

  List<Data> get dataList => _dataList;

  Future<void> fetchData() async {
    final data = await DbHelper.query();
    _dataList = data.map((item) => Data.fromJson(item)).toList();
    notifyListeners();
  }

  Future<void> fetchDataByDate(String date) async {
    final data = await DbHelper.queryByDate(date);
    _dataList = data.map((item) => Data.fromJson(item)).toList();
    notifyListeners();
  }

  Future<void> addData({required Data data}) async {
    await DbHelper.insert(data);
    fetchData(); // Refresh the data list
  }

  Future<void> deleteData(Data data) async {
    await DbHelper.delete(data);
    fetchData(); // Refresh the data list
  }

  Future<void> updateData(Data data, int index) async {
    await DbHelper.update(data);
    fetchData(); // Refresh the data list
  }


}
