import 'package:flutter/material.dart';
import 'package:shpotify/resources/resources.dart';

class ArtistPageAlbumsWidget extends StatelessWidget {
  const ArtistPageAlbumsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Albums',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(
                child: Container(
              height: 1,
              color: Colors.black,
            )),
          ],
        ),
        SizedBox(height: 8,),
        SizedBox(
          height: 184,
          child: Scrollbar(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(child: Image(image: AssetImage(AppImages.macDemarcoAlbumThisOldDog)), borderRadius: BorderRadius.circular(12.0),),
                      SizedBox(height: 4,),
                      Text('2017 • Album', maxLines: 1, overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                );
              },
              itemCount: 6,
              itemExtent: 150,
              scrollDirection: Axis.horizontal,
            ),
          ),
        )
      ],
    );
  }
}
