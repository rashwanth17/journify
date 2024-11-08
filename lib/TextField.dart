// import 'package:flutter/material.dart';
// import 'package:new_journal/THEME.dart';
//
// class Textfield extends StatelessWidget {
//   final String title;
//   final String hint;
//   final TextEditingController? controller;
//   final Widget? widget;
//   Textfield(
//       {super.key,
//       required this.title,
//       required this.hint,
//       this.controller,
//       this.widget});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // margin: EdgeInsets.only(
//       //   top: 16,
//       // ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: subheading,
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 18),
//             // height: 100,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: controller,
//                     readOnly: widget == null ? false : true,
//                     decoration: InputDecoration(
//                       hintText: hint,
//                       fillColor: Colors.grey[200],
//                       hintStyle: TextStyle(
//                         color: Theme.of(context).colorScheme.onBackground,
//                       ),
//                       labelStyle: TextStyle(
//                         color: Theme.of(context).colorScheme.onBackground,
//                       ),
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(
//                           color: Colors.blue,
//                         ),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                           vertical: 20, horizontal: 16),
//                     ),
//                   ),
//                 ),
//                 widget == null
//                     ? Container()
//                     : Container(
//                         child: widget,
//                       )
//
//                 //     child: TextFormField(
//                 //   autofocus: false,
//                 //   controller: controller,
//                 //   style: subheading,
//                 //   decoration: InputDecoration(
//                 //       hintText: hint,
//                 //       hintStyle: hintheading,
//                 //       focusedBorder: UnderlineInputBorder(
//                 //         borderSide: BorderSide(color: Colors.grey),
//                 //       )),
//                 // ))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  Textfield({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20,
              ) // Use theme or hardcode style
              ),
          Container(
            margin: const EdgeInsets.only(top: 18),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    readOnly: widget == null ? false : true,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      fillColor: Theme.of(context).colorScheme.surface,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                    ),
                  ),
                ),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
