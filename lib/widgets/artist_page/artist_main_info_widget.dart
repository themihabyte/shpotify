import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shpotify/resources/resources.dart';

class ArtistMainInfoWidget extends StatelessWidget {
  const ArtistMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TopPosterWidget();
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image(image: AssetImage(AppImages.macDemarco)),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Mac Demarco', style: TextStyle(color: Colors.white, fontSize: 48.0, fontWeight: FontWeight.w800)),
        ),

      ],
    );
  }
}
