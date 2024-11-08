import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class Themes {
//   static final light = ThemeData(
//     primaryColor: Colors.white, // Primary white color
//     secondaryHeaderColor: Colors.white, // White background
//     textTheme: TextTheme(
//       bodyLarge: TextStyle(color: Colors.black), // Black text
//     ),
//     hintColor: Colors.black, // Hint color
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.white, // AppBar background white
//       titleTextStyle: TextStyle(
//         color: Colors.black, // AppBar title text black
//         fontSize: 20,
//       ),
//       iconTheme: IconThemeData(
//         color: Colors.black, // AppBar icon black
//       ),
//     ),
//   );

//   static final dark = ThemeData(
//     primaryColor: Colors.black, // Primary black color
//     secondaryHeaderColor: Colors.black, // Black background
//     textTheme: TextTheme(
//       bodyLarge: TextStyle(color: Colors.white), // White text
//     ),
//     hintColor: Colors.white, // Hint color
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.black, // AppBar background black
//       titleTextStyle: TextStyle(
//         color: Colors.white, // AppBar title text white
//         fontSize: 20,
//       ),
//       iconTheme: IconThemeData(
//         color: Colors.white, // AppBar icon white
//       ),
//     ),
//   );
// }

TextStyle get subheading {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    // color: Colors.redAccent,
    color: Colors.grey.shade400,
  ));
}

TextStyle get heading {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    color: Colors.grey[700],
    fontWeight: FontWeight.bold,
    fontSize: 30,
  ));
}

TextStyle get hintheading {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    color: Colors.grey[300],
    // fontWeight: FontWeight.bold,
    fontSize: 20,
  ));
}
