import 'dart:convert';
import 'package:binge_music/songsList.dart';
import 'package:binge_music/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListSong extends StatefulWidget {
  final Function miniPlayer;
  ListSong(this.miniPlayer);
  //const ListSong({Key? key}) : super(key: key);

  @override
  State<ListSong> createState() => _ListSongState();
}

class _ListSongState extends State<ListSong> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final listJson = await rootBundle.loadString("assets/files/songs.json");
    final decodeData = jsonDecode(listJson);
    var songsData = decodeData["songs"];

    SongsList.songs = List.from(songsData)
        .map<songItem>((item) => songItem.fromJson(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //For preventing size overflow when keyboard appears
      backgroundColor: Theme.of(context).canvasColor,
      //Searchbar
      appBar: SearchBar(
          backgroundColor: Theme.of(context).canvasColor,
          barColor: Theme.of(context).cardColor),
      //searchBar
      body: listBody(),
    );
  }

  Widget listBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 8.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Builder(builder: (context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                child: Text("Songs",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 17)));
          }),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: SongsList.songs.length,
                itemBuilder: (context, index) {
                  final songItem item = SongsList.songs[index];

                  return InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: (() {
                      widget.miniPlayer(item);
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Container(
                        height: 76,
                        child: Card(
                          color: Theme.of(context).cardColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  item.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    //  mainAxisSize:,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(item.artist,
                                          style:
                                              TextStyle(color: Colors.blueGrey))
                                    ],
                                  ),
                                ),
                              ),
                              Icon(Icons.favorite_border_outlined),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
