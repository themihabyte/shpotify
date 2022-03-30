import 'package:flutter/material.dart';
import 'package:shpotify/resources/resources.dart';

import '../entities/artist.dart';
import '../entities/list_item.dart';
import '../entities/playlist.dart';

class YourLibraryWidget extends StatefulWidget {
  YourLibraryWidget({Key? key}) : super(key: key);

  @override
  State<YourLibraryWidget> createState() => _YourLibraryWidgetState();
}

class _YourLibraryWidgetState extends State<YourLibraryWidget> {
  final _libraryList = <ListItem>[
    Playlist(1, AppImages.imagePlaceholder, 'Chillhop Radio', 'themihabyte'),
    Playlist(2, AppImages.imagePlaceholder, 'Jazz-Funk', 'themihabyte'),
    Artist(1, AppImages.macDemarco, 'Mac Demarco'),
    Artist(2, AppImages.metallica, 'Metallica'),
    Playlist(3, AppImages.imagePlaceholder, 'Pop music', 'themihabyte'),
    Artist(3, AppImages.bjorkPost, 'Bjork'),
    Artist(4, AppImages.megadeth, 'Megadeth'),
  ];

  var _filteredItems = <ListItem>[];
  final _searchController = TextEditingController();

  void _searchInLibrary() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredItems = _libraryList.where((item) {
        return item.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredItems = _libraryList;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredItems = _libraryList;
    _searchController.addListener(_searchInLibrary);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 120),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredItems.length,
            itemExtent: 96,
            itemBuilder: (BuildContext context, int index) {
              final item = _filteredItems[index];
              if (item is Artist) {
                final artist = item as Artist;
                return _ArtistRowItem(
                  artist: artist,
                );
              } else {
                final playlist = item as Playlist;
                return _PlaylistRowItem(playlist: playlist);
              }
            }),
        Padding(
          padding: const EdgeInsets.only(
              top: 60.0, bottom: 16.0, right: 16.0, left: 16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _ArtistRowItem extends StatefulWidget {
  final Artist artist;

  const _ArtistRowItem({Key? key, required this.artist}) : super(key: key);

  @override
  State<_ArtistRowItem> createState() => _ArtistRowItemState();
}

class _ArtistRowItemState extends State<_ArtistRowItem> {
  void _onArtistTap() {
    Navigator.of(context)
        .pushNamed('/main_screen/artist_page', arguments: widget.artist.id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 8.0, right: 12.0, bottom: 8.0),
              child: ClipOval(
                  child: Image(
                image: AssetImage(widget.artist.imageName),
              )),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.artist.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${widget.artist.description}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1.0)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    thickness: 2,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 16,
            )
          ],
        ),
        Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _onArtistTap,
              splashColor: Color.fromRGBO(30, 215, 96, 0.3),
              highlightColor: Color.fromRGBO(30, 215, 96, 0.1),
            )),
      ],
    );
  }
}

class _PlaylistRowItem extends StatelessWidget {
  final Playlist playlist;

  const _PlaylistRowItem({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 8.0, right: 12.0, bottom: 8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image(
                    image: AssetImage(playlist.imageName),
                  )),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playlist.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${playlist.description} • ${playlist.creator}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1.0)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    thickness: 2,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 16,
            )
          ],
        ),
        Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              splashColor: Color.fromRGBO(30, 215, 96, 0.3),
              highlightColor: Color.fromRGBO(30, 215, 96, 0.1),
            )),
      ],
    );
  }
}
