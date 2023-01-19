import 'package:binge_music/songsList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';

class CurrentSong extends StatefulWidget {
  final songItem? item;
  final AudioPlayer? _audioPlayer;
  final bool? isPlaying;
  CurrentSong(this.item, this._audioPlayer, this.isPlaying);

  @override
  State<CurrentSong> createState() => _SongPlayState();
}

class _SongPlayState extends State<CurrentSong> {


  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Duration position = widget._audioPlayer!.position;
    Duration? duration = widget._audioPlayer?.duration;
    var isPlaying = widget.isPlaying;
  

    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Playing',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 45,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          backgroundColor: Theme.of(context).canvasColor,
        ),
        body: Builder(builder: (context) {
          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        height: 220,
                        width: 220,
                        widget.item!.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.item!.name,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 20),
                    ),
                    Text(
                      widget.item!.artist,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).cardColor,
                          ),
                          child: IconButton(
                            color: Theme.of(context).colorScheme.secondary,
                            icon: Icon(FontAwesomeIcons.sliders),
                            onPressed: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).cardColor,
                          ),
                          child: IconButton(
                            icon: Icon(
                              color: Theme.of(context).colorScheme.secondary,
                              Icons.playlist_add,
                              size: 35,
                            ),
                            onPressed: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).cardColor,
                          ),
                          child: IconButton(
                            color: Theme.of(context).colorScheme.secondary,
                            icon: Icon(Icons.favorite),
                            onPressed: () {
                              setState(() {});
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).cardColor,
                          ),
                          child: IconButton(
                            color: Theme.of(context).colorScheme.secondary,
                            icon: Icon(FontAwesomeIcons.wandMagicSparkles),
                            onPressed: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
           
                    Slider(
                      min: 0,
                      max: 100,
                      value: 40,
                      onChanged: (value) {
                        setState(() {
                          value = value;
                        });
                      },
                      activeColor: Theme.of(context).iconTheme.color,
                      inactiveColor: Theme.of(context).cardColor,
                      thumbColor: Colors.transparent,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        Text(
                          "${duration?.inMinutes}:${duration?.inSeconds.remainder(60)}",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          color: Theme.of(context).colorScheme.secondary,
                          icon: Icon(
                            Icons.repeat,
                          ),
                          onPressed: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        IconButton(
                          color: Theme.of(context).colorScheme.secondary,
                          icon: Icon(
                            Icons.skip_previous,
                            size: 40,
                          ),
                          onPressed: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).iconTheme.color,
                          child: IconButton(
                            icon: isPlaying == true
                                ? Icon(
                                    Icons.pause,
                                    size: 30,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.play_arrow,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                            onPressed: () async {
                              if (isPlaying == false) {
                                setState(() {
                                  isPlaying = true;
                                });

                                await widget._audioPlayer!
                                    .setAsset(widget.item!.song);
                                await widget._audioPlayer!.play();
                              } else {
                                await widget._audioPlayer!.pause();
                                setState(() {
                                  isPlaying = false;
                                });
                              }
                            },
                          ),
                        ),
                        IconButton(
                          color: Theme.of(context).colorScheme.secondary,
                          icon: Icon(
                            Icons.skip_next,
                            size: 40,
                          ),
                          onPressed: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        IconButton(
                          color: Theme.of(context).colorScheme.secondary,
                          icon: Icon(Icons.shuffle),
                          onPressed: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        }));
  }
}
