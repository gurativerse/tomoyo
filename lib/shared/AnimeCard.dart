import 'package:flutter/material.dart';
import '../theme.dart';
import '../client/AnimeInfo.dart';

class AnimeCard extends StatelessWidget {
  final animeId;
  final String animeOriginalName;
  final String animeEngName;
  final String animePoster;
  // final String availablePlatform;

  const AnimeCard({
    Key? key,
    required this.animeId,
    required this.animeOriginalName,
    required this.animeEngName,
    required this.animePoster,
    // required this.availablePlatform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AnimeInfoPage(
                        animeId: animeId,
                        animeOriginalName: animeOriginalName,
                        animeEngName: animeEngName,
                        animePoster: animePoster,
                      )));
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(animePoster),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 25,
                        height: 25,
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 12.0),
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(ColorPalatte.color['shadow']!),
                      ),
                      text: animeOriginalName),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 12.0),
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      text: animeEngName),
                ),
              ),
            ],
          ),
        ));
  }
}
