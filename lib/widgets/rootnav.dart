import 'package:binge_music/pages/current_song.dart';
import 'package:binge_music/songsList.dart';
import 'package:binge_music/widgets/bottom_sheet.dart';
import 'package:binge_music/pages/favorites.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
//import 'package:hexcolor/hexcolor.dart'; //hexcolor package//String textColor = ColorToHex(Colors.teal).toString();
import '../pages/home.dart';
import '../pages/list.dart';

class RootNav extends StatefulWidget {
  const RootNav({Key? key}) : super(key: key);

  @override
  State<RootNav> createState() => _RootNavState();
}

class _RootNavState extends State<RootNav> {
  double screenHeight = 0;
  double screenWidth = 0;
  AudioPlayer _audioPlayer = AudioPlayer();
  // final _audioPlayer = AudioCache();
  bool isPlaying = false;
  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  songItem? item;
  Widget miniPlayer(songItem? item, {bool stop = false}) {
    this.item = item;

    if (item == null) {
      return SizedBox();
    }

    if (stop) {
      //To stop existing song that is playing
      //In case we click on new song
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {});
    return Column(mainAxisSize: MainAxisSize.min, children: [
      AnimatedContainer(
        duration: const Duration(microseconds: 500),
        color: Theme.of(context).cardColor,
        width: screenWidth,
        height: screenHeight * 0.1 / 1.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  //  mainAxisSize:,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(item.artist, style: TextStyle(color: Colors.blueGrey))
                  ],
                ),
              ),
            ),
            IconButton(
              icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
              onPressed: () async {
                setState(() {
                  isPlaying = !isPlaying;
                });

                if (isPlaying) {
                  await _audioPlayer.setAsset(item.song, preload: true);
                  await _audioPlayer.play();
                } else {
                  await _audioPlayer.pause();
                }
              },
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  void initState() {
    super.initState();

    Tabs = [Home(), ListSong(miniPlayer), Favorites()];
  }

  var Tabs = [];
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset:
          false, //For preventing size overflow when keyboard appears
      bottomNavigationBar: getFooter(),
      body: Tabs[currentTabIndex],
      // getBody(),
    );
  }

  // code for footer
  Widget getFooter() {
    List items = [
      Icons.home_filled,
      Icons.music_note,
      Icons.favorite,
      Icons.settings
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    CurrentSong(item, _audioPlayer, isPlaying),
              ));
            },
            child: miniPlayer(item)),
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  topLeft: Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.5))
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(items.length, (index) {
                  //lis.generate usedToCreateList

                  return IconButton(
                      icon: Icon(
                        items[index],
                        color: currentTabIndex == index
                            ? Theme.of(context).iconTheme.color
                            : Theme.of(context)
                                .colorScheme
                                .secondary, //LogicForChangingNavIconsGreenOnClick
                      ),
                      onPressed: () {
                        if (index == 3) {
                          SettingsBottomSheet(context);
                          //Calling BOTTOM SHEET ON SETTINGS
                        } else {
                          setState(() {
                            currentTabIndex = index;
                          });
                        }
                      });
                })),
          ),
        ),
      ],
    );
  }
}
