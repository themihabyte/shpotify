import 'list_item.dart';

class Artist extends ListItem {
  Artist(
      int id,
      String imageName,
      String title,
      ) : super(
    id,
    imageName,
    title,
  ) {
    description = 'Artist';
  }
}