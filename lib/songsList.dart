class SongsList {
  static List<songItem> songs = [];
}

class songItem {
  late int id;
  late String name;
  late String artist;
  late String image;
  late String song;

  songItem(
      {required this.id,
      required this.name,
      required this.artist,
      required this.image,
      required this.song});

  songItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    artist = json['artist'];
    image = json['image'];
    song = json['song'];
  }
  toJson() => {
        "id": id,
        "name": name,
        "artist": artist,
        "image": image,
        "song": song,
      };
}
