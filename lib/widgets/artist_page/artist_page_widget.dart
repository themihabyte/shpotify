import 'package:flutter/material.dart';
import 'package:shpotify/widgets/artist_page/artist_main_info_widget.dart';
import 'package:shpotify/widgets/artist_page/artist_page_action_menu_widget.dart';
import 'package:shpotify/widgets/artist_page/artist_page_albums_widget.dart';

class ArtistPageWidget extends StatefulWidget {
  final int artistId;
  const ArtistPageWidget({Key? key, required this.artistId}) : super(key: key);

  @override
  State<ArtistPageWidget> createState() => _ArtistPageWidgetState();
}

class _ArtistPageWidgetState extends State<ArtistPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [ArtistMainInfoWidget(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ArtistPageActionMenuWidget(),
        ),
        ArtistPageAlbumsWidget()],
      ),
    );
  }
}
