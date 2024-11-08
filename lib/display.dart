// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_journal/data.dart';
//
// class DataDisplayWidget extends StatefulWidget {
//   final Data data;
//
//   DataDisplayWidget({required this.data, super.key});
//
//   @override
//   State<DataDisplayWidget> createState() => DataDisplayWidgetState();
// }
//
// class DataDisplayWidgetState extends State<DataDisplayWidget> {
//   final List<String> _moods = [
//     'lib/icons/smile.png',
//     'lib/icons/smile2.png',
//     'lib/icons/smile3.png',
//     'lib/icons/smile4.png',
//     'lib/icons/smile5.png',
//   ];
//
//   final List<Color> _moodColors = [
//     Colors.red,
//     Colors.orange,
//     Colors.yellow,
//     Colors.lightGreen,
//     Colors.green,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     int moodIndex = widget.data.mood ?? 0; // default to 0 if mood is null
//     Color moodColor = _moodColors[moodIndex];
//
//     return Expanded(
//       child: Container(
//         // height: 250,
//         width: 375,
//         margin: const EdgeInsets.all(16),
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.primary,
//             borderRadius: BorderRadius.circular(20),
//             gradient: LinearGradient(
//                 colors: Get.isDarkMode
//                     ? [moodColor.withOpacity(0.5), moodColor.withOpacity(0.2)]
//                     : [
//                         moodColor.withOpacity(1),
//                         moodColor.withOpacity(0.7),
//                         moodColor.withOpacity(0.5),
//                       ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomLeft)
//             // border: Border.all(color: moodColor, width: 3),
//             // boxShadow: [
//             //   BoxShadow(
//             //     color: Colors.grey.shade500,
//             //     spreadRadius: 1.0,
//             //     blurRadius: 5,
//             //     offset: const Offset(4.0, 4.0),
//             //   ),
//             //   BoxShadow(
//             //     color: moodColor,
//             //     spreadRadius: 1.0,
//             //     blurRadius: 5.0,
//             //     offset: const Offset(-4.0, -4.0),
//             //   ),
//             // ],
//             ),
//         child: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Title: ${widget.data.title ?? ""}',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//                   overflow: TextOverflow.visible,
//                   maxLines: 100,
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Date: ${widget.data.date ?? ""}',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Time: ${widget.data.time ?? ""}',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Mood: ${widget.data.mood ?? ""}',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//                 ),
//               ],
//             ),
//             ClipRRect(
//               child: Container(
//                 margin: EdgeInsets.only(left: 100),
//                 child: Image.asset(
//                   _moods[moodIndex],
//                   height: 50,
//                   width: 50,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journal/data.dart';

class DataDisplayWidget extends StatefulWidget {
  final Data data;

  DataDisplayWidget({required this.data, super.key});

  @override
  State<DataDisplayWidget> createState() => DataDisplayWidgetState();
}

class DataDisplayWidgetState extends State<DataDisplayWidget> {
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

  @override
  Widget build(BuildContext context) {
    int moodIndex = widget.data.mood ?? 0; // default to 0 if mood is null
    Color moodColor = _moodColors[moodIndex];

    return Expanded(
      child: Container(
        width: 375,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: Get.isDarkMode
                ? [moodColor.withOpacity(0.5), moodColor.withOpacity(0.2)]
                : [
                    moodColor.withOpacity(0.8),
                    // moodColor.withOpacity(0.7),
                    // moodColor.withOpacity(0.5),
                    moodColor
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.data.title ?? ""}',
                    style: TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    overflow: TextOverflow.visible,
                    maxLines: 100,
                  ),
                  const SizedBox(height: 8),
                  // Text(
                  //   'Date: ${widget.data.date ?? ""}',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     color: Theme.of(context).colorScheme.onBackground,
                  //   ),
                  // ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 25,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.data.time ?? ""}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            ClipRRect(
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: Image.asset(
                  _moods[moodIndex],
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
