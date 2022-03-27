import 'package:flutter/material.dart';
import 'package:shpotify/resources/resources.dart';

class YourLibraryWidget extends StatelessWidget {
  const YourLibraryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
        itemExtent: 104,
        itemBuilder: (BuildContext context, int index) {
      return Stack(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 12.0, bottom: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                    child: Image(image: AssetImage(AppImages.imagePlaceholder),)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Chillhop Radio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black), overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 8,),
                  Text('by Chillhop Music',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Color.fromRGBO(50, 50, 50, 1.0)),),
                SizedBox(height: 8,),
                Divider(thickness: 2,)],),
              ),
              SizedBox(width: 16,)
            ],
          ),
          Material(color: Colors.transparent,
        child: InkWell(
            onTap: (){},
          )),
        ],
      );
    });
  }
}
