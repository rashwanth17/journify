// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:new_journal/db_helper.dart';
// import 'package:provider/provider.dart';
// import 'themeservice.dart';
// import 'home.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await DbHelper.initDb();
//   await GetStorage.init();
//
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeProvider>(
//       builder: (context, themeProvider, child) {
//         return GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Flutter Demo',
//           theme: themeProvider.themeData,
//           home: const HomePage(),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_journal/THEME.dart';
import 'package:new_journal/datacontroller.dart';
import 'package:new_journal/db_helper.dart';
import 'package:new_journal/home.dart';
import 'package:new_journal/themeservice.dart';
import 'package:provider/provider.dart';
12
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DbHelper.initDb();
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => Datacontroller()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeProvider.themeData,
          home: const HomePage(),
        );
      },
    );
  }
}
