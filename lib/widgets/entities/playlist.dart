import 'list_item.dart';

class Playlist extends ListItem {
  final String creator;

  Playlist(int id, String imageName, String title, this.creator)
      : super(
    id,
    imageName,
    title,
  ) {
    description = 'Playlist';
  }
}