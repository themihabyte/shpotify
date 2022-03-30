import 'package:flutter/material.dart';

class ArtistPageActionMenuWidget extends StatelessWidget {
  const ArtistPageActionMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text('10,032,047 monthly listeners'),
        SizedBox(height: 4,),
        Row(children: [
          OutlinedButton(onPressed: (){}, child: Text('Follow'), style: OutlinedButton.styleFrom(
              primary: Colors.black,
              side: BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0)), )
          ),),
          SizedBox(width: 8,),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
          Expanded(child: SizedBox()),
          ElevatedButton(onPressed: (){}, child: Icon(Icons.play_arrow_rounded),
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(30, 215, 96, 1.0),
                onPrimary: Colors.white,
                shape: CircleBorder(),
                elevation: 0.0
            ),)
        ],)],
    );
  }
}