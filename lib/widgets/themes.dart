import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      cardColor: lightGreyish,
      canvasColor: Colors.white,
      fontFamily: "Inter",
      iconTheme: IconThemeData(color: purple),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      cardColor: greyish,
      canvasColor: Colors.black,
      fontFamily: "Inter",
      iconTheme: IconThemeData(color: green),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white));

  static Color greyish = HexColor("#242830");
  static Color lightGreyish = HexColor("#E4E6EB");
  static Color green = HexColor("#01C58A");
  static Color purple = HexColor("#9237FF");
}
