import 'package:binge_music/widgets/rootnav.dart';
import 'package:binge_music/widgets/themes.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() => runApp(MusicApp());

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //  DevicePreview(
        // enabled: true,
        // builder: (context)=> MaterialApp(
        //   useInheritedMediaQuery: true,
        //   home:RootNav(),),)
        MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootNav(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      // initialRoute: "/song_play",
      //   initialRoute: "/slider",
      routes: {
        //"/home": (context) => RootNav(),
        //"/song_play": (context) => CurrentSong(),

        //"/slider": (context) => SliderBar(              value: 0.0,            ),
        //   "/list": (context) => AllSongs(),
      },
    );
  }
}
