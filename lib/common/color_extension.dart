// import 'package:flutter/material.dart';
//
// class TColor {
//   static Color get primary => const Color(0xff5E00F5);
//   static Color get primary500 => const Color(0xff7722FF );
//   static Color get primary20 => const Color(0xff924EFF);
//   static Color get primary10 => const Color(0xffAD7BFF);
//   static Color get primary5 => const Color(0xffC9A7FF);
//   static Color get primary0 => const Color(0xffE4D3FF);
//
//   static Color get secondary => const Color(0xffFF7966);
//   static Color get secondary50 => const Color(0xffFFA699);
//   static Color get secondary0 => const Color(0xffFFD2CC);
//
//   static Color get secondaryG => const Color(0xff00FAD9);
//   static Color get secondaryG50 => const Color(0xff7DFFEE);
//
//   static Color get gray => const Color(0xff0E0E12);
//   static Color get gray80 => const Color(0xff1C1C23);
//   static Color get gray70 => const Color(0xff353542);
//   static Color get gray60 => const Color(0xff4E4E61);
//   static Color get gray50 => const Color(0xff666680);
//   static Color get gray40 => const Color(0xff83839C);
//   static Color get gray30 => const Color(0xffA2A2B5);
//   static Color get gray20 => const Color(0xffC1C1CD);
//   static Color get gray10 => const Color(0xffE0E0E6);
//
//   static Color get border => const Color(0xffCFCFFC);
//   static Color get primaryText => Colors.white;
//   static Color get secondaryText => gray60;
//
//   static Color get white => Colors.white;
// }

import 'package:flutter/material.dart';

class TColor {
  // Accent Colors (based around #FF6203 - a shade of orange)
  static Color get primary => const Color(0xFFFF6203);  // Main accent color
  static Color get primary500 => const Color(0xFFFF7A33);
  static Color get primary20 => const Color(0xFFFF9253);
  static Color get primary10 => const Color(0xFFFFAB73);
  static Color get primary5 => const Color(0xFFFFC393);
  static Color get primary0 => const Color(0xFFFFDBB3);

  static Color get secondary => const Color(0xFFFF7966);  // Secondary orange shade
  static Color get secondary50 => const Color(0xFFFFA699);
  static Color get secondary0 => const Color(0xFFFFD2CC);

  // Gradient Accent Color (orange-themed gradient, replacing secondaryG)
  static Color get secondaryG => const Color(0xFFFF8A34);
  static Color get secondaryG50 => const Color(0xFFFFA867);

  // Neutral Grays (unchanged)
  static Color get gray => const Color(0xff0E0E12);
  static Color get gray80 => const Color(0xff1C1C23);
  static Color get gray70 => const Color(0xff353542);
  static Color get gray60 => const Color(0xff4E4E61);
  static Color get gray50 => const Color(0xff666680);
  static Color get gray40 => const Color(0xff83839C);
  static Color get gray30 => const Color(0xffA2A2B5);
  static Color get gray20 => const Color(0xffC1C1CD);
  static Color get gray10 => const Color(0xffE0E0E6);

  // Background Colors (light shades of white)
  static Color get background => const Color(0xFFF7F7F7); // Main background, a light white shade
  static Color get background50 => const Color(0xFFF0F0F0); // Slightly darker white

  // Border Color
  static Color get border => const Color(0xFFE0E0E6); // Light gray border

  // Text Colors
  static Color get primaryText => Colors.black; // Black for dark text on light backgrounds
  static Color get secondaryText => Colors.white; // White text for use on orange background

  // Utility Colors
  static Color get white => Colors.white;
}
