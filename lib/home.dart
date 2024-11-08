// import 'package:date_picker_timeline/date_picker_timeline.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:new_journal/THEME.dart';
// import 'package:new_journal/buttons.dart';
// import 'package:new_journal/data.dart';
// import 'package:new_journal/datacontroller.dart';
// import 'package:new_journal/display.dart';
// import 'package:new_journal/edit.dart';
// import 'package:new_journal/entry.dart';
// import 'package:new_journal/themeservice.dart';
// import 'package:provider/provider.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final _datacontroller = Get.put(Datacontroller());
//   final DatePickerController _controller = DatePickerController();
//   DateTime today = DateTime.now();
//   DateTime startDate = DateTime(2024, 1, 1); // Starting from January 1, 2004
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _scrollToToday();
//     });
//   }
//
//   void _scrollToToday() {
//     _controller.animateToDate(
//       today,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appbar(),
//       body: Container(
//         color: Theme.of(context).colorScheme.background,
//         child: Column(
//           children: [
//             _addTask(),
//             Container(
//               margin: const EdgeInsets.only(left: 20, right: 20),
//               child: DatePicker(
//                 startDate, // Start from January 1, 2004
//                 height: 100,
//                 width: 80,
//                 initialSelectedDate:
//                     today, // Set initial selected date to today
//                 selectionColor: Theme.of(context).colorScheme.secondary,
//                 selectedTextColor: Theme.of(context).colorScheme.onPrimary,
//                 // dateTextStyle: Theme.of(context).textTheme.bodyLarge,
//                 dateTextStyle: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   // color: Colors.teal,
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//                 controller: _controller,
//                 onDateChange: (date) {
//                   setState(() {
//                     today = date;
//                     _datacontroller.getDataForDate(DateFormat.yMMMMd()
//                         .format(date)); // Fetch entries for the selected date
//                   });
//                 },
//                 // Note: The DatePicker will allow swiping back to previous dates
//               ),
//             ),
//             _show(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _show() {
//     return Expanded(
//       child: Obx(() {
//         return ListView.builder(
//           itemCount: _datacontroller.dataList.length,
//           itemBuilder: (context, index) {
//             final entry = _datacontroller.dataList[index];
//             return AnimationConfiguration.staggeredList(
//                 position: index,
//                 child: SlideAnimation(
//                     child: FadeInAnimation(
//                         child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         _showBottonSheet(context, entry, index);
//                       },
//                       child: DataDisplayWidget(data: entry),
//                     )
//                   ],
//                 ))));
//           },
//         );
//       }),
//     );
//   }
//
//   _showBottonSheet(BuildContext context, Data data, index) {
//     Get.bottomSheet(Container(
//       color: Theme.of(context).colorScheme.background,
//       width: MediaQuery.of(context).size.height * 0.50,
//       padding: const EdgeInsets.only(top: 10),
//       height: MediaQuery.of(context).size.height * 0.15,
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: () {
//               _datacontroller.delete(_datacontroller.dataList[index]);
//               _datacontroller.getData();
//               Get.back();
//             },
//             child: Container(
//               margin: const EdgeInsets.only(left: 10, right: 10),
//               height: 50,
//               width: 400,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.onSurface,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                   child: Text(
//                 "DELETE",
//                 style: subheading,
//               )),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           GestureDetector(
//             onTap: () {
//               Get.to(() => EditEntry(
//                   data: _datacontroller.dataList[index], index: index));
//               _datacontroller.getData();
//               // _datacontroller.delete(_datacontroller.dataList[index]);
//               // _datacontroller.getData();
//             },
//             child: Container(
//               margin: const EdgeInsets.only(left: 10, right: 10),
//               height: 50,
//               width: 400,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.onSurface,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                   child: Text(
//                 "EDIT",
//                 style: subheading,
//               )),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
//
//   Widget _addTask() {
//     return Container(
//       margin: const EdgeInsets.only(left: 20, right: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 DateFormat.yMMMMd().format(today),
//                 style: heading,
//               ),
//               // Text(
//               //   "TODAY",
//               //   style: subheading,
//               // ),
//             ],
//           ),
//           MyButtons(
//               label: "ENTER JOURNAL",
//               ontap: () {
//                 Get.to(() => const Entry());
//                 _datacontroller.getData();
//               }),
//         ],
//       ),
//     );
//   }
//
//   _appbar() {
//     return AppBar(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       elevation: 0,
//       leading: GestureDetector(
//         onTap: () {
//           Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
//         },
//         child: Icon(
//           Get.isDarkMode ? Icons.sunny : Icons.nightlight_outlined,
//           size: 30,
//           color: Get.isDarkMode ? Colors.yellow : Colors.black,
//         ),
//       ),
//       actions: [
//         const CircleAvatar(
//           backgroundImage: AssetImage("images/profile.jpg"),
//           radius: 23,
//         ),
//         const SizedBox(width: 20),
//       ],
//     );
//   }
// }

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_journal/THEME.dart';
import 'package:new_journal/buttons.dart';
import 'package:new_journal/data.dart';
import 'package:new_journal/datacontroller.dart';
import 'package:new_journal/display.dart';
import 'package:new_journal/edit.dart';
import 'package:new_journal/entry.dart';
import 'package:new_journal/themeservice.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _moods = [
    'lib/icons/smile.png',
    'lib/icons/smile2.png',
    'lib/icons/smile3.png',
    'lib/icons/smile4.png',
    'lib/icons/smile5.png',
  ];

  final List<Color> _moodColors = [
    Colors.green,
    Colors.lightGreen,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];
  final _datacontroller = Get.put(Datacontroller());
  final DatePickerController _controller = DatePickerController();
  DateTime today = DateTime.now();
  DateTime startDate = DateTime(2024, 1, 1); // Starting from January 1, 2004

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToToday();
      Provider.of<Datacontroller>(context, listen: false)
          .fetchDataByDate(DateFormat.yMMMMd().format(today));
    });
  }

  void _scrollToToday() {
    _controller.animateToDate(
      today,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            _addTask(),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: DatePicker(
                startDate,
                height: 100,
                width: 80,
                initialSelectedDate:
                    today, // Set initial selected date to today
                selectionColor: Theme.of(context).colorScheme.secondary,
                selectedTextColor: Theme.of(context).colorScheme.onPrimary,
                monthTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                dayTextStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                dateTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.surface,
                ),
                controller: _controller,
                onDateChange: (date) {
                  setState(() {
                    today = date;
                    Provider.of<Datacontroller>(context, listen: false)
                        .fetchDataByDate(DateFormat.yMMMMd().format(date));
                  });
                },
                // Note: The DatePicker will allow swiping back to previous dates
              ),
            ),
            _show(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.to(() => Entry());
          Provider.of<Datacontroller>(context, listen: false).fetchData();
        },
        child: Icon(
          Icons.add,
          size: 40,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }

  _show() {
    return Expanded(
      child: Consumer<Datacontroller>(
        builder: (context, dataProvider, child) {
          return ListView.builder(
            itemCount: dataProvider.dataList.length,
            itemBuilder: (context, index) {
              final entry = dataProvider.dataList[index];
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                          child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // _showBottonSheet(context, entry, index);
                          _showBottonSheet(context, entry, index);
                          // Navigator.pop(context);
                        },
                        child: DataDisplayWidget(data: entry),
                      )
                    ],
                  ))));
            },
          );
        },
      ),
    );
  }

  _showDialogBox(BuildContext context, Data data, index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: _moodColors[index].withOpacity(1),
            actions: [
              ClipRRect(
                child: Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Image.asset(
                    _moods[index],
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Provider.of<Datacontroller>(context, listen: false)
                            .deleteData(data);
                        Get.back();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "DELETE",
                          style: subheading,
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => EditEntry(data: data, index: index));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "EDIT",
                          style: subheading,
                        )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  _showBottonSheet(BuildContext context, Data data, index) {
    Get.bottomSheet(Container(
      color: Theme.of(context).colorScheme.background,
      width: MediaQuery.of(context).size.height * 0.50,
      padding: const EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<Datacontroller>(context, listen: false)
                  .deleteData(data);
              Get.back();
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                "DELETE",
                style: subheading,
              )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => EditEntry(data: data, index: index));
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                "EDIT",
                style: subheading,
              )),
            ),
          )
        ],
      ),
    ));
  }

  _addTask() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(today),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // MyButtons(
          //     label: "+ Add Task",
          //     ontap: () async {
          //       await Get.to(() => Entry());
          //       Provider.of<Datacontroller>(context, listen: false).fetchData();
          //     })
        ],
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        },
        child: Icon(
          Get.isDarkMode ? Icons.sunny : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.yellow : Colors.black,
        ),
      ),
      actions: const [
        Text(
          "𝓙",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        SizedBox(
          width: 40,
        )
      ],
    );
  }
}
