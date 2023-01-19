import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //For preventing size overflow when keyboard appears
      backgroundColor: Theme.of(context).canvasColor,
      body: getBody(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          "Favorites",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}

Widget getBody() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Builder(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Sort by',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 17),
                    ),
                    IconButton(
                        icon: Icon(Icons.arrow_drop_down_rounded),
                        onPressed: () {},
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'View by',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 17),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_drop_down_rounded),
                      onPressed: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    )
                  ],
                )
              ],
            );
          }),
        ),
      ),
      Expanded(
          flex: 9,
          child: Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(9, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Builder(builder: (context) {
                              return Container(
                                width: 400,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          )),
    ],
  );
}
