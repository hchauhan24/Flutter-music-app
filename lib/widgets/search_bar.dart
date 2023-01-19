import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final Color barColor;

  const SearchBar({
    Key? key,
    required this.backgroundColor,
    required this.barColor,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(68.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //code for search bar

      backgroundColor: backgroundColor,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: HexColor("#8F959E"), fontSize: 15),
                prefixIcon: Icon(
                  Icons.search,
                  color: HexColor("#8F959E"),
                  size: 25,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: barColor),
          ),
        ),
      ),
    );
    //searchBar
  }
}
