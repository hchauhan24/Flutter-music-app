import 'package:flutter/material.dart';
import 'package:binge_music/widgets/search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //For preventing size overflow when keyboard appears
      backgroundColor: Theme.of(context).canvasColor,
      //SearchBar
      appBar: SearchBar(
          backgroundColor: Theme.of(context).canvasColor,
          barColor: Theme.of(context).cardColor),
      body: getBody(),
    );
  }
}

Widget getBody() {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 20,
      ),
      Expanded(
          flex: 2,
          child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Builder(builder: (context) {
                            return Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10),
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
          )),
      Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                child: Text(
                  'Most Played',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 19),
                ),
              )
            ],
          ),
        );
      }),
      Expanded(
        flex: 7,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(10, (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Builder(builder: (context) {
                        var size = MediaQuery.of(context).size.width;
                        return Container(
                          width: size,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(10),
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
      )
    ],
  );
}
